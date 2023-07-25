///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: PWM.v
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
`timescale 1ns / 1ps //
module PWMctr(clk, reset,				// inputs
    en,
    duty,
	pwm);
input clk,reset;
input en;
input [7:0]duty;
output pwm;

reg [31:0] CNT;
reg pwm;
reg en_;
reg [15:0] period;  //100  */**10MHz/10 = 1MHZ ;/100=100KHZ/*
reg [15:0] h_time;  // 10*0.3=3 30% duty
reg [31:0] timer;
always @ ( posedge clk or negedge reset )
        begin
             if(!reset)
                begin
                    CNT <=0;
                    period <=16'd100;
                    //h_time <=16'd30;
                end
             else if(CNT >= period - 1 )
                CNT <= 0;
            else
                CNT <= CNT + 1;
            end


always @ ( posedge clk or negedge reset )
        begin
            if(!reset) begin h_time <=16'd100;timer <= 32'd0; end
                       
            else
                begin   
                 if(timer >= 32'd10000000)//100KHZ *100
                    begin   
                        if(h_time==16'd0)h_time <=16'd100;
                        else               h_time <= h_time- duty;
                        
                        timer <=0;
                    end
                 else
                    timer <= timer +1;
                end
        end

always @ ( posedge clk or negedge reset )
        begin
              if(!reset)
                begin
                     pwm<= 0;
                     en_<= 0;
                     //en<= 0;
                end
              else
                begin              
                    if(en == 1)en_<=en;
                    else  en_<=(en|en_);
                     
                    if(en_ == 1)
                            begin
                               if(CNT <= h_time - 1)
                                   pwm <= 1;
                               else pwm <= 0;
                
                             end
                      else pwm <= 0;//en_ = 0
                 end
                            
                     
                        

        end
//<statements>



//<statements>

endmodule

