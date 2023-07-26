/*
 * gpio_task.c
 *
 *  Created on: 2023年7月3日
 *      Author: USER
 */

/**************************************************************************/
/* Standard Includes */
/**************************************************************************/

#include <stdio.h>
#include <stdlib.h>

/**************************************************************************/
/* RTOS Includes */
/**************************************************************************/

#include "FreeRTOS.h"
#include "sys_cfg.h"
#include "spi.h"
/**************************************************************************/
/* Extern Declarations */
/**************************************************************************/
#include "drivers/CoreGPIO/core_gpio.h"

extern gpio_instance_t g_gpio;


void gpio_task(void *para)
{

   while(1){
		GPIO_drive_inout( &g_gpio, GPIO_0, GPIO_DRIVE_HIGH );
		vTaskDelay(200);
		GPIO_drive_inout( &g_gpio, GPIO_0, GPIO_DRIVE_LOW );
		vTaskDelay(200);
   }
}
