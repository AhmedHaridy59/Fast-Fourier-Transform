//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 06/02/2021 01:52:19 AM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
 // Common Inputs
    input clock,
    input clock1,
    
    input reset,
    
// Control signals
    input Local_reset,
    
    input Wr_En_x, Wr_En_A, Wr_En_B, Wr_En_C, Wr_En_D, Wr_En_X,  
    input Rd_En_x, Rd_En_A, Rd_En_B, Rd_En_C, Rd_En_D, Rd_En_X,
    input [2:0] MAC_IN_Sel,
    
    input [2*16*16-1:0] Data_In,
    input [2*16*16-1:0] MAC_out_Mapped,
    
    output [2*16*16-1:0] MAC_In,
    output [2*16*16-1:0] Data_Out 
    );
    
    // internal signals declaration
    wire [2*16*16-1:0] R_x, R_A, R_B, R_C, R_D, R_X;
    
    // Rx
    Register Rx(
    .clock(clock1),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_x),
    .Rd_En(Rd_En_x),
    .Data_In(Data_In),
    .Data_Out(R_x)
    );
    
     // RA
    Register RA(
    .clock(clock),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_A),
    .Rd_En(Rd_En_A),
    .Data_In(MAC_out_Mapped),
    .Data_Out(R_A)
    );   
    
     // RB
    Register RB(
    .clock(clock),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_B),
    .Rd_En(Rd_En_B),
    .Data_In(MAC_out_Mapped),
    .Data_Out(R_B)
    );       
    
    // RC
    Register RC(
    .clock(clock),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_C),
    .Rd_En(Rd_En_C),
    .Data_In(MAC_out_Mapped),
    .Data_Out(R_C)
    ); 
    
     // RD
    Register RD(
    .clock(clock),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_D),
    .Rd_En(Rd_En_D),
    .Data_In(MAC_out_Mapped),
    .Data_Out(R_D)
    );     
    
     // RX
    Register RX(
    .clock(clock1),
    .reset(reset),
    .Local_reset(Local_reset),
    .Wr_En(Wr_En_X),
    .Rd_En(Rd_En_X),
    .Data_In(MAC_out_Mapped),
    .Data_Out(R_X)
    );   
    
    assign Data_Out = R_X;
    
     // Regs out Mux (we choose which Register will feed MACs due to current stage)
     Regs_MUX RMUX(
     .R_x(R_x),
     .R_A(R_A),
     .R_B(R_B),
     .R_C(R_C),
     .R_D(R_D),
     .MAC_IN_Sel(MAC_IN_Sel),
     .MAC_In(MAC_In)
    );
     
endmodule