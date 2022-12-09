//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2021 05:47:12 PM
// Design Name: 
// Module Name: Mapping_CCT
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


module Mapping_CCT(
input [2*16*16-1:0] in_unmapped,
input [2:0] Sel_Mapping,
output reg [2*16*16-1:0] out_mapped
    );
    
    
wire [2*16*16-1:0] x_mapped;
wire [2*16*16-1:0] A_mapped;
wire [2*16*16-1:0] B_mapped;
wire [2*16*16-1:0] C_mapped;
wire [2*16*16-1:0] D_mapped;
wire [2*16*16-1:0] X_mapped;

    
wire [15:0] x_in_arr [31:0]; // 32 x each is 16 bit
wire [15:0] A_in_arr [31:0]; // 32 x each is 16 bit
wire [15:0] B_in_arr [31:0]; // 32 x each is 16 bit
wire [15:0] C_in_arr [31:0]; // 32 x each is 16 bit
wire [15:0] D_in_arr [31:0]; // 32 x each is 16 bit
wire [15:0] X_in_arr [31:0]; // 32 x each is 16 bit


// x Mapping
assign {x_in_arr[31],x_in_arr[30],x_in_arr[29], x_in_arr[28],x_in_arr[27],x_in_arr[26],x_in_arr[25],x_in_arr[24],
        x_in_arr[23],x_in_arr[22],x_in_arr[21],x_in_arr[20],x_in_arr[19],x_in_arr[18],x_in_arr[17],x_in_arr[16],
        x_in_arr[15],x_in_arr[14],x_in_arr[13],x_in_arr[12],x_in_arr[11],x_in_arr[10],x_in_arr[9],x_in_arr[8],
        x_in_arr[7],x_in_arr[6],x_in_arr[5],x_in_arr[4],x_in_arr[3],x_in_arr[2],x_in_arr[1],x_in_arr[0]}= in_unmapped;

assign x_mapped = {x_in_arr[31],x_in_arr[13],x_in_arr[23], x_in_arr[7],x_in_arr[27],x_in_arr[11],x_in_arr[19],x_in_arr[3],
        x_in_arr[29],x_in_arr[13],x_in_arr[21],x_in_arr[5],x_in_arr[25],x_in_arr[9],x_in_arr[17],x_in_arr[1],
        x_in_arr[30],x_in_arr[14],x_in_arr[22],x_in_arr[0],x_in_arr[26],x_in_arr[10],x_in_arr[18],x_in_arr[2],
        x_in_arr[28],x_in_arr[12],x_in_arr[20],x_in_arr[4],x_in_arr[24],x_in_arr[8],x_in_arr[16],x_in_arr[0]};
        
        

// A Mapping
assign {A_in_arr[31],A_in_arr[30],A_in_arr[29], A_in_arr[28],A_in_arr[27],A_in_arr[26],A_in_arr[25],A_in_arr[24],
        A_in_arr[23],A_in_arr[22],A_in_arr[21],A_in_arr[20],A_in_arr[19],A_in_arr[18],A_in_arr[17],A_in_arr[16],
        A_in_arr[15],A_in_arr[14],A_in_arr[13],A_in_arr[12],A_in_arr[11],A_in_arr[10],A_in_arr[9],A_in_arr[8],
        A_in_arr[7],A_in_arr[6],A_in_arr[5],A_in_arr[4],A_in_arr[3],A_in_arr[2],A_in_arr[1],A_in_arr[0]}= in_unmapped;

assign A_mapped = {A_in_arr[31],A_in_arr[29],A_in_arr[30], A_in_arr[28],A_in_arr[27],A_in_arr[25],A_in_arr[26],A_in_arr[24],
        A_in_arr[23],A_in_arr[21],A_in_arr[22],A_in_arr[20],A_in_arr[19],A_in_arr[17],A_in_arr[18],A_in_arr[16],
        A_in_arr[15],A_in_arr[13],A_in_arr[14],A_in_arr[12],A_in_arr[11],A_in_arr[9],A_in_arr[10],A_in_arr[8],
        A_in_arr[7],A_in_arr[5],A_in_arr[6],A_in_arr[4],A_in_arr[3],A_in_arr[1],A_in_arr[2],A_in_arr[0]};

// B Mapping
assign {B_in_arr[31],B_in_arr[30],B_in_arr[29], B_in_arr[28],B_in_arr[27],B_in_arr[26],B_in_arr[25],B_in_arr[24],
        B_in_arr[23],B_in_arr[22],B_in_arr[21],B_in_arr[20],B_in_arr[19],B_in_arr[18],B_in_arr[17],B_in_arr[16],
        B_in_arr[15],B_in_arr[14],B_in_arr[13],B_in_arr[12],B_in_arr[11],B_in_arr[10],B_in_arr[9],B_in_arr[8],
        B_in_arr[7],B_in_arr[6],B_in_arr[5],B_in_arr[4],B_in_arr[3],B_in_arr[2],B_in_arr[1],B_in_arr[0]}= in_unmapped;

assign B_mapped = {B_in_arr[31],B_in_arr[27],B_in_arr[29], B_in_arr[25],B_in_arr[30],B_in_arr[26],B_in_arr[28],B_in_arr[24],
        B_in_arr[23],B_in_arr[19],B_in_arr[21],B_in_arr[17],B_in_arr[22],B_in_arr[18],B_in_arr[20],B_in_arr[16],
        B_in_arr[15],B_in_arr[11],B_in_arr[13],B_in_arr[9],B_in_arr[14],B_in_arr[10],B_in_arr[12],B_in_arr[8],
        B_in_arr[7],B_in_arr[3],B_in_arr[5],B_in_arr[1],B_in_arr[6],B_in_arr[2],B_in_arr[4],B_in_arr[0]};        
       
