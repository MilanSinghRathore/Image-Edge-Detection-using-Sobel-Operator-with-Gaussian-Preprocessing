`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name: sobel_top
// Description: Sobel Edge Detection for grayscale image memory input
//              Reads "gaussian_image.mem" and writes "sobel_output.mem"
//////////////////////////////////////////////////////////////////////////////////

module sobel_top #
(
    parameter WIDTH  = 1194,      // Image width
    parameter HEIGHT = 1280       // Image height
)
(
    input clk
);

    reg [7:0] img_mem [0:WIDTH*HEIGHT-1];      // Input Gaussian image
    reg [7:0] edge_mem [0:WIDTH*HEIGHT-1];     // Output edge memory

    integer x, y;
    integer idx;
    reg signed [15:0] Gx, Gy;
    reg signed [15:0] sum;

    // Read Gaussian-filtered image
    initial begin
        $readmemh("D:/Xilinx projects/Sobel_edge_detection.srcs/sim_1/new/nature_input_memory.mem", img_mem);

        // Initialize output memory to zero
        for (idx = 0; idx < WIDTH*HEIGHT; idx = idx + 1)
            edge_mem[idx] = 8'd0;
    end

    // Main processing
    always @(posedge clk) begin
        for (y = 1; y < HEIGHT-1; y = y + 1) begin
            for (x = 1; x < WIDTH-1; x = x + 1) begin
                idx = y*WIDTH + x;

                // Compute Gx
                Gx = -img_mem[(y-1)*WIDTH + (x-1)] + img_mem[(y-1)*WIDTH + (x+1)]
                     -2*img_mem[y*WIDTH + (x-1)]   + 2*img_mem[y*WIDTH + (x+1)]
                     -img_mem[(y+1)*WIDTH + (x-1)] + img_mem[(y+1)*WIDTH + (x+1)];

                // Compute Gy
                Gy = -img_mem[(y-1)*WIDTH + (x-1)] -2*img_mem[(y-1)*WIDTH + x] - img_mem[(y-1)*WIDTH + (x+1)]
                     + img_mem[(y+1)*WIDTH + (x-1)] +2*img_mem[(y+1)*WIDTH + x] + img_mem[(y+1)*WIDTH + (x+1)];

                // Gradient magnitude
                sum = (Gx < 0 ? -Gx : Gx) + (Gy < 0 ? -Gy : Gy);

                // Clip to 8-bit
                if (sum > 255)
                    edge_mem[idx] = 8'd255;
                else
                    edge_mem[idx] = sum[7:0];
            end
        end

        // Write output memory to file
        $writememh("D:/Xilinx projects/Sobel_edge_detection.srcs/sim_1/new/nature_output_memory_without_GF.mem", edge_mem);

        // Finish simulation
        $display("Sobel Edge Detection completed, output saved .");
        $finish;
    end

endmodule