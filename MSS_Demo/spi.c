/*
 * spi.c
 *
 *  Created on: 2023年6月30日
 *      Author: USER
 */
#include "drivers/mss_spi/mss_spi.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include <stdio.h>
#include "sys_cfg.h"
#include "spi.h"


void spi_init( void )
{
    /*--------------------------------------------------------------------------
     * Configure SPI.
     */
    MSS_SPI_init( &g_mss_spi0 );

    MSS_SPI_configure_master_mode
        (
            &g_mss_spi0,
            MSS_SPI_SLAVE_0,
            MSS_SPI_MODE3,
			2u,
            MSS_SPI_BLOCK_TRANSFER_FRAME_SIZE
        );


}
void LCD_Writ_Bus(uint8_t dat)
{
	  uint8_t w_buffer[1];
	  uint8_t read_buffer[1];
	  w_buffer[0]=dat;
	 MSS_SPI_set_slave_select( SPI_INSTANCE, SPI_SLAVE );

     MSS_SPI_transfer_block( SPI_INSTANCE,
                             &w_buffer,
                             1,
                             0,
                             0);
     MSS_SPI_clear_slave_select( SPI_INSTANCE, SPI_SLAVE );

}
void LCD_WR_DATA8(uint8_t dat)
{
	LCD_Writ_Bus(dat);
}
void LCD_WR_DATA(uint16_t dat)
{
	LCD_Writ_Bus(dat>>8);
	LCD_Writ_Bus(dat);
}
void LCD_WR_REG(uint8_t dat)
{
	MSS_GPIO_set_output(MSS_GPIO_0,0);//寫命令
	LCD_Writ_Bus(dat);
	MSS_GPIO_set_output(MSS_GPIO_0,1);//寫數據
}
void  __attribute__((optimize("O0")))  LCD_Address_Set(uint16_t x1,uint16_t y1,uint16_t x2,uint16_t y2)
{
if(USE_HORIZONTAL==0)
	{
		LCD_WR_REG(0x2a);//列位址設置
		LCD_WR_DATA(x1);
		LCD_WR_DATA(x2);
		LCD_WR_REG(0x2b);//行位址設置
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//儲存器寫
	}
	else if(USE_HORIZONTAL==1)
	{
		LCD_WR_REG(0x2a);//列位址設置
		LCD_WR_DATA(x1);
		LCD_WR_DATA(x2);
		LCD_WR_REG(0x2b);//行位址設置
		LCD_WR_DATA(y1+80);
		LCD_WR_DATA(y2+80);
		LCD_WR_REG(0x2c);//儲存器寫
	}
	else if(USE_HORIZONTAL==2)
	{
		LCD_WR_REG(0x2a);//列位址設置
		LCD_WR_DATA(x1);
		LCD_WR_DATA(x2);
		LCD_WR_REG(0x2b);//行位址設置
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//儲存器寫
	}
	else
	{
		LCD_WR_REG(0x2a);//列位址設置
		LCD_WR_DATA(x1+80);
		LCD_WR_DATA(x2+80);
		LCD_WR_REG(0x2b);//行位址設置
		LCD_WR_DATA(y1);
		LCD_WR_DATA(y2);
		LCD_WR_REG(0x2c);//儲存器寫
	}
}

void  __attribute__((optimize("O0")))  LCD_Init(void)
{
//	LCD_GPIO_Init();//初始化GPIO


	vTaskDelay(100);

//	LCD_BLK_Set();//打開背光
//  delay_ms(100);

	LCD_WR_REG(0x11);                                             //無此指令，不能正常初始化晶片，無顯示
	vTaskDelay(120);
	LCD_WR_REG(0x36);                                             //設置記憶體掃描方向，0X00正常掃描，從上往下，從左往右，RGB方式
	/*if(USE_HORIZONTAL==0)LCD_WR_DATA8(0x00);
	else if(USE_HORIZONTAL==1)LCD_WR_DATA8(0xC0);
	else if(USE_HORIZONTAL==2)LCD_WR_DATA8(0x70);
	else LCD_WR_DATA8(0xA0);
*/
	LCD_WR_DATA8(0x00);

	LCD_WR_REG(0x3A);                                             //資料格式，65K色,565
	LCD_WR_DATA8(0x05);

	LCD_WR_REG(0xB2);                                             //幀頻設置
	LCD_WR_DATA8(0x0C);
	LCD_WR_DATA8(0x0C);
	LCD_WR_DATA8(0x00);
	LCD_WR_DATA8(0x33);
	LCD_WR_DATA8(0x33);

	LCD_WR_REG(0xB7);                                             //GATE 設置
	LCD_WR_DATA8(0x35);

	LCD_WR_REG(0xBB);                                             //VCOM設置
	LCD_WR_DATA8(0x19);

	LCD_WR_REG(0xC0);                                             //LCM設置,默認0x2c
	LCD_WR_DATA8(0x2C);

	LCD_WR_REG(0xC2);                                             //VDV&VRH SET ,默認0x01
	LCD_WR_DATA8(0x01);

	LCD_WR_REG(0xC3);                                             //VRHS SET，默認0x0b
	LCD_WR_DATA8(0x12);                                           //此處根據實際情況修正

	LCD_WR_REG(0xC4);                                             //VDV SET，默認0x20
	LCD_WR_DATA8(0x20);

	LCD_WR_REG(0xC6);                                             // FR SET, 默認0x0F
	LCD_WR_DATA8(0x0F);

	LCD_WR_REG(0xD0);                                             //電源控制1
	LCD_WR_DATA8(0xA4);                                           //該參數不變
	LCD_WR_DATA8(0xA1);                                           //此處根據實際情況修改

	LCD_WR_REG(0xE0);                                             //正極性GAMMA調整
	LCD_WR_DATA8(0xD0);
	LCD_WR_DATA8(0x04);
	LCD_WR_DATA8(0x0D);
	LCD_WR_DATA8(0x11);
	LCD_WR_DATA8(0x13);
	LCD_WR_DATA8(0x2B);
	LCD_WR_DATA8(0x3F);
	LCD_WR_DATA8(0x54);
	LCD_WR_DATA8(0x4C);
	LCD_WR_DATA8(0x18);
	LCD_WR_DATA8(0x0D);
	LCD_WR_DATA8(0x0B);
	LCD_WR_DATA8(0x1F);
	LCD_WR_DATA8(0x23);

	LCD_WR_REG(0xE1);                                              //負極性GAMMA調整
	LCD_WR_DATA8(0xD0);
	LCD_WR_DATA8(0x04);
	LCD_WR_DATA8(0x0C);
	LCD_WR_DATA8(0x11);
	LCD_WR_DATA8(0x13);
	LCD_WR_DATA8(0x2C);
	LCD_WR_DATA8(0x3F);
	LCD_WR_DATA8(0x44);
	LCD_WR_DATA8(0x51);
	LCD_WR_DATA8(0x2F);
	LCD_WR_DATA8(0x1F);
	LCD_WR_DATA8(0x1F);
	LCD_WR_DATA8(0x20);
	LCD_WR_DATA8(0x23);

	LCD_WR_REG(0x21);                                             //反顯開，默認是0X20，正常模式

	LCD_WR_REG(0x29);                                             //顯示開，等待MCU數傳送
}


