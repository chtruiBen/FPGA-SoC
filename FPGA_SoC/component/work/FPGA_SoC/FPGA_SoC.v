//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Jul 07 15:11:20 2023
// Version: v11.9 SP6 11.9.6.7
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// FPGA_SoC
module FPGA_SoC(
    // Inputs
    DEVRST_N,
    MMUART_0_RXD,
    MMUART_1_RXD,
    // Outputs
    GPIO_0_M2F,
    GPIO_OUT,
    LED2,
    MMUART_0_TXD,
    MMUART_1_TXD,
    PWM,
    lcd_clk_out,
    lcd_cs_out,
    lcd_data_out,
    lcd_dc_out,
    pwm_0,
    pwm_1,
    pwm_2,
    pwm_3,
    // Inouts
    I2C_1_SCL,
    I2C_1_SDA
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        DEVRST_N;
input        MMUART_0_RXD;
input        MMUART_1_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       GPIO_0_M2F;
output [0:0] GPIO_OUT;
output       LED2;
output       MMUART_0_TXD;
output       MMUART_1_TXD;
output [3:0] PWM;
output       lcd_clk_out;
output       lcd_cs_out;
output       lcd_data_out;
output       lcd_dc_out;
output       pwm_0;
output       pwm_1;
output       pwm_2;
output       pwm_3;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout        I2C_1_SCL;
inout        I2C_1_SDA;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire   [31:0] CoreAPB3_0_APBmslave1_PRDATA;
wire          CoreAPB3_0_APBmslave1_PREADY;
wire          CoreAPB3_0_APBmslave1_PSELx;
wire          CoreAPB3_0_APBmslave1_PSLVERR;
wire          CoreAPB3_0_APBmslave2_PREADY;
wire          CoreAPB3_0_APBmslave2_PSELx;
wire          CoreAPB3_0_APBmslave2_PSLVERR;
wire          CoreAPB3_0_APBmslave5_PREADY;
wire          CoreAPB3_0_APBmslave5_PSELx;
wire          CoreAPB3_0_APBmslave5_PSLVERR;
wire          DEVRST_N;
wire          FCCC_0_GL0;
wire          FCCC_0_GL1;
wire          FCCC_0_LOCK;
wire   [31:0] FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PADDR;
wire          FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PENABLE;
wire   [31:0] FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PRDATA;
wire          FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PREADY;
wire          FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSELx;
wire          FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSLVERR;
wire   [31:0] FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWDATA;
wire          FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWRITE;
wire          GPIO_0_M2F_net_0;
wire   [0:0]  GPIO_OUT_net_0;
wire          I2C_1_SCL;
wire          I2C_1_SDA;
wire          lcd_clk_out_net_0;
wire          lcd_cs_out_net_0;
wire          lcd_data_out_net_0;
wire          lcd_dc_out_net_0;
wire          LED2_net_0;
wire          MMUART_0_RXD;
wire          MMUART_0_TXD_net_0;
wire          MMUART_1_RXD;
wire          MMUART_1_TXD_net_0;
wire          net_1;
wire          OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire   [3:0]  PWM_0_net_0;
wire          pwm_1_net_0;
wire          pwm_2_net_0;
wire          pwm_3_net_0;
wire          SYSRESET_0_POWER_ON_RESET_N;
wire          MMUART_1_TXD_net_1;
wire          MMUART_0_TXD_net_1;
wire          GPIO_0_M2F_net_1;
wire          net_1_net_0;
wire          pwm_1_net_1;
wire          pwm_2_net_1;
wire          pwm_3_net_1;
wire          lcd_dc_out_net_1;
wire          lcd_clk_out_net_1;
wire          lcd_data_out_net_1;
wire          lcd_cs_out_net_1;
wire   [0:0]  GPIO_OUT_net_1;
wire   [3:0]  PWM_0_net_1;
wire          LED2_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire   [131:0]ram_lcd_data_const_net_0;
wire          VCC_net;
wire   [7:0]  duty_const_net_0;
wire   [7:0]  duty_const_net_1;
wire   [7:0]  duty_const_net_2;
wire   [7:0]  duty_const_net_3;
wire   [31:0] IADDR_const_net_0;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_0_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_1_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_1;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_2_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_2;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_3_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_3;
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [15:0] CoreAPB3_0_APBmslave0_PRDATA;
wire   [31:16]CoreAPB3_0_APBmslave0_PRDATA_0_31to16;
wire   [15:0] CoreAPB3_0_APBmslave0_PRDATA_0_15to0;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA_0;
wire   [15:0] CoreAPB3_0_APBmslave0_PWDATA_0_15to0;
wire   [15:0] CoreAPB3_0_APBmslave0_PWDATA_0;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_1;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_2_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_2;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA;
wire   [31:8] CoreAPB3_0_APBmslave2_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave2_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave5_PRDATA;
wire   [31:8] CoreAPB3_0_APBmslave5_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave5_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave5_PRDATA_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                  = 1'b0;
assign ram_lcd_data_const_net_0 = 132'h00000000000000000000000000000000F;
assign VCC_net                  = 1'b1;
assign duty_const_net_0         = 8'h14;
assign duty_const_net_1         = 8'h14;
assign duty_const_net_2         = 8'h14;
assign duty_const_net_3         = 8'h14;
assign IADDR_const_net_0        = 32'h00000000;
assign PADDR_const_net_0        = 6'h00;
assign PWDATA_const_net_0       = 8'h00;
assign PRDATAS3_const_net_0     = 32'h00000000;
assign PRDATAS4_const_net_0     = 32'h00000000;
assign PRDATAS6_const_net_0     = 32'h00000000;
assign PRDATAS7_const_net_0     = 32'h00000000;
assign PRDATAS8_const_net_0     = 32'h00000000;
assign PRDATAS9_const_net_0     = 32'h00000000;
assign PRDATAS10_const_net_0    = 32'h00000000;
assign PRDATAS11_const_net_0    = 32'h00000000;
assign PRDATAS12_const_net_0    = 32'h00000000;
assign PRDATAS13_const_net_0    = 32'h00000000;
assign PRDATAS14_const_net_0    = 32'h00000000;
assign PRDATAS15_const_net_0    = 32'h00000000;
assign PRDATAS16_const_net_0    = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign MMUART_1_TXD_net_1 = MMUART_1_TXD_net_0;
assign MMUART_1_TXD       = MMUART_1_TXD_net_1;
assign MMUART_0_TXD_net_1 = MMUART_0_TXD_net_0;
assign MMUART_0_TXD       = MMUART_0_TXD_net_1;
assign GPIO_0_M2F_net_1   = GPIO_0_M2F_net_0;
assign GPIO_0_M2F         = GPIO_0_M2F_net_1;
assign net_1_net_0        = net_1;
assign pwm_0              = net_1_net_0;
assign pwm_1_net_1        = pwm_1_net_0;
assign pwm_1              = pwm_1_net_1;
assign pwm_2_net_1        = pwm_2_net_0;
assign pwm_2              = pwm_2_net_1;
assign pwm_3_net_1        = pwm_3_net_0;
assign pwm_3              = pwm_3_net_1;
assign lcd_dc_out_net_1   = lcd_dc_out_net_0;
assign lcd_dc_out         = lcd_dc_out_net_1;
assign lcd_clk_out_net_1  = lcd_clk_out_net_0;
assign lcd_clk_out        = lcd_clk_out_net_1;
assign lcd_data_out_net_1 = lcd_data_out_net_0;
assign lcd_data_out       = lcd_data_out_net_1;
assign lcd_cs_out_net_1   = lcd_cs_out_net_0;
assign lcd_cs_out         = lcd_cs_out_net_1;
assign GPIO_OUT_net_1[0]  = GPIO_OUT_net_0[0];
assign GPIO_OUT[0:0]      = GPIO_OUT_net_1[0];
assign PWM_0_net_1        = PWM_0_net_0;
assign PWM[3:0]           = PWM_0_net_1;
assign LED2_net_1         = LED2_net_0;
assign LED2               = LED2_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAPB3_0_APBmslave0_PADDR_0_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_7to0 };
assign CoreAPB3_0_APBmslave0_PADDR_1_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_1 = { CoreAPB3_0_APBmslave0_PADDR_1_7to0 };
assign CoreAPB3_0_APBmslave0_PADDR_2_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_2 = { CoreAPB3_0_APBmslave0_PADDR_2_7to0 };
assign CoreAPB3_0_APBmslave0_PADDR_3_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_3 = { CoreAPB3_0_APBmslave0_PADDR_3_7to0 };

