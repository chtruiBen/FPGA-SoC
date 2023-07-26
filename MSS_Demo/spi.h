/*
 * spi.h
 *
 *  Created on: 2023年6月30日
 *      Author: USER
 */

#ifndef SPI_H_
#define SPI_H_


#define SPI_INSTANCE    &g_mss_spi0
#define SPI_SLAVE       MSS_SPI_SLAVE_0

#define USE_HORIZONTAL 2  //設置橫屏或者豎屏顯示 0或1為豎屏 2或3為橫屏

#if USE_HORIZONTAL==0||USE_HORIZONTAL==1
#define LCD_W (240)
#define LCD_H (240)

#else
#define LCD_W (320)
#define LCD_H (240)
#endif



#define WHITE         	 0xFFFF
#define BLACK         	 0x0000
#define BLUE           	 0x001F
#define BRED             0XF81F
#define GRED 			       0XFFE0
#define GBLUE			       0X07FF
#define RED           	 0xF800
#define MAGENTA       	 0xF81F
#define GREEN         	 0x07E0
#define CYAN          	 0x7FFF
#define YELLOW        	 0xFFE0
#define BROWN 			     0XBC40 //棕色
#define BRRED 			     0XFC07 //棕紅色
#define GRAY  			     0X8430 //灰色
#define DARKBLUE      	 0X01CF	//深藍色
#define LIGHTBLUE      	 0X7D7C	//淺藍色
#define GRAYBLUE       	 0X5458 //灰藍色
#define LIGHTGREEN     	 0X841F //淺綠色
#define LGRAY 			     0XC618 //淺灰色(PANNEL),表單背景色
#define LGRAYBLUE        0XA651 //淺灰藍色(中間層顏色)
#define LBBLUE           0X2B12 //淺棕藍色(選擇條目的反色)
#define LLGRAY 0xDEDB

void spi_init( void );

#endif /* SPI_H_ */
