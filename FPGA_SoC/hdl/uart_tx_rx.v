///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: uart_tx_rx.v
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

module uart_tx_rx(  clk,
    n_reset,
    uart_tx,
    uart_rx
);
    input clk;
    input n_reset;
    input  uart_rx;
    output uart_tx;
    
    reg uart_EN;
    reg [7:0]tx_Data;
    wire [7:0]rx_Data;

    wire Tx_done;
    wire Rx_done;

    uart_byte_tx uart_byte_tx(
        .clk(clk),
        .n_reset(n_reset),
        .Data(tx_Data),
        .Send_Go(uart_EN),
        .Baud_set(3'd4),
        .uart_tx(uart_tx),
        .Tx_done(Tx_done)
    );

     uart_byte_rx uart_byte_rx0(
        .Clk(clk),
        .Reset_n(n_reset),
        .uart_RXD(uart_rx),
        .uart_Data(rx_Data),
        .Rx_done(Rx_done)   
    );
 
always @(*)	
begin
		tx_Data <= rx_Data;
end

always @(posedge clk or negedge n_reset)	begin
		if (!n_reset)
            begin
                uart_EN <= 1'b0;
            end
		else if (Rx_done)
           	uart_EN <= 1'b1;
		else if (Tx_done)
            begin
             //tx_Data <= tx_Data + 1'b1;   
			uart_EN <= 1'b0;
             end
		//else
		//	uart_EN <= uart_EN;
	end
/*
    reg [24:0]counter;
    always@(posedge clk or negedge n_reset)
        begin
            if(!n_reset)
                counter <= 0;
            else if(counter == 4999999)     //4999999 
                counter <= 0;
            else
                counter <= counter + 1;
        end

    always@(posedge clk or negedge n_reset)
    begin
        if(!n_reset)       
            uart_EN <= 0;
        else if(counter == 1)
            uart_EN <= 1;
        else
            uart_EN <= 0;
    end

    always@(posedge clk or negedge n_reset)
    begin
        if(!n_reset)        
            tx_Data <= 0;
        else if(Tx_done)
            tx_Data <= tx_Data + 1'b1;   
    end
*/

   /*    
    input clk;
    input n_reset;
    input  uart_rx;
    output uart_tx;

    reg [7:0]tx_Data;
	//wire [7:0]rx_Data;
	reg uart_EN;
//	wire Tx_done;
	//wire Rx_done;

   uart_byte_tx uart_byte_tx(
        .clk(clk),
        .n_reset(n_reset),
        .Data(tx_data),
        .Send_Go(uart_EN),
        .Baud_set(3'd0),
        .uart_tx(uart_tx),
        .Tx_done(Tx_done)
    );
 
    uart_byte_rx uart_byte_rx0(
        .Clk(clk),
        .Reset_n(n_reset),
        .uart_RXD(uart_rx),
        .uart_Data(rx_data),
        .Rx_done(Rx_done)   
    );
  
always @(*)	
begin
		tx_Data <= rx_Data;
end
always @(posedge clk or negedge n_reset)	begin
		if (!n_reset)
			uart_EN <= 1'b0;
		else if (Rx_done)
			uart_EN <= 1'b1;
		else if (Tx_done)
			uart_EN <= 1'b0;
		else
			uart_EN <= uart_EN;
	end


 reg [24:0]counter;
    always@(posedge clk or negedge n_reset)
        begin
            if(!n_reset)
                counter <= 0;
            else if(counter == 4999999)     //4999999 
                counter <= 0;
            else
                counter <= counter + 1;
        end

    always@(posedge clk or negedge n_reset)
    begin
        if(!n_reset)       
            uart_EN <= 0;
        else if(counter == 1)
            uart_EN <= 1;
        else
            uart_EN <= 0;
    end

    always@(posedge clk or negedge n_reset)
    begin
        if(!n_reset)        
            tx_Data <= 0;
        else if(Tx_done)
            tx_Data <= tx_Data + 1'b1;   
    end
*/

endmodule

