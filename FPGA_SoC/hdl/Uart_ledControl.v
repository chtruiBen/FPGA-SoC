///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: Uart_ledControl.v
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

module Uart_ledControl( clk,clk_uart, reset, en,key,uart_rx, pwm_mul );
input clk,clk_uart, reset, en;
input uart_rx;
input [3:0] key;
output [2:0]pwm_mul;

wire Rx_done;
wire [7:0] rx_Data;
reg [7:0] pwm_duty;
wire[3:0] key_press;
reg [3:0] key_pwm;
reg [3:0] key_uart;
//<statements>
always @ (posedge clk or negedge reset)
begin
        if(!reset)
        begin
        key_pwm <=0;
        end
        else
        begin
            if(key_press[0]==1)key_pwm[0]<=key_press[0];
            else key_pwm[0]<=(key_press[0]|key_pwm[0]);
            if(key_press[1]==1)key_pwm[1]<=key_press[1];
            else key_pwm[1]<=(key_press[1]|key_pwm[1]);
            if(key_press[2]==1)key_pwm[2]<=key_press[2];
            else key_pwm[2]<=(key_press[2]|key_pwm[2]);
            
            if(rx_Data==8'h00)
                    begin
                         key_pwm[0]<=0;
                    end
                else
                    begin
                         pwm_duty <=rx_Data;
                    end
        end
end

uart_byte_rx uart_byte_rx_led(
        .Clk(clk_uart),
        .Reset_n(reset),
        .uart_RXD(uart_rx), //input 1bit
        .uart_Data(rx_Data),//output
        .Rx_done(Rx_done)  //out 
    );
key_driver(
	.clk(clk), .n_reset(reset),				// inputs
    .key(key),
	.press(key_press)													
	); 
PWM pwm0(
    .clk(clk), 
    .reset(reset),
    .en(key_pwm[0]),
    .duty(pwm_duty),// inputs
	.pwm(pwm_mul[0])
    );

PWM pwm1(
    .clk(clk), 
    .reset(reset),// inputs
    .en(key_press[1]),
    .duty(8'd20),
	.pwm(pwm_mul[1])
    );
PWM pwm2(
    .clk(clk), 
    .reset(reset),// inputs
    .en(key_pwm[2]),
    .duty(8'd50),
	.pwm(pwm_mul[2])
    );



        
         

endmodule

