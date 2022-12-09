//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2021 06:51:19 PM
// Design Name: 
// Module Name: MAC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
/*
    this module is to implement complex multiplication and Accumulative According to the following equation:
     
     AddOut = In1 + In2 * In3
     SubOut = In1 - In2 * In3
     : In1, In2, In3 are complex numbers which have complex operations
     
*/ 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MAC#(
	//Parameterized values
	parameter Q = 6,
	parameter N = 8
	
	)
	(
	
    // Inputs as each Input = InReal + j * InImg
    input [2*N-1:0] In1,
    input [2*N-1:0] In2,
    input [2*N-1:0] In3,
    
    // Outputs 

    output [2*N-1:0] AddOut,
    output [2*N-1:0] SubOut,

  
    // Feedback signals
    output Overflow
    );
    
    // wire [N-1:0] InReal1, InReal2, InReal3, InImg1, InImg2, InImg3;
    
    wire [N-1:0] OutReal1, OutReal2, OutImg1, OutImg2;
  
    wire [2*N-1:0] AddIn1, AddIn2;

    assign AddOut  = {OutReal1, OutImg1};
    assign SubOut  = {OutReal2, OutImg2}; 
        
    //assign InReal1  = In1[2*N-1:N];
    //assign InImg1   = In1[N-1:0];
    
    //assign InReal2  = In2[2*N-1:N];
    //assign InImg2   = In2[N-1:0];
    
    //assign InReal3  = In3[2*N-1:N];
    //assign InImg3   = In3[N-1:0];
    
    
    // Complex Multiplication
    Multiplier_Complex MULComp (
    .In2(In2),
    .In3(In3), 
    .Out(AddIn2),
    .Overflow(Overflow));
    
    assign AddIn1 = In1;
    
    ////////////////////////////////////////////////////////////////////////////////////
        
    // Complex Adder
    // AddOutReal = AddInReal1 + AddInReal2
    // AddOutImg  = AddInImg1  + AddInImg2 
    
    add_fixed Addreal(
    .a(AddIn1[2*N-1:N]),
    .b(AddIn2[2*N-1:N]),
    .c(OutReal1)
    );
    
    add_fixed Addimg(
    .a(AddIn1[N-1:0]),
    .b(AddIn2[N-1:0]),
    .c(OutImg1)
    );        
    
    
    // Complex Subtractor 
    // SubOutReal = AddInReal1 - AddInReal2 = SubInReal1 + SubInReal2
    // SubOutImg  = AddInImg1  - AddInImg2  = SubInImg1  + SubInImg2 
    
    add_fixed Subreal(
    .a(AddIn1[2*N-1:N]),
    .b({~AddIn2[2*N-1],AddIn2[2*N-2:N]}),
    .c(OutReal2)
    );    
    
    
    add_fixed Subimg(
    .a(AddIn1[N-1:0]),
    .b({~AddIn2[N-1],AddIn2[N-2:0]}),
    .c(OutImg2)
    );     
   //////////////////////////////////////////////////////////////////////////////////////////
    
endmodule
