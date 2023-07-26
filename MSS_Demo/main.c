/*
 * main.c
 *
 *  Created on: 2023年6月30日
 *      Author: USER
 */


#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_sys_services/mss_sys_services.h"

#include "drivers/CorePWM/core_pwm.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "drivers/CoreI2C/core_i2c.h"

#include "CMSIS/system_m2sxxx.h"
#include "MSS_Demo_hw_platform.h"
#include <stdio.h>

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

#define mainuIP_TASK_PRIORITY        ( tskIDLE_PRIORITY + 2 )

#include "sys_cfg.h"
#include "i2c.h"
#include "spi.h"
void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time stack overflow checking is performed if
	configconfigCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
	function is called if a stack overflow is detected. */
	for( ;; );
}
unsigned long ulGetRunTimeCounterValue( void )
{

	return 0UL;
}
void vMainConfigureTimerForRunTimeStats( void )
{

}
void vApplicationIdleHook( void )
{
	/* This function is called on each cycle of the idle task.  In this case it
	does nothing useful */
}
void vApplicationMallocFailedHook( void )
{
	/* Called if a call to pvPortMalloc() fails because there is insufficient
	free memory available in the FreeRTOS heap.  pvPortMalloc() is called
	internally by FreeRTOS API functions that create tasks, queues, software
	timers, and semaphores.  The size of the FreeRTOS heap is set by the
	configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */
	for( ;; );
}
void standalone_task(void *para);
void pwm_task(void *para);
void gpio_task(void *para);

#define RX_BUFF_SIZE    64

 uint8_t g_rx_buff[RX_BUFF_SIZE];
 void uart1_rx_handler(mss_uart_instance_t * this_uart)
  {
	 DEBUG("GET \r\n");
      MSS_UART_get_rx(this_uart, &g_rx_buff[0], sizeof(g_rx_buff));
  }


pwm_instance_t the_pwm;
gpio_instance_t g_gpio;
i2c_instance_t g_i2c_inst;

void init_system()
{
	MSS_SYS_init(MSS_SYS_NO_EVENT_HANDLER);
	  /* Initialize and configure UART0. */
	MSS_UART_init(&g_mss_uart0,
				  MSS_UART_115200_BAUD,
				  MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

	  /* Initialize and configure UART1. */
	MSS_UART_init(&g_mss_uart1,
							MSS_UART_115200_BAUD,
							MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);
	MSS_UART_set_rx_handler(&g_mss_uart1,
		                              uart1_rx_handler,
		                              MSS_UART_FIFO_SINGLE_BYTE);

	MSS_UART_enable_irq(&g_mss_uart1,(MSS_UART_RBF_IRQ ));
	//LCD DC pin
	MSS_GPIO_init();
	MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE );

	//MSS I2C Init
	vInitializeI2C();

	//SPI Init
	spi_init();

	//PWM Init
	PWM_init( &the_pwm, COREPWM_0, 100-1, 100-1);
	PWM_set_duty_cycle(&the_pwm, PWM_1, 100);

	//GPIO
	GPIO_init( &g_gpio, COREGPIO_0, GPIO_APB_32_BITS_BUS );
	GPIO_config( &g_gpio, GPIO_0, GPIO_OUTPUT_MODE );
	GPIO_drive_inout( &g_gpio, GPIO_0, GPIO_DRIVE_HIGH );

	//Core I2C Init
	I2C_init( &g_i2c_inst, COREI2C_0, 0,
	                  I2C_PCLK_DIV_256 );

	DEBUG ("[init_system]\r\n");
}
void FabricIrq0_IRQHandler(void) {
	I2C_isr(&g_i2c_inst);
}
int main()
{
	init_system();

	SystemCoreClockUpdate();

	 xTaskCreate( standalone_task,
	    			( signed char * ) "standalone_task",
					512,
	    			NULL,
	    			mainuIP_TASK_PRIORITY+2,
	    			NULL );


	 xTaskCreate( pwm_task,
	    			( signed char * ) "pwm_task",
					512,
	    			NULL,
	    			mainuIP_TASK_PRIORITY+3,
	    			NULL );

	 xTaskCreate( gpio_task,
	    			( signed char * ) "gpio_task",
					512,
	    			NULL,
	    			mainuIP_TASK_PRIORITY+4,
	    			NULL );
	 /* Start the scheduler*/
	    vTaskStartScheduler();
}
