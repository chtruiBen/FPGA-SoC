################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/croutine.c \
../FreeRTOS/list.c \
../FreeRTOS/queue.c \
../FreeRTOS/tasks.c \
../FreeRTOS/timers.c 

OBJS += \
./FreeRTOS/croutine.o \
./FreeRTOS/list.o \
./FreeRTOS/queue.o \
./FreeRTOS/tasks.o \
./FreeRTOS/timers.o 

C_DEPS += \
./FreeRTOS/croutine.d \
./FreeRTOS/list.d \
./FreeRTOS/queue.d \
./FreeRTOS/tasks.d \
./FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/%.o: ../FreeRTOS/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DMICROSEMI_STDIO_THRU_MMUART0 -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\include" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal\CortexM3\GNU" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\hal" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\FreeRTOS\portable\GCC\ARM_CM3" -I"F:\Microsemi\SoftConsole_v5.2\extras\workspace.examples\MSS_Demo\port_config" -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


