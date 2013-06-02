// ps2_keyboard.v

// This file was auto-generated as part of a generation operation.
// If you edit it your changes will probably be lost.

`timescale 1 ps / 1 ps
module ps2_keyboard (
		input  wire        clk,         //       clock_reset.clk
		input  wire        reset,       // clock_reset_reset.reset
		input  wire        address,     //      avalon_slave.address
		input  wire        chipselect,  //                  .chipselect
		input  wire [3:0]  byteenable,  //                  .byteenable
		input  wire        read,        //                  .read
		input  wire        write,       //                  .write
		input  wire [31:0] writedata,   //                  .writedata
		output wire [31:0] readdata,    //                  .readdata
		output wire        waitrequest, //                  .waitrequest
		inout  wire        PS2_CLK,     //       conduit_end.export
		inout  wire        PS2_DAT,     //                  .export
		output wire        irq          //  interrupt_sender.irq
	);

	ps2_component ps2_keyboard (
		.clk         (clk),         //       clock_reset.clk
		.reset       (reset),       // clock_reset_reset.reset
		.address     (address),     //      avalon_slave.address
		.chipselect  (chipselect),  //                  .chipselect
		.byteenable  (byteenable),  //                  .byteenable
		.read        (read),        //                  .read
		.write       (write),       //                  .write
		.writedata   (writedata),   //                  .writedata
		.readdata    (readdata),    //                  .readdata
		.waitrequest (waitrequest), //                  .waitrequest
		.PS2_CLK     (PS2_CLK),     //       conduit_end.export
		.PS2_DAT     (PS2_DAT),     //                  .export
		.irq         (irq)          //  interrupt_sender.irq
	);

endmodule
