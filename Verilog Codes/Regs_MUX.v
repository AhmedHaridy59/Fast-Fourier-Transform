//////////////////////////////////////////////////////////////////////////////////

// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 06/02/2021 01:46:17 AM
// Design Name: 
// Module Name: Regs_MUX
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


module Regs_MUX(

input [2*16*16-1:0] R_x,
input [2*16*16-1:0] R_A,
input [2*16*16-1:0] R_B,
input [2*16*16-1:0] R_C,
input [2*16*16-1:0] R_D,

input [2:0] MAC_IN_Sel,

output reg [2*16*16-1:0] MAC_In
    );
    always@(*)
    begin
        case(MAC_IN_Sel)
            3'b000: MAC_In <= R_x;
            3'b001: MAC_In <= R_A;
            3'b010: MAC_In <= R_B;
            3'b011: MAC_In <= R_C;
            default:MAC_In <= R_D; 
        endcase
    end
    
endmodule
