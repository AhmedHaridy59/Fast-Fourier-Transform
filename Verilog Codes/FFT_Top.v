//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2021 02:54:54 AM
// Design Name: 
// Module Name: FFT_Top
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


module FFT_Top(

// Common Inputs 
input clock,
input clock1,
input reset,
    
// Data Flow
input [2*16*16-1:0] Data_In,
output [2*16*16-1:0] Data_Out,
    
// User Interface signals

input Start, // enable cct to start

output endop   // end of operation 

    );
    
    // internal signal declaration
    // Control Signals
    wire Local_reset;
    
    wire Wr_En_x, Wr_En_A, Wr_En_B, Wr_En_C, Wr_En_D, Wr_En_X;  
    wire Rd_En_x, Rd_En_A, Rd_En_B, Rd_En_C, Rd_En_D, Rd_En_X;
    wire [2:0] MAC_IN_Sel;

    wire [2:0] ROMW_add;
    
    wire [2:0] Sel_Mapping;

    
    // Status Signals
    wire Overflow;
    
    
    // Control Unit
    Control_Unit_Top CU(
    .clock(clock),
    .reset(reset),
    .Start(Start),
    .Overflow(Overflow), 
    .Local_reset(Local_reset),
    .Wr_En_x(Wr_En_x), .Wr_En_A(Wr_En_A), .Wr_En_B(Wr_En_B),
    .Wr_En_C(Wr_En_C), .Wr_En_D(Wr_En_D), .Wr_En_X(Wr_En_X),  
    .Rd_En_x(Rd_En_x), .Rd_En_A(Rd_En_A), .Rd_En_B(Rd_En_B),
    .Rd_En_C(Rd_En_C), .Rd_En_D(Rd_En_D), .Rd_En_X(Rd_En_X),
    .MAC_IN_Sel(MAC_IN_Sel),
    .ROMW_add(ROMW_add),
    .Sel_Mapping(Sel_Mapping),
    .endop(endop)
    );
    
    // Data Path
    Data_Path_Top DP( 
    .clock(clock),
    .clock1(clock1),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En_x(Wr_En_x), .Wr_En_A(Wr_En_A), .Wr_En_B(Wr_En_B),
    .Wr_En_C(Wr_En_C), .Wr_En_D(Wr_En_D), .Wr_En_X(Wr_En_X),  
    .Rd_En_x(Rd_En_x), .Rd_En_A(Rd_En_A), .Rd_En_B(Rd_En_B),
    .Rd_En_C(Rd_En_C), .Rd_En_D(Rd_En_D), .Rd_En_X(Rd_En_X),
    .MAC_IN_Sel(MAC_IN_Sel),
    .ROMW_add(ROMW_add),
    .Sel_Mapping(Sel_Mapping),
    .Data_In(Data_In),
    .Data_Out(Data_Out),
    .Overflow(Overflow) 
    );
    
    
endmodule