assign CoreAPB3_0_APBmslave0_PRDATA_0_31to16 = 16'h0;
assign CoreAPB3_0_APBmslave0_PRDATA_0_15to0 = CoreAPB3_0_APBmslave0_PRDATA[15:0];
assign CoreAPB3_0_APBmslave0_PRDATA_0 = { CoreAPB3_0_APBmslave0_PRDATA_0_31to16, CoreAPB3_0_APBmslave0_PRDATA_0_15to0 };

assign CoreAPB3_0_APBmslave0_PWDATA_0_15to0 = CoreAPB3_0_APBmslave0_PWDATA[15:0];
assign CoreAPB3_0_APBmslave0_PWDATA_0 = { CoreAPB3_0_APBmslave0_PWDATA_0_15to0 };
assign CoreAPB3_0_APBmslave0_PWDATA_1_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_1 = { CoreAPB3_0_APBmslave0_PWDATA_1_7to0 };
assign CoreAPB3_0_APBmslave0_PWDATA_2_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_2 = { CoreAPB3_0_APBmslave0_PWDATA_2_7to0 };

assign CoreAPB3_0_APBmslave2_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave2_PRDATA_0_7to0 = CoreAPB3_0_APBmslave2_PRDATA[7:0];
assign CoreAPB3_0_APBmslave2_PRDATA_0 = { CoreAPB3_0_APBmslave2_PRDATA_0_31to8, CoreAPB3_0_APBmslave2_PRDATA_0_7to0 };

