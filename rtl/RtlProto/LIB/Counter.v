
 `define CYCLE_1SEC 48000000
 
//--------------------
// Top of the FPGA
//--------------------
module Counter
(
    input  wire inCounter,				// 48MHz Clock
	 input  wire [31:0] CountVal,		// Coount Val
    input  wire res_n,					// Reset Switch
    output reg outCounter				// Counter Output
);

//-----------------------------
// 48MHz to 19.2kHz
//-----------------------------
reg	[31:0] Counter;
	
always @(posedge inCounter, negedge res_n)
begin
	if(~res_n)
	begin
		if (Counter == CountVal)
		begin
			Counter = 32'h00000000;
			outCounter = ~outCounter;
		end
	end
	else
	begin
		Counter = 32'h00000000;
		outCounter = 1'b0;
	end
	
	Counter = Counter + 32'h00000001;
		
end

endmodule

//