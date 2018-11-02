#include "../../stm32lib/drivers/stm32f10x/clock.h"
#include "../../stm32lib/drivers/stm32f10x/timer.h"
#include "../../stm32lib/drivers/stm32f10x/spi.h"
#include "../../stm32lib/drivers/stm32f10x/gpio.h"
#include "../../stm32lib/drivers/stm32f10x/dma.h"

#include <queue.h>
template<typename T>
struct Measure
{
    uint32_t stamp;
    T value;
};

Queue<Measure<int32_t>, 64> queue;

extern "C" {
int32_t readAverageForce(int32_t *result)
{
    Measure<int32_t> m;
    int64_t sum = 0;
    size_t count = 0;
    while(queue.pop(&m)) {
        sum += m.value;
        count++;
    }
    if (count) {
        *result = sum / count;
        return 1;
    } else return 0;
}
}

//char buf1[128], buf2[128];
//TIM_TypeDef t3;
RCC_TypeDef *rcc_ = RCC;
AFIO_TypeDef *afio = AFIO;
TIM_TypeDef *t3, *t2;
SPI_TypeDef *sp = SPI1;
DMA_Channel_TypeDef *dc;

uint8_t rd1, rd2, rd3;
uint8_t data[4];

typedef Pin<uintptr_t(GPIOB), 6> ClockPin;
typedef Pin<uintptr_t(GPIOB), 5> MOSIPin;
typedef Pin<uintptr_t(GPIOB), 3> SCKPin;


template<class SPI, class GateTimer, int GateTriggerIdx, class ClockTimer, int clockTimerChannel>
class HX711
{
private:
    typedef TimerChannel<ClockTimer, clockTimerChannel> ClockTimerChannel;
    typedef TimerChannel<GateTimer, 1> GateTimerChannel;
    typedef TimerChannel<GateTimer, GateTriggerIdx> GateTriggerChannel;
    typedef TimerChannel<GateTimer, 3> GateEndChannel;
    using spiParams = Reduce<
        spi_::Enable<true>, spi_::Slave<spi_::InternalSelect<true>>, 
        spi_::ClockPolarity<0>, spi_::ClockPhase<2>, spi_::ReceiveOnly/*,
        ToMemory<uint8_t, (uintptr_t)0, 4, dma_::Enable<true>>*/>;
public:
    static inline void disable() { disableDevices<ClockTimer, GateTimer, SPI>(); }
    static void initTimers(int extra, int delay)
    {
        using namespace tim_;
        constexpr uint32_t freq = 500000;
        GateTriggerChannel::template configureInput<Invert<true>>();
        GateTimer::template setSource<Trigger<GateTriggerChannel>>();
        GateTimer::template configure<Disable, OnePulse<true>, SendCompare<GateTimerChannel>>();
        GateTimerChannel::template configureOutput<PWM2/*, EnableIO<true>*/>();
        GateTimerChannel::ccr() = delay;
        //GateEndChannel::template configureOutput<Frozen>();
        //GateEndChannel::ccr() = 23 + delay + extra;
        
        GateTimer::template setFrequency<freq>();
        GateTimer::top() = 23 + delay + extra;
        GateTimer::update();
        TIM3->SR &= ~(TIM_SR_UIF | TIM_SR_CC3IF);
        NVIC_EnableIRQ(TIM3_IRQn);
        TIM3->DIER |= TIM_DIER_UIE; // TIM_DIER_CC3IE;
        //t3 = GateTimer::p();

        ClockTimer::template setFrequency<freq * 2>();
        ClockTimer::top() = 1;
        ClockTimer::template setSource<Gated<GateTimer>>();
        ClockTimerChannel::ccr() = 1;
        ClockTimerChannel::template configureOutput<PWM2, EnableIO<true>>();
        ClockTimer::template configure<Enable>();
        ClockTimer::update();        
    }
    void init(int extra = 1, int delay = 5)
    {
        dc = DMA1_Channel2;
        rcc_ = RCC;
        afio = AFIO;
        t3 = TIM3;
        t2 = TIM2;
        enableDevices<ClockTimer, GateTimer, SPI>();
        initTimers(extra, delay);
        {
            using namespace spi_;
            DMA1_Channel2->CCR = DMA_CCR_MINC;// |  ~DMA_CCR_EN;
            DMA1_Channel2->CMAR = (uint32_t)&data;
            DMA1_Channel2->CPAR = (uint32_t)&SPI1->DR;
            DMA1_Channel2->CNDTR = 3;
            SPI::template configure<spiParams>();
            SPI1->CR2 |= SPI_CR2_RXDMAEN;
            //SPI::template setBoudrate<562500>();
            DMA1_Channel2->CCR |= DMA_CCR_EN;
        }
    }
    void onIRQ()
    {
        SPI::template configure<spi_::Slave<spi_::InternalSelect<false>>>();
        int32_t result = (int16_t(int8_t(data[0])) << 16) | (data[1] << 8) | data[2];
        queue.push({HAL_GetTick(), result});
        //if (queue.length() > 2)
            //while(1);
        DMA1_Channel2->CCR &= ~DMA_CCR_EN;
        DMA1_Channel2->CNDTR = 3;
        DMA1_Channel2->CCR |= DMA_CCR_EN;
        SPI::template configure<spi_::Slave<spi_::InternalSelect<true>>>();
    }
    uint32_t poll()
    {
        if (DMA1_Channel2->CNDTR > 0)
            return 0;
        uint32_t result = (data[0] << 16) | (data[1] << 8) | data[2];
        uint32_t cr1 = SPI1->CR1, cr2 = SPI1->CR2;
        disableDevices<SPI>();
        DMA1_Channel2->CCR &= ~DMA_CCR_EN;
        DMA1_Channel2->CNDTR = 3;
        DMA1_Channel2->CCR |= DMA_CCR_EN;
        enableDevices<SPI>();         
        SPI1->CR2 = cr2;
        SPI1->CR1 = cr1;
        return result;
    }
};