assign CoreAPB3_0_APBmslave5_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave5_PRDATA_0_7to0 = CoreAPB3_0_APBmslave5_PRDATA[7:0];
assign CoreAPB3_0_APBmslave5_PRDATA_0 = { CoreAPB3_0_APBmslave5_PRDATA_0_31to8, CoreAPB3_0_APBmslave5_PRDATA_0_7to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.2.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 1 ),
        .APBSLOT2ENABLE  ( 1 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 1 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 19 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 20 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 4 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWRITE ),
        .PENABLE    ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PENABLE ),
        .PSEL       ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERRS1  ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .PREADYS2   ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERRS2  ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( CoreAPB3_0_APBmslave5_PREADY ),
        .PSLVERRS5  ( CoreAPB3_0_APBmslave5_PSLVERR ),
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PADDR ),
        .PWDATA     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWDATA ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA_0 ),
        .PRDATAS1   ( CoreAPB3_0_APBmslave1_PRDATA ),
        .PRDATAS2   ( CoreAPB3_0_APBmslave2_PRDATA_0 ),
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( CoreAPB3_0_APBmslave5_PRDATA_0 ),
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PREADY ),
        .PSLVERR    ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PSELS2     ( CoreAPB3_0_APBmslave2_PSELx ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     ( CoreAPB3_0_APBmslave5_PSELx ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ) 
        );