// C Mapping
assign {C_in_arr[31],C_in_arr[30],C_in_arr[29], C_in_arr[28],C_in_arr[27],C_in_arr[26],C_in_arr[25],C_in_arr[24],
        C_in_arr[23],C_in_arr[22],C_in_arr[21],C_in_arr[20],C_in_arr[19],C_in_arr[18],C_in_arr[17],C_in_arr[16],
        C_in_arr[15],C_in_arr[14],C_in_arr[13],C_in_arr[12],C_in_arr[11],C_in_arr[10],C_in_arr[9],C_in_arr[8],
        C_in_arr[7],C_in_arr[6],C_in_arr[5],C_in_arr[4],C_in_arr[3],C_in_arr[2],C_in_arr[1],C_in_arr[0]}= in_unmapped;

assign C_mapped = {C_in_arr[31],C_in_arr[23],C_in_arr[29], C_in_arr[21],C_in_arr[27],C_in_arr[19],C_in_arr[25],C_in_arr[17],
        C_in_arr[30],C_in_arr[22],C_in_arr[28],C_in_arr[20],C_in_arr[26],C_in_arr[18],C_in_arr[24],C_in_arr[16],
        C_in_arr[15],C_in_arr[7],C_in_arr[13],C_in_arr[5],C_in_arr[11],C_in_arr[3],C_in_arr[9],C_in_arr[1],
        C_in_arr[14],C_in_arr[6],C_in_arr[12],C_in_arr[4],C_in_arr[10],C_in_arr[2],C_in_arr[8],C_in_arr[0]};        
       
// D Mapping
assign {D_in_arr[31],D_in_arr[30],D_in_arr[29], D_in_arr[28],D_in_arr[27],D_in_arr[26],D_in_arr[25],D_in_arr[24],
        D_in_arr[23],D_in_arr[22],D_in_arr[21],D_in_arr[20],D_in_arr[19],D_in_arr[18],D_in_arr[17],D_in_arr[16],
        D_in_arr[15],D_in_arr[14],D_in_arr[13],D_in_arr[12],D_in_arr[11],D_in_arr[10],D_in_arr[9],D_in_arr[8],
        D_in_arr[7],D_in_arr[6],D_in_arr[5],D_in_arr[4],D_in_arr[3],D_in_arr[2],D_in_arr[1],D_in_arr[0]}= in_unmapped;

assign D_mapped = {D_in_arr[31],D_in_arr[15],D_in_arr[29], D_in_arr[13],D_in_arr[27],D_in_arr[11],D_in_arr[25],D_in_arr[9],
        D_in_arr[23],D_in_arr[7],D_in_arr[21],D_in_arr[5],D_in_arr[19],D_in_arr[3],D_in_arr[17],D_in_arr[1],
        D_in_arr[30],D_in_arr[14],D_in_arr[28],D_in_arr[12],D_in_arr[26],D_in_arr[10],D_in_arr[24],D_in_arr[8],
        D_in_arr[22],D_in_arr[6],D_in_arr[20],D_in_arr[4],D_in_arr[18],D_in_arr[2],D_in_arr[16],D_in_arr[0]};        
       
// X Mapping
assign {X_in_arr[31],X_in_arr[15],X_in_arr[30], X_in_arr[14],X_in_arr[29],X_in_arr[13],X_in_arr[28],X_in_arr[12],
        X_in_arr[27],X_in_arr[11],X_in_arr[26],X_in_arr[10],X_in_arr[25],X_in_arr[9],X_in_arr[24],X_in_arr[8],
        X_in_arr[23],X_in_arr[7],X_in_arr[22],X_in_arr[6],X_in_arr[21],X_in_arr[5],X_in_arr[20],X_in_arr[4],
        X_in_arr[19],X_in_arr[3],X_in_arr[18],X_in_arr[2],X_in_arr[17],X_in_arr[1],X_in_arr[16],X_in_arr[0]}= in_unmapped;

assign X_mapped = {X_in_arr[31],X_in_arr[30],X_in_arr[29], X_in_arr[28],X_in_arr[27],X_in_arr[26],X_in_arr[25],X_in_arr[24],
        X_in_arr[23],X_in_arr[22],X_in_arr[21],X_in_arr[20],X_in_arr[19],X_in_arr[18],X_in_arr[17],X_in_arr[16],
        X_in_arr[15],X_in_arr[14],X_in_arr[13],X_in_arr[12],X_in_arr[11],X_in_arr[10],X_in_arr[9],X_in_arr[8],
        X_in_arr[7],X_in_arr[6],X_in_arr[5],X_in_arr[4],X_in_arr[3],X_in_arr[2],X_in_arr[1],X_in_arr[0]};
        
        
always @(*)
begin
    case(Sel_Mapping)
        3'b000: out_mapped <= x_mapped;
        3'b001: out_mapped <= A_mapped;
        3'b010: out_mapped <= B_mapped;
        3'b011: out_mapped <= C_mapped;
        3'b100: out_mapped <= D_mapped;
        default: out_mapped <= X_mapped; 
    endcase
end        
        

endmodule
