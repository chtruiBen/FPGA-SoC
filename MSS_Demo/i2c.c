/*
 * i2c.c
 *
 *  Created on: 2020年6月3日
 *      Author: Administrator
 */
#include "drivers/mss_i2c/mss_i2c.h"
#include "CMSIS/system_m2sxxx.h"
#include "drivers/mss_gpio/mss_gpio.h"
/* Application includes. */
#include "i2c.h"
#include "sys_cfg.h"

#include "drivers/mss_uart/mss_uart.h"

void vInitializeI2C(void)
{
	/* Initialize I2C0 to use with the light sensor
	 * It will only be used as a master so use 0x00 for its slave addr */
	MSS_I2C_init(&g_mss_i2c1, 0x00, MSS_I2C_PCLK_DIV_256);
	DEBUG("[I2c init]\r\n");
	/* Initialize I2C1 if necessary */
}

uint8_t I2C_Wake(void){
	uint8_t TxBuffer[1]={0},buf[1];
	//DEBUG("I2C_Wake\r\n");
	MSS_I2C_init(&g_mss_i2c1, 0x00, MSS_I2C_BCLK_DIV_8);
	MSS_I2C_write(&g_mss_i2c1,0, TxBuffer,1, MSS_I2C_RELEASE_BUS);
	//MSS_I2C_write_read(&g_mss_i2c1, 0, TxBuffer, 1, buf, 1, MSS_I2C_RELEASE_BUS);
	MSS_I2C_wait_complete(&g_mss_i2c1,1);
	vTaskDelay(3);
	MSS_I2C_init(&g_mss_i2c1, 0x00, MSS_I2C_PCLK_DIV_256);
	return 0;
}
uint8_t I2C_WriteBytes(uint8_t I2C_Addr,uint8_t reg,const uint8_t* buf,  uint32_t nbyte)
{
	uint8_t TxBuffer[35+1]={0};

	//DEBUG("I2C_WriteBytes\r\n");
		TxBuffer[0]=reg;
		memcpy(TxBuffer+1,buf,nbyte);
		//printf("%d %x %x %x\r\n",nbyte,TxBuffer[0],TxBuffer[1],TxBuffer[2]);
		MSS_I2C_write(&g_mss_i2c1, I2C_Addr>>1, TxBuffer,nbyte+1, MSS_I2C_RELEASE_BUS);
	//	MSS_I2C_wait_complete(&g_mss_i2c1,0);
						/* Wait for the transaction to complete
						 * Instead of using the MSS_I2C_wait_complete() function which will keep this task stuck in the running state
						 * Just block the task for a few ms and come back */
		while( MSS_I2C_get_status( &g_mss_i2c1 ) != MSS_I2C_SUCCESS)
		{
			vTaskDelay( 5);
		}

		return 0;
}
uint8_t I2C_ReadBytes(uint8_t I2C_Addr,uint8_t reg,uint8_t *buf,uint32_t num)
{
	uint8_t TxBuffer[2]={0};

	//DEBUG("I2C_ReadBytes\r\n");
		TxBuffer[0] = reg;
		MSS_I2C_write_read(&g_mss_i2c1, I2C_Addr>>1, TxBuffer, 1, buf, num, MSS_I2C_RELEASE_BUS);
	   // MSS_I2C_wait_complete(&g_mss_i2c1, 0);	// Wait up to 2 ms for the transfer to complete
		while( MSS_I2C_get_status( &g_mss_i2c1 ) != MSS_I2C_SUCCESS)
		{

					vTaskDelay( 2);
		}
		return 0;
}
uint8_t uSlaveAddr = 0x50;
void vRead_FRAM(uint16_t Addr,uint8_t const * RxBuffer,uint8_t byte_num)
{
	uint8_t TxBuffer[I2C_BUFFER_SIZE]={0};
	uint8_t tmp_byte = 0;
	uint8_t lower_addr;

	tmp_byte = (Addr>>8)<<1;
	uSlaveAddr |= tmp_byte;
	lower_addr = (uint8_t)((0x00FF)&Addr);

	TxBuffer[0] = Addr;
	MSS_I2C_write_read(&g_mss_i2c1, uSlaveAddr, TxBuffer, 1, RxBuffer, byte_num, MSS_I2C_RELEASE_BUS);
    MSS_I2C_wait_complete(&g_mss_i2c1, 2);	// Wait up to 2 ms for the transfer to complete
	while( MSS_I2C_get_status( &g_mss_i2c1 ) != MSS_I2C_SUCCESS)
	{
				/* Wait 2 ms for the transfer to complete
				 * Block to allow other processes to run in the meantime */
				vTaskDelay( 2);
	}
}

void vWrite_FRAM(uint16_t Addr,uint8_t const *buff,uint8_t byte_num)
{
	uint8_t TxBuffer[I2C_BUFFER_SIZE+1]={0};
	uint8_t tmp_byte = 0;
	uint8_t lower_addr;

	tmp_byte = (Addr>>8)<<1;
	uSlaveAddr |= tmp_byte;
	lower_addr = (uint8_t)((0x00FF)&Addr);

	TxBuffer[0]=Addr;
	memcpy(TxBuffer+1,buff,byte_num);
	//printf("%d %d \r\n",TxBuffer[0],TxBuffer[1]);
	MSS_I2C_write(&g_mss_i2c1, uSlaveAddr, TxBuffer,byte_num+1, MSS_I2C_RELEASE_BUS);

					/* Wait for the transaction to complete
					 * Instead of using the MSS_I2C_wait_complete() function which will keep this task stuck in the running state
					 * Just block the task for a few ms and come back */
	while( MSS_I2C_get_status( &g_mss_i2c1 ) != MSS_I2C_SUCCESS)
	{
		vTaskDelay( 5);
	}
}