//--------FPGA_SoC_CoreGPIO_0_CoreGPIO   -   Actel:DirectCore:CoreGPIO:3.2.102
FPGA_SoC_CoreGPIO_0_CoreGPIO #( 
        .APB_WIDTH       ( 32 ),
        .FIXED_CONFIG_0  ( 0 ),
        .FIXED_CONFIG_1  ( 0 ),
        .FIXED_CONFIG_2  ( 0 ),
        .FIXED_CONFIG_3  ( 0 ),
        .FIXED_CONFIG_4  ( 0 ),
        .FIXED_CONFIG_5  ( 0 ),
        .FIXED_CONFIG_6  ( 0 ),
        .FIXED_CONFIG_7  ( 0 ),
        .FIXED_CONFIG_8  ( 0 ),
        .FIXED_CONFIG_9  ( 0 ),
        .FIXED_CONFIG_10 ( 0 ),
        .FIXED_CONFIG_11 ( 0 ),
        .FIXED_CONFIG_12 ( 0 ),
        .FIXED_CONFIG_13 ( 0 ),
        .FIXED_CONFIG_14 ( 0 ),
        .FIXED_CONFIG_15 ( 0 ),
        .FIXED_CONFIG_16 ( 0 ),
        .FIXED_CONFIG_17 ( 0 ),
        .FIXED_CONFIG_18 ( 0 ),
        .FIXED_CONFIG_19 ( 0 ),
        .FIXED_CONFIG_20 ( 0 ),
        .FIXED_CONFIG_21 ( 0 ),
        .FIXED_CONFIG_22 ( 0 ),
        .FIXED_CONFIG_23 ( 0 ),
        .FIXED_CONFIG_24 ( 0 ),
        .FIXED_CONFIG_25 ( 0 ),
        .FIXED_CONFIG_26 ( 0 ),
        .FIXED_CONFIG_27 ( 0 ),
        .FIXED_CONFIG_28 ( 0 ),
        .FIXED_CONFIG_29 ( 0 ),
        .FIXED_CONFIG_30 ( 0 ),
        .FIXED_CONFIG_31 ( 0 ),
        .INT_BUS         ( 0 ),
        .IO_INT_TYPE_0   ( 7 ),
        .IO_INT_TYPE_1   ( 7 ),
        .IO_INT_TYPE_2   ( 7 ),
        .IO_INT_TYPE_3   ( 7 ),
        .IO_INT_TYPE_4   ( 7 ),
        .IO_INT_TYPE_5   ( 7 ),
        .IO_INT_TYPE_6   ( 7 ),
        .IO_INT_TYPE_7   ( 7 ),
        .IO_INT_TYPE_8   ( 7 ),
        .IO_INT_TYPE_9   ( 7 ),
        .IO_INT_TYPE_10  ( 7 ),
        .IO_INT_TYPE_11  ( 7 ),
        .IO_INT_TYPE_12  ( 7 ),
        .IO_INT_TYPE_13  ( 7 ),
        .IO_INT_TYPE_14  ( 7 ),
        .IO_INT_TYPE_15  ( 7 ),
        .IO_INT_TYPE_16  ( 7 ),
        .IO_INT_TYPE_17  ( 7 ),
        .IO_INT_TYPE_18  ( 7 ),
        .IO_INT_TYPE_19  ( 7 ),
        .IO_INT_TYPE_20  ( 7 ),
        .IO_INT_TYPE_21  ( 7 ),
        .IO_INT_TYPE_22  ( 7 ),
        .IO_INT_TYPE_23  ( 7 ),
        .IO_INT_TYPE_24  ( 7 ),
        .IO_INT_TYPE_25  ( 7 ),
        .IO_INT_TYPE_26  ( 7 ),
        .IO_INT_TYPE_27  ( 7 ),
        .IO_INT_TYPE_28  ( 7 ),
        .IO_INT_TYPE_29  ( 7 ),
        .IO_INT_TYPE_30  ( 7 ),
        .IO_INT_TYPE_31  ( 7 ),
        .IO_NUM          ( 1 ),
        .IO_TYPE_0       ( 0 ),
        .IO_TYPE_1       ( 0 ),
        .IO_TYPE_2       ( 0 ),
        .IO_TYPE_3       ( 0 ),
        .IO_TYPE_4       ( 0 ),
        .IO_TYPE_5       ( 0 ),
        .IO_TYPE_6       ( 0 ),
        .IO_TYPE_7       ( 0 ),
        .IO_TYPE_8       ( 0 ),
        .IO_TYPE_9       ( 0 ),
        .IO_TYPE_10      ( 0 ),
        .IO_TYPE_11      ( 0 ),
        .IO_TYPE_12      ( 0 ),
        .IO_TYPE_13      ( 0 ),
        .IO_TYPE_14      ( 0 ),
        .IO_TYPE_15      ( 0 ),
        .IO_TYPE_16      ( 0 ),
        .IO_TYPE_17      ( 0 ),
        .IO_TYPE_18      ( 0 ),
        .IO_TYPE_19      ( 0 ),
        .IO_TYPE_20      ( 0 ),
        .IO_TYPE_21      ( 0 ),
        .IO_TYPE_22      ( 0 ),
        .IO_TYPE_23      ( 0 ),
        .IO_TYPE_24      ( 0 ),
        .IO_TYPE_25      ( 0 ),
        .IO_TYPE_26      ( 0 ),
        .IO_TYPE_27      ( 0 ),
        .IO_TYPE_28      ( 0 ),
        .IO_TYPE_29      ( 0 ),
        .IO_TYPE_30      ( 0 ),
        .IO_TYPE_31      ( 0 ),
        .IO_VAL_0        ( 0 ),
        .IO_VAL_1        ( 0 ),
        .IO_VAL_2        ( 0 ),
        .IO_VAL_3        ( 0 ),
        .IO_VAL_4        ( 0 ),
        .IO_VAL_5        ( 0 ),
        .IO_VAL_6        ( 0 ),
        .IO_VAL_7        ( 0 ),
        .IO_VAL_8        ( 0 ),
        .IO_VAL_9        ( 0 ),
        .IO_VAL_10       ( 0 ),
        .IO_VAL_11       ( 0 ),
        .IO_VAL_12       ( 0 ),
        .IO_VAL_13       ( 0 ),
        .IO_VAL_14       ( 0 ),
        .IO_VAL_15       ( 0 ),
        .IO_VAL_16       ( 0 ),
        .IO_VAL_17       ( 0 ),
        .IO_VAL_18       ( 0 ),
        .IO_VAL_19       ( 0 ),
        .IO_VAL_20       ( 0 ),
        .IO_VAL_21       ( 0 ),
        .IO_VAL_22       ( 0 ),
        .IO_VAL_23       ( 0 ),
        .IO_VAL_24       ( 0 ),
        .IO_VAL_25       ( 0 ),
        .IO_VAL_26       ( 0 ),
        .IO_VAL_27       ( 0 ),
        .IO_VAL_28       ( 0 ),
        .IO_VAL_29       ( 0 ),
        .IO_VAL_30       ( 0 ),
        .IO_VAL_31       ( 0 ),
        .OE_TYPE         ( 0 ) )
