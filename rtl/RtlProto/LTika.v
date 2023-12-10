
 `define CYCLE_1SEC 48000000

//--------------------
// Top of the FPGA
//--------------------
module LTika
(
    input  wire clk,       // 48MHz Clock
    input  wire res_n,     // Reset Switch
    output wire [2:0] led  // LED Output
);


Counter counter_25000
(
	.inCounter(clk),
	.CountVal(32'd25000),
	.res_n(res_n),				
	.outCounter(led[0])
);




endmodule