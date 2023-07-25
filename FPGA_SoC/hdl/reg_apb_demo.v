///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: reg_apb_demo.v
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


module reg_apb_demo(
  PCLK,
  PENABLE,
  PSEL,
  PRESERN,
  PWRITE,
  PREADY,
  PSLVERR,
  PADDR,
  PWDATA,
  PRDATA,
  LED2);


input PCLK,PENABLE, PSEL, PRESERN, PWRITE;
input  [7:0] PWDATA, PADDR;
output [7:0] PRDATA;
output PREADY, PSLVERR;
output LED2;

wire rd_enable;
wire wr_enable;

assign wr_enable = (PENABLE &&  PWRITE && PSEL);
assign rd_enable = (!PWRITE && PSEL); //Data is ready during first cycle to make it availble on the bus when PENABLE is asserted

reg_demo reg_demo_0 (.clk(PCLK), .nreset(PRESERN), .wr_en(wr_enable), 
        .rd_en(rd_enable), .addr(PADDR[5:2]), .data_in(PWDATA), .data_out(PRDATA),.led(LED2));
        
assign PREADY = 1'b1; 
assign PSLVERR = 1'b0;         
    
endmodule
