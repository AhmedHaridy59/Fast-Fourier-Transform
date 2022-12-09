//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2021 10:07:29 PM
// Design Name: 
// Module Name: ROM_W
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


module ROM_W(
input clock,
input   [2:0]  addr_i,  // 23 bit address
output reg [255:0]   W_out     // output port
    );

always @(posedge clock)
begin
	case(addr_i)    
	3'b000  : W_out <=256'b01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000_01000000_00000000 ; 
    3'b001  : W_out <=256'b00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000_00000000_11000000_01000000_00000000 ; 
    3'b010  : W_out <=256'b10101101_10101101_00000001_11000000_00101101_10101101_01000000_00000000_10101101_10101101_00000001_11000000_00101101_10101101_01000000_00000000_10101101_10101101_00000001_11000000_00101101_10101101_01000000_00000000_10101101_10101101_00000001_11000000_00101101_10101101_01000000_00000000 ; 
    3'b011  : W_out <=256'b10111011_10011001_10101101_10101101_10011001_10111011_00000001_11000000_00011001_10111011_00101101_10101101_00111011_10011001_01000000_00000000_10111011_10011001_10101101_10101101_10011001_10111011_00000001_11000000_00011001_10111011_00101101_10101101_00111011_10011001_01000000_00000000 ; 
    default : W_out <=256'b10111110_10001101_10111011_10011001_10110101_10100100_10101101_10101101_10100100_10110101_10011001_10111011_10001101_10111110_00000001_11000000_00001101_10111110_00011001_10111011_00100100_10110101_00101101_10101101_00110101_10100100_00111011_10011001_00111110_10001101_01000000_00000000 ; 
    endcase
end
endmodule