#ifndef MSS_Demo_HW_PLATFORM_H_
#define MSS_Demo_HW_PLATFORM_H_
/*****************************************************************************
*
*Created by Microsemi SmartDesign  Fri Jun 30 13:52:47 2023
*
*Memory map specification for peripherals in MSS_Demo
*/

/*-----------------------------------------------------------------------------
* CM3 subsystem memory map
* Master(s) for this subsystem: CM3 
*---------------------------------------------------------------------------*/
#define COREPWM_0                       0x50000000U
#define COREGPIO_0                      0x50010000U
#define COREI2C_0                       0x50020000U
#define COREAPBLSRAM_0                  0x50030000U
#define REG_APB_WRP_0                   0x50040000U
#define REG_APB_DEMO_0                  0x50050000U

#endif /* MSS_Demo_HW_PLATFORM_H_*/
