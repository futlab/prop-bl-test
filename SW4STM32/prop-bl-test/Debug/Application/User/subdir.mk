################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/src/stm32/prop-bl-test/Src/main.c \
D:/src/stm32/prop-bl-test/Src/stm32f1xx_hal_msp.c \
D:/src/stm32/prop-bl-test/Src/stm32f1xx_it.c \
D:/src/stm32/prop-bl-test/Src/usb_device.c \
D:/src/stm32/prop-bl-test/Src/usbd_cdc_if.c \
D:/src/stm32/prop-bl-test/Src/usbd_conf.c \
D:/src/stm32/prop-bl-test/Src/usbd_desc.c 

OBJS += \
./Application/User/main.o \
./Application/User/stm32f1xx_hal_msp.o \
./Application/User/stm32f1xx_it.o \
./Application/User/usb_device.o \
./Application/User/usbd_cdc_if.o \
./Application/User/usbd_conf.o \
./Application/User/usbd_desc.o 

C_DEPS += \
./Application/User/main.d \
./Application/User/stm32f1xx_hal_msp.d \
./Application/User/stm32f1xx_it.d \
./Application/User/usb_device.d \
./Application/User/usbd_cdc_if.d \
./Application/User/usbd_conf.d \
./Application/User/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/main.o: D:/src/stm32/prop-bl-test/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f1xx_hal_msp.o: D:/src/stm32/prop-bl-test/Src/stm32f1xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f1xx_it.o: D:/src/stm32/prop-bl-test/Src/stm32f1xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usb_device.o: D:/src/stm32/prop-bl-test/Src/usb_device.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_cdc_if.o: D:/src/stm32/prop-bl-test/Src/usbd_cdc_if.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_conf.o: D:/src/stm32/prop-bl-test/Src/usbd_conf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/usbd_desc.o: D:/src/stm32/prop-bl-test/Src/usbd_desc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/src/stm32/prop-bl-test/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/src/stm32/prop-bl-test/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/src/stm32/prop-bl-test/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


