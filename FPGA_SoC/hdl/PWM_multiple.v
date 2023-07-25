///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: PWM_multiple.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::SmartFusion2> <Die::M2S010T> <Package::256 VF>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module PWM_multiple( clk, reset,				// inputs
    en,
	pwm_mul);
input clk, reset,en;
//input [15:0]duty[2:0];
output [2:0]pwm_mul;

//<statements>
PWM pwm0(
    .clk(clk), 
    .reset(reset),// inputs
    .en(en),
    .duty(16'd10),
	.pwm(pwm_mul[0])
    );
PWM pwm1(
    .clk(clk), 
    .reset(reset),// inputs
    .en(en),
    .duty(16'd20),
	.pwm(pwm_mul[1])
    );
PWM pwm2(
    .clk(clk), 
    .reset(reset),// inputs
    .en(en),
    .duty(16'd50),
	.pwm(pwm_mul[2])
    );
endmodule

