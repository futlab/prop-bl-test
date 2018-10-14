import qbs
import "../stm32lib/Stm32Application.qbs" as Stm32Application

Project {
    name: "Propeller BL test"
    minimumQbsVersion: "1.5.0"

    Product {
        Depends { name : "cpp" }

        //deviceName: "STM32F100RBTx"
        consoleApplication: true
        type: ["application", "hex", "bin", "size", "elf", "disassembly"]

        Group {     // Properties for the produced executable
            name : "Headers"
            prefix : "Inc/"
            files : [
                "*.h"
            ]
        }
        Group {     // Properties for the produced executable
            name : "Sources"
            prefix : "Src/"
            files : [
                "*.c"
            ]
        }
        Group {
            name : "HAL Driver"
            prefix : "Drivers/STM32F1xx_HAL_Driver/Src/"
            files : [
                "stm32f1xx_hal_gpio_ex.c",
                "stm32f1xx_hal_pcd.c",
                "stm32f1xx_hal_pcd_ex.c",
                "stm32f1xx_ll_usb.c",
                "stm32f1xx_hal_adc.c",
                "stm32f1xx_hal_adc_ex.c",
                "stm32f1xx_hal_i2c.c",
                "stm32f1xx_hal_tim.c",
                "stm32f1xx_hal_tim_ex.c",
                "stm32f1xx_hal.c",
                "stm32f1xx_hal_rcc.c",
                "stm32f1xx_hal_rcc_ex.c",
                "stm32f1xx_hal_gpio.c",
                "stm32f1xx_hal_dma.c",
                "stm32f1xx_hal_cortex.c",
                "stm32f1xx_hal_pwr.c",
                "stm32f1xx_hal_flash.c",
                "stm32f1xx_hal_flash_ex.c"
            ]
        }

        Group {
            name : "USB Library"
            prefix : "Middlewares/ST/STM32_USB_Device_Library/Core/Src/"
            files : [
                "usbd_core.c",
                "usbd_ctlreq.c",
                "usbd_ioreq.c"
            ]
        }
        Group {
            name : "CDC"
            prefix : "Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/"
            files : ["usbd_cdc.c"]
        }

        Group {
            name : "Asm"
            files  : ["startup_stm32f103xb.s"]
        }

        cpp.defines: ["USE_HAL_DRIVER", "STM32F103xB"]//device.defines
        cpp.includePaths : [
            "Inc",
            "Drivers/STM32F1xx_HAL_Driver/Inc",
            "Drivers/STM32F1xx_HAL_Driver/Inc/Legacy",
            "Middlewares/ST/STM32_USB_Device_Library/Core/Inc",
            "Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc",
            "Drivers/CMSIS/Device/ST/STM32F1xx/Include",
            "Drivers/CMSIS/Include"
        ]//.concat(device.includePaths)

        cpp.linkerFlags: [
            "-lc",
            "-lnosys",
            "-lm",
            "-specs=nano.specs"
        ]//.concat(device.archFlags)

        cpp.commonCompilerFlags: [
            "-mthumb", "-mcpu=cortex-m3", "-Og"
        ]//.concat(device.archFlags)
        Group {
            name : "Linker"
            fileTags: "linkerscript"
            //prefix : path + "/linker/"
            files : "STM32F103C8Tx_FLASH.ld"
        }
    }
}
