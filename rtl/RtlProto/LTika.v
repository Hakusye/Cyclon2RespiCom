
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

//-----------------------------
// Counter to make 1sec Period
//-----------------------------
reg  [31:0] counter_1sec;
wire        period_1sec;
//
always @(posedge clk, negedge res_n)
begin
    if (~res_n)
        counter_1sec <= 32'h00000000;
    else if (period_1sec)
        counter_1sec <= 32'h00000000;
    else
        counter_1sec <= counter_1sec + 32'h00000001;
end
//
assign period_1sec = (counter_1sec == (`CYCLE_1SEC - 1));

//----------------------------
// Counter to make LED signal
//----------------------------
reg  [2:0] counter_led;
//
always @(posedge clk, negedge res_n)
begin
    if (~res_n)
        counter_led <= 3'b000;
    else if (period_1sec)
        counter_led <= counter_led + 3'b001;
end
//
assign led = ~counter_led; // LED on by low level

endmodule