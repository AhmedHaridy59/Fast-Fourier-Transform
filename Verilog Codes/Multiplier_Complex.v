//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 06/01/2021 06:28:29 PM
// Design Name: 
// Module Name: Multiplier_Complex
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


module Multiplier_Complex#(
	//Parameterized values
	parameter Q = 6,
	parameter N = 8
	
	)
	(
	
	// Inputs as Input = InReal + j * InImg ; InReal +InImg = MS 8 bits + LS 8 bits = 16 bits 
    input [2*N-1:0] In2,
    input [2*N-1:0] In3, // W's
    
    // Outputs 
    output [2*N-1:0] Out,

    
    // Feedback signals
    output Overflow
   
       );
       
       
       
       wire [N-1:0] InReal2, InReal3, InImg2, InImg3;
       wire [N-1:0] OutReal, OutImg;
       
       wire [N-1:0] OutRealpart1,OutRealpart2,OutRealpart2dash;
       wire [N-1:0] OutImgpart1,OutImgpart2;
       
       wire Overflow1, Overflow2, Overflow3, Overflow4;
       
       
       
        assign InReal2 = In2[2*N-1:N];
        assign InImg2  = In2[N-1:0];

        assign InReal3 = In3[2*N-1:N];
        assign InImg3  = In3[N-1:0];
       
       
         ////// Implementing the Equation of OutReal = InReal2 * InReal3 - InImg2 * InImg3 
        
        // Multiplication of InReal2 * InReal3 
        mul_fixed MUL0 (
        .i_multiplicand(InReal2),
        .i_multiplier(InReal3),
        .o_result(OutRealpart1),
        .ovr(Overflow1)
             );
        
        // Multiplication of InImg2 * InImg3
        mul_fixed MUL1(
        .i_multiplicand(InImg2),
        .i_multiplier(InImg3),
        .o_result(OutRealpart2dash),
        .ovr(Overflow2)
             );
            
        // negative for InImg2 * InImg3 to be - InImg2 * InImg3
        
        assign OutRealpart2 = {~OutRealpart2dash[N-1],OutRealpart2dash[N-2:0]};
        
        
        // Addition of OutReal = InReal2 * InReal3 - InImg2 * InImg3 
        add_fixed ADD1(
        .a(OutRealpart1),
        .b(OutRealpart2),
        .c(OutReal)
            );    
            
        
        ////// Implementing the Equation of OutImg  = InReal2 * InImg3 + InReal3 * InImg2  

            // Multiplication of InReal2 * InImg3
            mul_fixed MUL2 (
            .i_multiplicand(InReal2),
            .i_multiplier(InImg3),
            .o_result(OutImgpart1),
            .ovr(Overflow3)
                 );
            
            // Multiplication of InReal3 * InImg2
            mul_fixed MUL3(
            .i_multiplicand(InReal3),
            .i_multiplier(InImg2),
            .o_result(OutImgpart2),
            .ovr(Overflow4)
                 );
                 
            // Addition of OutReal = InReal1 * InReal2 - InImg1 * InImg2 
            add_fixed ADD2(
            .a(OutImgpart1),
            .b(OutImgpart2),
            .c(OutImg)
                );   
                
            assign Out = {OutReal , OutImg};
            assign Overflow = Overflow1 || Overflow2 || Overflow3 || Overflow4; 
                  
endmodule
