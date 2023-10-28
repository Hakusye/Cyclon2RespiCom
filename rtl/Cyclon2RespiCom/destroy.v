//--------------------
// Top of the FPGA
//--------------------
module destroy
(
    input  wire switch,    // Switch 
    output wire buzzer     // Buzzer Output
);

//assign buzzer = switch?1'b0:1'b1;

//-----------------------------
// スイッチONでブザーがなる
//-----------------------------
reg buzzer_cntl;
reg counter;

always @(posedge switch)
begin
	if(counter == 1'b1)
		buzzer_cntl <= 1'b1;
	else
		buzzer_cntl <= 1'b0;
	counter <= ~counter;
end

assign buzzer = buzzer_cntl;

endmodule