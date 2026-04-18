`timescale 1ns / 1ps

module gaussian_top #
(
parameter WIDTH  = 1194,
parameter HEIGHT = 1280
)
(
input clk
);

reg [7:0] image [0:WIDTH*HEIGHT-1];
reg [7:0] output_img [0:WIDTH*HEIGHT-1];

integer x,y;
reg [31:0] sum;

initial
begin

// Read image
$readmemh("D:/Xilinx projects/9x9gaussian.srcs/sim_1/new/nature_memory9X9.mem", image);

// Copy original image
for(x=0; x<WIDTH*HEIGHT; x=x+1)
    output_img[x] = image[x];

// Apply 9x9 Gaussian
for(y = 4; y < HEIGHT-4; y = y + 1)
begin
    for(x = 4; x < WIDTH-4; x = x + 1)
    begin
        sum =
        image[(y-4)*WIDTH + (x-4)]*0  + image[(y-4)*WIDTH + (x-3)]*0  + image[(y-4)*WIDTH + (x-2)]*1  + image[(y-4)*WIDTH + (x-1)]*2  + image[(y-4)*WIDTH + (x)]*3  + image[(y-4)*WIDTH + (x+1)]*2  + image[(y-4)*WIDTH + (x+2)]*1  + image[(y-4)*WIDTH + (x+3)]*0  + image[(y-4)*WIDTH + (x+4)]*0  +
        image[(y-3)*WIDTH + (x-4)]*0  + image[(y-3)*WIDTH + (x-3)]*2  + image[(y-3)*WIDTH + (x-2)]*4  + image[(y-3)*WIDTH + (x-1)]*8  + image[(y-3)*WIDTH + (x)]*10 + image[(y-3)*WIDTH + (x+1)]*8  + image[(y-3)*WIDTH + (x+2)]*4  + image[(y-3)*WIDTH + (x+3)]*2  + image[(y-3)*WIDTH + (x+4)]*0  +
        image[(y-2)*WIDTH + (x-4)]*1  + image[(y-2)*WIDTH + (x-3)]*4  + image[(y-2)*WIDTH + (x-2)]*11 + image[(y-2)*WIDTH + (x-1)]*19 + image[(y-2)*WIDTH + (x)]*22 + image[(y-2)*WIDTH + (x+1)]*19 + image[(y-2)*WIDTH + (x+2)]*11 + image[(y-2)*WIDTH + (x+3)]*4  + image[(y-2)*WIDTH + (x+4)]*1  +
        image[(y-1)*WIDTH + (x-4)]*2  + image[(y-1)*WIDTH + (x-3)]*8  + image[(y-1)*WIDTH + (x-2)]*19 + image[(y-1)*WIDTH + (x-1)]*36 + image[(y-1)*WIDTH + (x)]*41 + image[(y-1)*WIDTH + (x+1)]*36 + image[(y-1)*WIDTH + (x+2)]*19 + image[(y-1)*WIDTH + (x+3)]*8  + image[(y-1)*WIDTH + (x+4)]*2  +
        image[(y)*WIDTH   + (x-4)]*3  + image[(y)*WIDTH   + (x-3)]*10 + image[(y)*WIDTH   + (x-2)]*22 + image[(y)*WIDTH   + (x-1)]*41 + image[(y)*WIDTH   + (x)]*47 + image[(y)*WIDTH   + (x+1)]*41 + image[(y)*WIDTH   + (x+2)]*22 + image[(y)*WIDTH   + (x+3)]*10 + image[(y)*WIDTH   + (x+4)]*3  +
        image[(y+1)*WIDTH + (x-4)]*2  + image[(y+1)*WIDTH + (x-3)]*8  + image[(y+1)*WIDTH + (x-2)]*19 + image[(y+1)*WIDTH + (x-1)]*36 + image[(y+1)*WIDTH + (x)]*41 + image[(y+1)*WIDTH + (x+1)]*36 + image[(y+1)*WIDTH + (x+2)]*19 + image[(y+1)*WIDTH + (x+3)]*8  + image[(y+1)*WIDTH + (x+4)]*2  +
        image[(y+2)*WIDTH + (x-4)]*1  + image[(y+2)*WIDTH + (x-3)]*4  + image[(y+2)*WIDTH + (x-2)]*11 + image[(y+2)*WIDTH + (x-1)]*19 + image[(y+2)*WIDTH + (x)]*22 + image[(y+2)*WIDTH + (x+1)]*19 + image[(y+2)*WIDTH + (x+2)]*11 + image[(y+2)*WIDTH + (x+3)]*4  + image[(y+2)*WIDTH + (x+4)]*1  +
        image[(y+3)*WIDTH + (x-4)]*0  + image[(y+3)*WIDTH + (x-3)]*2  + image[(y+3)*WIDTH + (x-2)]*4  + image[(y+3)*WIDTH + (x-1)]*8  + image[(y+3)*WIDTH + (x)]*10 + image[(y+3)*WIDTH + (x+1)]*8  + image[(y+3)*WIDTH + (x+2)]*4  + image[(y+3)*WIDTH + (x+3)]*2  + image[(y+3)*WIDTH + (x+4)]*0  +
        image[(y+4)*WIDTH + (x-4)]*0  + image[(y+4)*WIDTH + (x-3)]*0  + image[(y+4)*WIDTH + (x-2)]*1  + image[(y+4)*WIDTH + (x-1)]*2  + image[(y+4)*WIDTH + (x)]*3  + image[(y+4)*WIDTH + (x+1)]*2  + image[(y+4)*WIDTH + (x+2)]*1  + image[(y+4)*WIDTH + (x+3)]*0  + image[(y+4)*WIDTH + (x+4)]*0;

        output_img[y*WIDTH + x] = sum >> 10; // divide by 1024

    end
end

// Write output
$writememh("D:/Xilinx projects/9x9gaussian.srcs/sim_1/new/nature_output9x9.mem", output_img);

end

endmodule