CoreGPIO_0(
        // Inputs
        .PRESETN  ( SYSRESET_0_POWER_ON_RESET_N ),
        .PCLK     ( FCCC_0_GL0 ),
        .PSEL     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PENABLE  ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE   ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR    ( CoreAPB3_0_APBmslave0_PADDR_1 ),
        .PWDATA   ( CoreAPB3_0_APBmslave0_PWDATA ),
        .GPIO_IN  ( GND_net ),
        // Outputs
        .PSLVERR  ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .PREADY   ( CoreAPB3_0_APBmslave1_PREADY ),
        .INT_OR   (  ),
        .PRDATA   ( CoreAPB3_0_APBmslave1_PRDATA ),
        .INT      (  ),
        .GPIO_OUT ( GPIO_OUT_net_0 ),
        .GPIO_OE  (  ) 
        );

//--------corepwm   -   Actel:DirectCore:corepwm:4.5.100
corepwm #( 
        .APB_DWIDTH          ( 16 ),
        .CONFIG_MODE         ( 0 ),
        .DAC_MODE1           ( 0 ),
        .DAC_MODE2           ( 0 ),
        .DAC_MODE3           ( 0 ),
        .DAC_MODE4           ( 0 ),
        .DAC_MODE5           ( 0 ),
        .DAC_MODE6           ( 0 ),
        .DAC_MODE7           ( 0 ),
        .DAC_MODE8           ( 0 ),
        .DAC_MODE9           ( 0 ),
        .DAC_MODE10          ( 0 ),
        .DAC_MODE11          ( 0 ),
        .DAC_MODE12          ( 0 ),
        .DAC_MODE13          ( 0 ),
        .DAC_MODE14          ( 0 ),
        .DAC_MODE15          ( 0 ),
        .DAC_MODE16          ( 0 ),
        .FAMILY              ( 19 ),
        .FIXED_PERIOD        ( 1 ),
        .FIXED_PERIOD_EN     ( 0 ),
        .FIXED_PRESCALE      ( 0 ),
        .FIXED_PRESCALE_EN   ( 1 ),
        .FIXED_PWM_NEG_EN1   ( 0 ),
        .FIXED_PWM_NEG_EN2   ( 0 ),
        .FIXED_PWM_NEG_EN3   ( 0 ),
        .FIXED_PWM_NEG_EN4   ( 0 ),
        .FIXED_PWM_NEG_EN5   ( 0 ),
        .FIXED_PWM_NEG_EN6   ( 0 ),
        .FIXED_PWM_NEG_EN7   ( 0 ),
        .FIXED_PWM_NEG_EN8   ( 0 ),
        .FIXED_PWM_NEG_EN9   ( 0 ),
        .FIXED_PWM_NEG_EN10  ( 0 ),
        .FIXED_PWM_NEG_EN11  ( 0 ),
        .FIXED_PWM_NEG_EN12  ( 0 ),
        .FIXED_PWM_NEG_EN13  ( 0 ),
        .FIXED_PWM_NEG_EN14  ( 0 ),
        .FIXED_PWM_NEG_EN15  ( 0 ),
        .FIXED_PWM_NEG_EN16  ( 0 ),
        .FIXED_PWM_NEGEDGE1  ( 0 ),
        .FIXED_PWM_NEGEDGE2  ( 0 ),
        .FIXED_PWM_NEGEDGE3  ( 0 ),
        .FIXED_PWM_NEGEDGE4  ( 0 ),
        .FIXED_PWM_NEGEDGE5  ( 0 ),
        .FIXED_PWM_NEGEDGE6  ( 0 ),
        .FIXED_PWM_NEGEDGE7  ( 0 ),
        .FIXED_PWM_NEGEDGE8  ( 0 ),
        .FIXED_PWM_NEGEDGE9  ( 0 ),
        .FIXED_PWM_NEGEDGE10 ( 0 ),
        .FIXED_PWM_NEGEDGE11 ( 0 ),
        .FIXED_PWM_NEGEDGE12 ( 0 ),
        .FIXED_PWM_NEGEDGE13 ( 0 ),
        .FIXED_PWM_NEGEDGE14 ( 0 ),
        .FIXED_PWM_NEGEDGE15 ( 0 ),
        .FIXED_PWM_NEGEDGE16 ( 0 ),
        .FIXED_PWM_POS_EN1   ( 1 ),
        .FIXED_PWM_POS_EN2   ( 1 ),
        .FIXED_PWM_POS_EN3   ( 1 ),
        .FIXED_PWM_POS_EN4   ( 1 ),
        .FIXED_PWM_POS_EN5   ( 1 ),
        .FIXED_PWM_POS_EN6   ( 1 ),
        .FIXED_PWM_POS_EN7   ( 1 ),
        .FIXED_PWM_POS_EN8   ( 1 ),
        .FIXED_PWM_POS_EN9   ( 1 ),
        .FIXED_PWM_POS_EN10  ( 1 ),
        .FIXED_PWM_POS_EN11  ( 1 ),
        .FIXED_PWM_POS_EN12  ( 1 ),
        .FIXED_PWM_POS_EN13  ( 1 ),
        .FIXED_PWM_POS_EN14  ( 1 ),
        .FIXED_PWM_POS_EN15  ( 1 ),
        .FIXED_PWM_POS_EN16  ( 1 ),
        .FIXED_PWM_POSEDGE1  ( 0 ),
        .FIXED_PWM_POSEDGE2  ( 0 ),
        .FIXED_PWM_POSEDGE3  ( 0 ),
        .FIXED_PWM_POSEDGE4  ( 0 ),
        .FIXED_PWM_POSEDGE5  ( 0 ),
        .FIXED_PWM_POSEDGE6  ( 0 ),
        .FIXED_PWM_POSEDGE7  ( 0 ),
        .FIXED_PWM_POSEDGE8  ( 0 ),
        .FIXED_PWM_POSEDGE9  ( 0 ),
        .FIXED_PWM_POSEDGE10 ( 0 ),
        .FIXED_PWM_POSEDGE11 ( 0 ),
        .FIXED_PWM_POSEDGE12 ( 0 ),
        .FIXED_PWM_POSEDGE13 ( 0 ),
        .FIXED_PWM_POSEDGE14 ( 0 ),
        .FIXED_PWM_POSEDGE15 ( 0 ),
        .FIXED_PWM_POSEDGE16 ( 0 ),
        .PWM_NUM             ( 4 ),
        .PWM_STRETCH_VALUE1  ( 0 ),
        .PWM_STRETCH_VALUE2  ( 0 ),
        .PWM_STRETCH_VALUE3  ( 0 ),
        .PWM_STRETCH_VALUE4  ( 0 ),
        .PWM_STRETCH_VALUE5  ( 0 ),
        .PWM_STRETCH_VALUE6  ( 0 ),
        .PWM_STRETCH_VALUE7  ( 0 ),
        .PWM_STRETCH_VALUE8  ( 0 ),
        .PWM_STRETCH_VALUE9  ( 0 ),
        .PWM_STRETCH_VALUE10 ( 0 ),
        .PWM_STRETCH_VALUE11 ( 0 ),
        .PWM_STRETCH_VALUE12 ( 0 ),
        .PWM_STRETCH_VALUE13 ( 0 ),
        .PWM_STRETCH_VALUE14 ( 0 ),
        .PWM_STRETCH_VALUE15 ( 0 ),
        .PWM_STRETCH_VALUE16 ( 0 ),
        .SEPARATE_PWM_CLK    ( 0 ),
        .SHADOW_REG_EN1      ( 0 ),
        .SHADOW_REG_EN2      ( 0 ),
        .SHADOW_REG_EN3      ( 0 ),
        .SHADOW_REG_EN4      ( 0 ),
        .SHADOW_REG_EN5      ( 0 ),
        .SHADOW_REG_EN6      ( 0 ),
        .SHADOW_REG_EN7      ( 0 ),
        .SHADOW_REG_EN8      ( 0 ),
        .SHADOW_REG_EN9      ( 0 ),
        .SHADOW_REG_EN10     ( 0 ),
        .SHADOW_REG_EN11     ( 0 ),
        .SHADOW_REG_EN12     ( 0 ),
        .SHADOW_REG_EN13     ( 0 ),
        .SHADOW_REG_EN14     ( 0 ),
        .SHADOW_REG_EN15     ( 0 ),
        .SHADOW_REG_EN16     ( 0 ),
        .TACH_EDGE1          ( 0 ),
        .TACH_EDGE2          ( 0 ),
        .TACH_EDGE3          ( 0 ),
        .TACH_EDGE4          ( 0 ),
        .TACH_EDGE5          ( 0 ),
        .TACH_EDGE6          ( 0 ),
        .TACH_EDGE7          ( 0 ),
        .TACH_EDGE8          ( 0 ),
        .TACH_EDGE9          ( 0 ),
        .TACH_EDGE10         ( 0 ),
        .TACH_EDGE11         ( 0 ),
        .TACH_EDGE12         ( 0 ),
        .TACH_EDGE13         ( 0 ),
        .TACH_EDGE14         ( 0 ),
        .TACH_EDGE15         ( 0 ),
        .TACH_EDGE16         ( 0 ),
        .TACH_NUM            ( 1 ),
        .TACHINT_ACT_LEVEL   ( 0 ) )
