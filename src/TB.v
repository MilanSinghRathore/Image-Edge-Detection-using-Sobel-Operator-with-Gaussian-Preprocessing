`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Sobel Edge Detection
//////////////////////////////////////////////////////////////////////////////////

module tb_sobel_top;

    parameter WIDTH  = 1194;
    parameter HEIGHT = 1280;

    reg clk = 0;

    // Instantiate the Sobel module
    sobel_top #(.WIDTH(WIDTH), .HEIGHT(HEIGHT)) sobel_inst (
        .clk(clk)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        $display("Starting Sobel Edge Detection Simulation...");
        // Run simulation long enough for module to finish
        #20;  // small wait for clk posedge to trigger always block
        // The module will automatically write output file and finish
    end

endmodule