typedef SystemClocksCurrent<8000000> CLOCKS;
CLOCKS clocks;
typedef Timer<uintptr_t(TIM4), CLOCKS, &clocks> ClockTimer;
typedef Timer<uintptr_t(TIM3), CLOCKS, &clocks> GateTimer;
typedef Spi<uintptr_t(SPI1), CLOCKS, &clocks> SPI;

//typedef Pin<uintptr_t(GPIOA), 6> A6;


HX711<SPI, GateTimer, 2, ClockTimer, 1> hx;


extern "C"{

void TIM3_IRQHandler(void)
{
    hx.onIRQ();
    TIM3->SR &= ~(TIM_SR_UIF | TIM_SR_CC3IF);
}

void initHX711()
{
    sp = SPI1;
    clocks.update();
    configureRemaps<
        Remap<TimerChannel<ClockTimer, 1>, ClockPin>,
        Remap<TimerChannel<GateTimer, 2>, MOSIPin>,
        Remap<SCK<SPI>, SCKPin>,
        Remap<MOSI<SPI>, MOSIPin>
    >();

    ClockPin::template configure<IO_AF0>();
    MOSIPin::template configure<IO_In>();
    SCKPin::template configure<IO_In>();

    hx.init();
    /*using dma_::Enable;
    configureDMA<
        Link<SPI, Memory<uint8_t, data, 3>, Enable<true>>
    >();*/
    

    //rd1 = SPI::blockingRead();
    //rd2 = SPI::blockingRead();
    //rd3 = SPI::blockingRead();
    
    
    //A6::template configure<IO_AF0>();
    //HAL_Delay(10);
    /*while(MOSIPin::get());
    //ClockPin::template configure<IO_Out>();
    //ClockPin::clear();
    hx.poll();*/
}

uint32_t pollHX711()
{
    return hx.poll();
}

void disableHX711()
{
    hx.disable();
}

}