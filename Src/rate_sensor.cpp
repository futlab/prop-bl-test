#include "../../stm32lib/drivers/stm32f10x/clock.h"
#include "../../stm32lib/drivers/stm32f10x/timer.h"


struct CLOCKS {};
typedef Timer<uintptr_t(TIM2), CLOCKS> RateTimer;
typedef TimerChannel<RateTimer, 1> RateChannel;
typedef Pin<uintptr_t(GPIOA), 15> RatePin;

uint32_t lastCount = 0;

extern "C" {
    
void initRateSensor()
{
    using namespace tim_;
    enableDevices<RateTimer>();
    RatePin::template configure<IO_In>();
    configureRemaps<
        Remap<RateChannel, RatePin>
    >();
    RateTimer::setSource<External<TI1EdgeDetector>>();
}
    
uint32_t getRateSensorInc()
{
    uint32_t count = RateTimer::getCounter(), result = count - lastCount;
    lastCount = count;
    return result;
}
    
}
