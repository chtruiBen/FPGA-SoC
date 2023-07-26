################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreI2C/core_i2c.c \
../drivers/CoreI2C/i2c_interrupt.c 

OBJS += \
./drivers/CoreI2C/core_i2c.o \
./drivers/CoreI2C/i2c_interrupt.o 

C_DEPS += \
./drivers/CoreI2C/core_i2c.d \
./drivers/CoreI2C/i2c_interrupt.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreI2C/%.o: ../drivers/CoreI2C/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DMICROSEMI_STDIO_THRU_MMUART0 -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\include" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal\CortexM3\GNU" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\portable\GCC\ARM_CM3" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\port_config" -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