corepwm_0(
        // Inputs
        .PCLK    ( FCCC_0_GL0 ),
        .PENABLE ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PRESETN ( SYSRESET_0_POWER_ON_RESET_N ),
        .PSEL    ( CoreAPB3_0_APBmslave0_PSELx ),
        .PWRITE  ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PWM_CLK ( GND_net ), // tied to 1'b0 from definition
        .PADDR   ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PWDATA  ( CoreAPB3_0_APBmslave0_PWDATA_0 ),
        .TACHIN  ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .PREADY  ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .TACHINT (  ),
        .PRDATA  ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PWM     ( PWM_0_net_0 ) 
        );

//--------FPGA_SoC_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
FPGA_SoC_FCCC_0_FCCC FCCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FCCC_0_GL0 ),
        .GL1            ( FCCC_0_GL1 ),
        .LOCK           ( FCCC_0_LOCK ) 
        );

//--------FPGA_SoC_MSS
FPGA_SoC_MSS FPGA_SoC_MSS_0(
        // Inputs
        .MCCC_CLK_BASE          ( FCCC_0_GL0 ),
        .MMUART_1_RXD           ( MMUART_1_RXD ),
        .MMUART_0_RXD           ( MMUART_0_RXD ),
        .MCCC_CLK_BASE_PLL_LOCK ( FCCC_0_LOCK ),
        .M3_RESET_N             ( SYSRESET_0_POWER_ON_RESET_N ),
        .FIC_0_APB_M_PREADY     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PREADY ),
        .FIC_0_APB_M_PSLVERR    ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSLVERR ),
        .FIC_0_APB_M_PRDATA     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PRDATA ),
        // Outputs
        .MMUART_1_TXD           ( MMUART_1_TXD_net_0 ),
        .MMUART_0_TXD           ( MMUART_0_TXD_net_0 ),
        .GPIO_0_M2F             ( GPIO_0_M2F_net_0 ),
        .GPIO_1_M2F             (  ),
        .FIC_0_APB_M_PSEL       ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PSELx ),
        .FIC_0_APB_M_PWRITE     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWRITE ),
        .FIC_0_APB_M_PENABLE    ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PENABLE ),
        .FIC_0_APB_M_PADDR      ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PADDR ),
        .FIC_0_APB_M_PWDATA     ( FPGA_SoC_MSS_0_FIC_0_APB_MASTER_PWDATA ),
        // Inouts
        .I2C_1_SDA              ( I2C_1_SDA ),
        .I2C_1_SCL              ( I2C_1_SCL ) 
        );

