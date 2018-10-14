################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c \
D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c 

OBJS += \
./Middlewares/USB_Device_Library/usbd_cdc.o \
./Middlewares/USB_Device_Library/usbd_core.o \
./Middlewares/USB_Device_Library/usbd_ctlreq.o \
./Middlewares/USB_Device_Library/usbd_ioreq.o 

C_DEPS += \
./Middlewares/USB_Device_Library/usbd_cdc.d \
./Middlewares/USB_Device_Library/usbd_core.d \
./Middlewares/USB_Device_Library/usbd_ctlreq.d \
./Middlewares/USB_Device_Library/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/USB_Device_Library/usbd_cdc.o: D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/USB_Device_Library/usbd_core.o: D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/USB_Device_Library/usbd_ctlreq.o: D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/USB_Device_Library/usbd_ioreq.o: D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


