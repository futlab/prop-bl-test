#include "../../stm32lib/drivers/stm32f10x/clock.h"
#include "../../stm32lib/drivers/stm32f10x/timer.h"


struct CLOCKS {};
auto tm2 = TIM2;
typedef Timer<uintptr_t(TIM2), CLOCKS> RateTimer;
typedef TimerChannel<RateTimer, 1> RateChannel;
typedef Pin<uintptr_t(GPIOA), 15> RatePin;

uint32_t lastCount = 0;

extern "C" {
    
void initRateSensor()
{
    using namespace tim_;
    tm2 = TIM2;
    enableDevices<RateTimer>();
    RatePin::template configure<IO_In>();
    configureRemaps<
        Remap<RateChannel, RatePin>
    >();
    RateChannel::configureInput<Filter<15>>();
    RateTimer::setSource<External<TI1EdgeDetector>>();
    RateTimer::configure<Enable>();
}
    
uint32_t getRateSensorInc()
{
    uint32_t count = RateTimer::getCounter(), result = count - lastCount;
    lastCount = count;
    return result;
}
    
}
