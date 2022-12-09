
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 06/02/2021 01:32:08 AM
// Design Name: 
// Module Name: Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/*  
    This register is to store data for each stage (Pipelining stage),
    which is 2 Iputs each is 16 bits (8 real and 8 imaginary) and that for 16 MAC
*/
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register(

// Common Inputs
input clock,
input reset,

// Control signals
input Local_reset, 
input Wr_En, 
input Rd_En,

input [2*16*16-1:0] Data_In,

output reg [2*16*16-1:0] Data_Out
  
    );
    
 always @(posedge clock or posedge reset)
 begin
    if (reset || Local_reset)
        Data_Out <= 512'b0;
          else if (Wr_En)
             Data_Out <= Data_In;
               else 
                 Data_Out <= Data_Out; 
    end
endmodule
