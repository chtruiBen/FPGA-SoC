///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: Led_count.v
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
`timescale 1ns / 1ps
module Led_count( clk, reset, en, led);
input clk, reset;
input [3:0]en;
output reg [3:0] led;
reg [31:0] timer_led;
reg [3:0] led_temp ;
reg [3:0] led_key, led_key_ ;
parameter CNT_MAX = 32'd1600000;
parameter LED_FQ  = 32'd100000;

//<statements>
//timer_led add 1 
always @(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        timer_led <=32'b0;
    end
    else if (timer_led == CNT_MAX-1) 
    begin
            timer_led <=32'b0;
    end 
    else 
    begin 
        timer_led <= timer_led+1'b1;
    end
end

//led blinks when timer_led == 500000(aka 0.5s)
always @(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        led <=4'b1111;
        led_temp <=4'b0;
        led_key<=4'b0;
    end
    //else if(timer_led==CNT_MAX-1)
    //begin       
        //led <=4'b1111;
        //led_temp <=4'b0;
        //led_key<=4'b0;     
    //end
    else if(timer_led==LED_FQ-1)
    begin 
        //led_temp<=1'b1;
        //led <={led[0],led[3:1]};//bit rotate
        led_temp <= led_temp+led_key;
        led <=~led_temp;
        
        led_key<= 4'b0;     
    end
    //case(en)
    //4'b0001:led_key<= 4'b0001; 
    //4'b0010:led_key<= 4'b0010;
    //4'b0100:led_key<= 4'b0100;
    //4'b1000:led_key<= 4'b1000;
    //endcase
    else if(en==4'b0001) led_key<=4'b0001;
    else if(en==4'b0010) led_key<=4'b0010;
    else if(en==4'b0100) led_key<=4'b0100;
    else if(en==4'b1000) led_key<=4'b1000;
    //else if(en[1]) led_key[1]<=1'b1;
    //else if(en[2]) led_key[2]<=1'b1;
    //else if(en[3]) led_key[3]<=1'b1;
              
end
//falling edge trigger

//FullAdder4bits led4_adder( .A(), B(), Cin(),.Sum(), .Cout());
endmodule

