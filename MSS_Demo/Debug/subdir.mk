################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../gpio_task.c \
../i2c.c \
../lcd.c \
../main.c \
../pwm_task.c \
../spi.c \
../standalone_task.c 

OBJS += \
./gpio_task.o \
./i2c.o \
./lcd.o \
./main.o \
./pwm_task.o \
./spi.o \
./standalone_task.o 

C_DEPS += \
./gpio_task.d \
./i2c.d \
./lcd.d \
./main.d \
./pwm_task.d \
./spi.d \
./standalone_task.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DMICROSEMI_STDIO_THRU_MMUART0 -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\include" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal\CortexM3\GNU" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\portable\GCC\ARM_CM3" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\port_config" -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


