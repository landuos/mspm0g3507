################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2010/ccs/tools/compiler/ti-cgt-armllvm_4.0.2.LTS/bin/tiarmclang.exe" -c @"device.opt"  -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O2 -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Board" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MPU6050" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/LCD" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Debug" -I"C:/ti/mspm0_sdk_2_04_00_06/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_04_00_06/source" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MSPM0" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/delay" -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

build-153104319: ../empty.syscfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: SysConfig'
	"C:/ti/ccs2010/ccs/utils/sysconfig_1.23.0/sysconfig_cli.bat" --script "C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/empty.syscfg" -o "." -s "C:/ti/mspm0_sdk_2_04_00_06/.metadata/product.json" --compiler ticlang
	@echo 'Finished building: "$<"'
	@echo ' '

device_linker.cmd: build-153104319 ../empty.syscfg
device.opt: build-153104319
device.cmd.genlibs: build-153104319
ti_msp_dl_config.c: build-153104319
ti_msp_dl_config.h: build-153104319
Event.dot: build-153104319

%.o: ./%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2010/ccs/tools/compiler/ti-cgt-armllvm_4.0.2.LTS/bin/tiarmclang.exe" -c @"device.opt"  -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O2 -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Board" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MPU6050" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/LCD" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Debug" -I"C:/ti/mspm0_sdk_2_04_00_06/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_04_00_06/source" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MSPM0" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/delay" -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

startup_mspm0g350x_ticlang.o: C:/ti/mspm0_sdk_2_04_00_06/source/ti/devices/msp/m0p/startup_system_files/ticlang/startup_mspm0g350x_ticlang.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2010/ccs/tools/compiler/ti-cgt-armllvm_4.0.2.LTS/bin/tiarmclang.exe" -c @"device.opt"  -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O2 -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Board" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MPU6050" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/LCD" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/Debug" -I"C:/ti/mspm0_sdk_2_04_00_06/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_04_00_06/source" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/MSPM0" -I"C:/Users/liyue/workspace_ccstheia/MPU_LCD_PWM/BSP/delay" -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


