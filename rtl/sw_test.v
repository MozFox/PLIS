module lab_1
(
	input [9:0] sw_1,
	output [6:0] HEX0,
	output [7:0] AN
);

reg [3:0] DC1;
reg [3:0] DC2;
reg [6:0] DC_DEC;
reg [3:0] MP;

assign AN = 8'b11111110;
assign HEX0 = DC_DEC;

always @(*) begin
	case(MP)
	4'd0: DC_DEC <=  7'b1000000;
	4'd1: DC_DEC <=  7'b1111001;
	4'd2: DC_DEC <=  7'b0100100;
	4'd3: DC_DEC <=  7'b0110000;
	4'd4: DC_DEC <=  7'b0011001;
	4'd5: DC_DEC <=  7'b0010010;
	4'd6: DC_DEC <=  7'b0000010;
	4'd7: DC_DEC <=  7'b1111000;
	4'd8: DC_DEC <=  7'b0000000;
	4'd9: DC_DEC <=  7'b0010000;
	default: DC_DEC <= 7'b1111111;
	endcase
end

always @(sw_1[9:8]) begin
	case(sw_1[9:8])
	2'b00: MP <= DC1;
	2'b01: MP <= DC2;
	2'b10: MP <= f;
	2'b11: MP <= sw_1[3:0];
	default: MP <= 4'b0000;
	endcase
end

always @(sw_1[3:0]) begin
	case(sw_1[3:0])
	4'b0000: DC1 <= 4'd0;
	4'b0001: DC1 <= 4'd0;
	4'b0010: DC1 <= 4'd1;
	4'b0011: DC1 <= 4'd0;
	4'b0100: DC1 <= 4'd1;
	4'b0101: DC1 <= 4'd1;
	4'b0110: DC1 <= 4'd1;
	4'b0111: DC1 <= 4'd0;
	4'b1000: DC1 <= 4'd1;
	4'b1001: DC1 <= 4'd1;
	4'b1010: DC1 <= 4'd2;
	4'b1011: DC1 <= 4'd1;
	4'b1100: DC1 <= 4'd1;
	4'b1101: DC1 <= 4'd1;
	4'b1110: DC1 <= 4'd1;
	4'b1111: DC1 <= 4'd0;
	endcase
end
	
always @(sw_1[7:4]) begin
	DC2 <= ~sw_1[7:4];
end

assign f = (sw_1[0])&(sw_1[1])&(~sw_1[2])&(~sw_1[3]);
	
endmodule