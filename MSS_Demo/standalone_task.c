/**************************************************************************
 * (c) Copyright 2009 Actel Corporation.  All rights reserved.
 *
 *  Application demo for Smartfusion
 *
 *
 * Author : Actel Application Team
 * Rev     : 1.0.0.3
 *
 **************************************************************************/

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


#include "drivers/CoreI2C/core_i2c.h"
#include "MSS_Demo_hw_platform.h"

extern i2c_instance_t g_i2c_inst;
#define DEMO_I2C_TIMEOUT 3000u

i2c_status_t corei2c_write_read_transaction(uint8_t I2C_Addr,uint8_t reg,uint8_t *buf,uint32_t num) {
	i2c_status_t status;
	uint8_t TxBuffer[2]={0};
	TxBuffer[0] = reg;
	I2C_write_read(&g_i2c_inst, I2C_Addr>>1, TxBuffer, 1,
			buf, num, I2C_RELEASE_BUS);

	status = I2C_wait_complete(&g_i2c_inst, DEMO_I2C_TIMEOUT);

	return status;
}
i2c_status_t corei2c_write_transaction(uint8_t serial_addr,
		uint8_t * tx_buffer, uint16_t write_length) {
	i2c_status_t status;

	I2C_write(&g_i2c_inst, serial_addr>>1, tx_buffer, write_length,
			I2C_RELEASE_BUS);

	status = I2C_wait_complete(&g_i2c_inst, DEMO_I2C_TIMEOUT);

	return status;
}

void standalone_task(void *para)
{
	uint8_t wbuff[4]={0xCC,0xCA,0xAC,0xF1};
	uint8_t rbuff[4]={0x0};
	uint8_t i=0;
	uint8_t  tx_buffer[2];
    uint8_t  rx_buffer[2];
    i2c_status_t status;

	vWrite_FRAM(0x0,(uint8_t *)&wbuff,4);
	vTaskDelay(50);
	vRead_FRAM(0x0,(uint8_t *)&rbuff, 4);

	 LCD_Init();//LCD初始化
	LCD_Fill(0,0,LCD_W,LCD_H,YELLOW);

	for(i=0;i<4;i++){

		DEBUG("[%d] %x\r\n",i,rbuff[i]);
	}
	 // Write data to Channel 0 of CoreI2C instance.
	/*tx_buffer[0]=0x0;
	tx_buffer[1]=0xA0;
	corei2c_write_transaction(0x88, tx_buffer, 2);
	vTaskDelay(100);
	 */
   while(1){
	   /*LCD_Fill(0,0,LCD_W,LCD_H,YELLOW);
	   DEBUG("Hello World\r\n");
	   vTaskDelay(500);
	   LCD_Fill(0,0,LCD_W,LCD_H,RED);
	   vTaskDelay(500);
	   LCD_Fill(0,0,LCD_W,LCD_H,GREEN);
	   vTaskDelay(500);*/

	   /*vTaskDelay(500);
		corei2c_write_read_transaction(0x88,0x2,rx_buffer,2);
		DEBUG("LUX: %d\r\n",((rx_buffer[1]<<8)|rx_buffer[0]));
		*/
	  // HW_set_32bit_reg(COREAPBLSRAM_0,0xA5A5A5A5);
	   //DEBUG("%x\r\n",HW_get_32bit_reg(COREAPBLSRAM_0));

	 //  HW_set_32bit_reg(REG_APB_WRP_0,0xAA);
	  // DEBUG("%x\r\n",HW_get_32bit_reg(REG_APB_WRP_0));

	   HW_set_32bit_reg(REG_APB_DEMO_0,0x1);
	  // DEBUG("%x\r\n",HW_get_32bit_reg(REG_APB_DEMO_0));
	   vTaskDelay(500);
	   HW_set_32bit_reg(REG_APB_DEMO_0,0x0);
	  // DEBUG("%x\r\n",HW_get_32bit_reg(REG_APB_DEMO_0));
	   vTaskDelay(500);
   }
}
