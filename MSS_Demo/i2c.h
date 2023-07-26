/*
 * i2c.h
 *
 *  Created on:2018.0706
 *      Author: Howard
 */

#ifndef RTOSDEMO_INCLUDE_I2C_H_
#define RTOSDEMO_INCLUDE_I2C_H_
#include <stdint.h>

#define I2C_BUFFER_SIZE	4

/* 7 Bit Slave addr for the FRAM*/
#define FRAM_ADDR 0x50


#define FAILED 0
#define PASS 1


void vInitializeI2C(void);
void vTaskReadFram(void *pvParameters);
void vRead_FRAM(uint16_t Addr,uint8_t const * RxBuffer,uint8_t byte_num);
void vWrite_FRAM(uint16_t Addr,uint8_t const *buff,uint8_t byte_num);

#define FIXED


uint8_t I2C_Wake(void);
uint8_t I2C_WriteBytes(uint8_t I2C_Addr,uint8_t reg,const uint8_t* buf,  uint32_t nbyte);
uint8_t I2C_ReadBytes(uint8_t I2C_Addr,uint8_t reg,uint8_t *buf,uint32_t num);
#endif /* RTOSDEMO_INCLUDE_I2C_H_ */
