/*
 * pwm_task.c
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

#include "drivers/CorePWM/core_pwm.h"

extern pwm_instance_t the_pwm;
void pwm_task(void *para)
{

	uint8_t i=100;



   while(1){
	   for(i=100;i>0;i-=5){
		   PWM_set_duty_cycle(&the_pwm, PWM_1, i);
		   vTaskDelay(50);
	   }
	   for(i=0;i<100;i+=5){
		   PWM_set_duty_cycle(&the_pwm, PWM_1, i);
				   vTaskDelay(50);
	   }
   }
}
