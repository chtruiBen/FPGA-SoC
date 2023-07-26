///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: reg_demo.v
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

module reg_demo( clk, nreset, wr_en, rd_en, addr, data_in, data_out,led); 
  
  
//Inputs Declarations 
input  clk;             //Clock
input  nreset;          //active low reset  
input  wr_en;           //Write Enable 
input  rd_en;           //Read Enable 
input  [3:0] addr;      //Address Width 
input  [7:0] data_in;   //Data Input 
  
//output Declarations 
output [7:0] data_out;  //Data Output 
 
output reg led;
//reg Declarations 
reg [7:0] mem [15:0];    //Memory 
reg [7:0] data_out;     //Data Output 
  
//Generation of data_out 
always @(posedge clk, negedge nreset) 
    begin : READ_GEN 
        if(nreset == 1'b0)
            begin
                data_out <= 32'h00000000;
            end
        else if(rd_en)
            begin  
                data_out <= mem[addr]; 
end           end 

//Generation Writing data into memory 
always @(posedge clk, negedge nreset) 
    begin : WRITE_GEN 
        if(nreset == 1'b0)
            begin
                //mem[addr] <= 32'h00000000;
                led<=1'b1;
            end
        else if(wr_en)
            begin  
               	 mem[addr] <= data_in;
                 case (addr)
                 4'b0000: begin
                            led <= (~data_in & 8'b1);
                          end
                 endcase  
            end
  	 
end
  
endmodule
