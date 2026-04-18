`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2026 09:31:48
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module gaussian_tb;

reg clk;

gaussian_top #(1194,1280) DUT
(
.clk(clk)
);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
#200000

$finish;
end

endmodule
