`timescale 1ns / 1ps
module sw_test_tb();

wire [15:0] led;
reg [15:0] sw;

sw_test OUT (
    .sw_1 (sw ),
    .AN (led )
    );
initial begin  
    sw = 16'b0;
    repeat(20) begin
    #4 sw = sw + 1'b1;
    end
end


endmodule