//--------LCD_RGB
LCD_RGB LCD_RGB_0(
        // Inputs
        .clk_in         ( FCCC_0_GL1 ),
        .rst_n_in       ( SYSRESET_0_POWER_ON_RESET_N ),
        .ram_lcd_data   ( ram_lcd_data_const_net_0 ),
        // Outputs
        .ram_lcd_clk_en (  ),
        .lcd_rst_n_out  (  ),
        .lcd_bl_out     (  ),
        .lcd_dc_out     ( lcd_dc_out_net_0 ),
        .lcd_clk_out    ( lcd_clk_out_net_0 ),
        .lcd_data_out   ( lcd_data_out_net_0 ),
        .lcd_cs_out     ( lcd_cs_out_net_0 ),
        .ram_lcd_addr   (  ) 
        );

//--------FPGA_SoC_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
FPGA_SoC_OSC_0_OSC OSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F (  ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------PWMctr
PWMctr PWMctr_0(
        // Inputs
        .clk   ( FCCC_0_GL0 ),
        .reset ( SYSRESET_0_POWER_ON_RESET_N ),
        .en    ( VCC_net ),
        .duty  ( duty_const_net_0 ),
        // Outputs
        .pwm   ( net_1 ) 
        );

//--------PWMctr
PWMctr PWMctr_1(
        // Inputs
        .clk   ( FCCC_0_GL0 ),
        .reset ( SYSRESET_0_POWER_ON_RESET_N ),
        .en    ( VCC_net ),
        .duty  ( duty_const_net_1 ),
        // Outputs
        .pwm   ( pwm_1_net_0 ) 
        );

//--------PWMctr
PWMctr PWMctr_2(
        // Inputs
        .clk   ( FCCC_0_GL0 ),
        .reset ( SYSRESET_0_POWER_ON_RESET_N ),
        .en    ( VCC_net ),
        .duty  ( duty_const_net_2 ),
        // Outputs
        .pwm   ( pwm_2_net_0 ) 
        );

//--------PWMctr
PWMctr PWMctr_3(
        // Inputs
        .clk   ( FCCC_0_GL0 ),
        .reset ( SYSRESET_0_POWER_ON_RESET_N ),
        .en    ( VCC_net ),
        .duty  ( duty_const_net_3 ),
        // Outputs
        .pwm   ( pwm_3_net_0 ) 
        );

//--------reg_apb_demo
reg_apb_demo reg_apb_demo_0(
        // Inputs
        .PCLK    ( FCCC_0_GL0 ),
        .PENABLE ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSEL    ( CoreAPB3_0_APBmslave5_PSELx ),
        .PRESERN ( SYSRESET_0_POWER_ON_RESET_N ),
        .PWRITE  ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR   ( CoreAPB3_0_APBmslave0_PADDR_3 ),
        .PWDATA  ( CoreAPB3_0_APBmslave0_PWDATA_2 ),
        // Outputs
        .PREADY  ( CoreAPB3_0_APBmslave5_PREADY ),
        .PSLVERR ( CoreAPB3_0_APBmslave5_PSLVERR ),
        .PRDATA  ( CoreAPB3_0_APBmslave5_PRDATA ),
        .LED2    ( LED2_net_0 ) 
        );

//--------reg_apb_wrp
reg_apb_wrp reg_apb_wrp_0(
        // Inputs
        .PCLK    ( FCCC_0_GL0 ),
        .PENABLE ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSEL    ( CoreAPB3_0_APBmslave2_PSELx ),
        .PRESERN ( SYSRESET_0_POWER_ON_RESET_N ),
        .PWRITE  ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR   ( CoreAPB3_0_APBmslave0_PADDR_2 ),
        .PWDATA  ( CoreAPB3_0_APBmslave0_PWDATA_1 ),
        // Outputs
        .PREADY  ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERR ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .PRDATA  ( CoreAPB3_0_APBmslave2_PRDATA ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_0(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( SYSRESET_0_POWER_ON_RESET_N ) 
        );


endmodule
