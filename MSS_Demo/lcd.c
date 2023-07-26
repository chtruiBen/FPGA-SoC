/*
 * lcd.c
 *
 *  Created on: 2023年6月30日
 *      Author: USER
 */

#include <stdio.h>
#include "sys_cfg.h"
void LCD_Fill(uint16_t xsta,uint16_t ysta,uint16_t xend,uint16_t yend,uint16_t color)
{
	uint16_t i,j;
	LCD_Address_Set(xsta,ysta,xend-1,yend-1);//設置顯示範圍
	for(i=ysta;i<yend;i++)
	{
		for(j=xsta;j<xend;j++)
		{
			LCD_WR_DATA(color);
		}
	}
}
