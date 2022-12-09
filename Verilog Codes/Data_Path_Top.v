//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 06/02/2021 02:32:27 AM
// Design Name: 
// Module Name: Data_Path_Top
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


module Data_Path_Top(
// Common Inputs 
input clock,
input clock1,

input reset,

// Control Signals
    input Local_reset,
    
    input Wr_En_x, Wr_En_A, Wr_En_B, Wr_En_C, Wr_En_D, Wr_En_X,  
    input Rd_En_x, Rd_En_A, Rd_En_B, Rd_En_C, Rd_En_D, Rd_En_X,
    input [2:0] MAC_IN_Sel,

    input [2:0] ROMW_add,
    
    input [2:0] Sel_Mapping,
    
    // Data Flow
    input [2*16*16-1:0] Data_In,
    
    output [2*16*16-1:0] Data_Out,
    
    // Status Signals
    output Overflow 
    );
    
    // Internal Signals Declaration
    
    wire [2*16*16-1:0]  MAC_out_Mapped; 
    
    wire [2*16*16-1:0] MAC_In1_2;
    
    wire [16*16-1:0] MAC_In3;
     
    wire [2*16*16-1:0] MAC_Out1_2; 
    
    
    // Register File
    Register_File RF( 
    .clock(clock),
    .clock1(clock1),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En_x(Wr_En_x), .Wr_En_A(Wr_En_A), 
    .Wr_En_B(Wr_En_B), .Wr_En_C(Wr_En_C),
    .Wr_En_D(Wr_En_D), .Wr_En_X(Wr_En_X),  
    .Rd_En_x(Rd_En_x), .Rd_En_A(Rd_En_A), 
    .Rd_En_B(Rd_En_B), .Rd_En_C(Rd_En_C), 
    .Rd_En_D(Rd_En_D), .Rd_En_X(Rd_En_X),
    .MAC_IN_Sel(MAC_IN_Sel),
    .Data_In(Data_In),
    .MAC_out_Mapped(MAC_out_Mapped),
    .MAC_In(MAC_In1_2),
    .Data_Out(Data_Out) 
    );
    
    // ROM_W
    ROM_W ROMW(
    .clock(clock),
    .addr_i(ROMW_add),
    .W_out(MAC_In3)
    );
    
    // MAC Array
     MAC_Array MA(
     .MAC_In1_2(MAC_In1_2),
     .MAC_In3(MAC_In3),
     .MAC_Out1_2(MAC_Out1_2), 
     .Overflow(Overflow)
      );
      
    // Mapping Circuit
    
    Mapping_CCT MC(
    .in_unmapped(MAC_Out1_2),
    .Sel_Mapping(Sel_Mapping),
    .out_mapped(MAC_out_Mapped)
    );
    
endmodule
