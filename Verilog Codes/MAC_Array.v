/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 06/01/2021 08:08:59 PM
// Design Name: 
// Module Name: MAC_Array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  this module to have 16 instances of MAC
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MAC_Array(

input [2*16*16-1:0] MAC_In1_2,
input [16*16-1:0] MAC_In3,

output [2*16*16-1:0] MAC_Out1_2,

output Overflow
    );

wire Overflow0,Overflow1,Overflow2,Overflow3,Overflow4,Overflow5,Overflow6,Overflow7,Overflow8,
Overflow9,Overflow10,Overflow11,Overflow12,Overflow13,Overflow14,Overflow15;


// MAC 0 
MAC MAC0(
.In1(MAC_In1_2[15:0]),
.In2(MAC_In1_2[31:16]),
.In3(MAC_In3[15:0]),
.AddOut(MAC_Out1_2[15:0]),
.SubOut(MAC_Out1_2[31:16]),
.Overflow(Overflow0));

// MAC 1 
MAC MAC1(
.In1(MAC_In1_2[47:32]),
.In2(MAC_In1_2[63:48]),
.In3(MAC_In3[31:16]),
.AddOut(MAC_Out1_2[47:32]),
.SubOut(MAC_Out1_2[63:48]),
.Overflow(Overflow1));


// MAC 2 
MAC MAC2(
.In1(MAC_In1_2[79:64]),
.In2(MAC_In1_2[95:80]),
.In3(MAC_In3[47:32]),
.AddOut(MAC_Out1_2[79:64]),
.SubOut(MAC_Out1_2[95:80]),
.Overflow(Overflow2));

// MAC 3 
MAC MAC3(
.In1(MAC_In1_2[111:96]),
.In2(MAC_In1_2[127:112]),
.In3(MAC_In3[63:48]),
.AddOut(MAC_Out1_2[111:96]),
.SubOut(MAC_Out1_2[127:112]),
.Overflow(Overflow3));

// MAC 4 
MAC MAC4(
.In1(MAC_In1_2[143:128]),
.In2(MAC_In1_2[159:144]),
.In3(MAC_In3[79:64]),
.AddOut(MAC_Out1_2[143:128]),
.SubOut(MAC_Out1_2[159:144]),
.Overflow(Overflow4));

// MAC 5 
MAC MAC5(
.In1(MAC_In1_2[175:160]),
.In2(MAC_In1_2[191:176]),
.In3(MAC_In3[95:80]),
.AddOut(MAC_Out1_2[175:160]),
.SubOut(MAC_Out1_2[191:176]),
.Overflow(Overflow5));

// MAC 6 
MAC MAC6(
.In1(MAC_In1_2[207:192]),
.In2(MAC_In1_2[223:208]),
.In3(MAC_In3[111:96]),
.AddOut(MAC_Out1_2[207:192]),
.SubOut(MAC_Out1_2[223:208]),
.Overflow(Overflow6));

// MAC 7 
MAC MAC7(
.In1(MAC_In1_2[239:224]),
.In2(MAC_In1_2[255:240]),
.In3(MAC_In3[127:112]),
.AddOut(MAC_Out1_2[239:224]),
.SubOut(MAC_Out1_2[255:240]),
.Overflow(Overflow7));

// MAC 8 
MAC MAC8(
.In1(MAC_In1_2[271:256]),
.In2(MAC_In1_2[287:272]),
.In3(MAC_In3[143:128]),
.AddOut(MAC_Out1_2[271:256]),
.SubOut(MAC_Out1_2[287:272]),
.Overflow(Overflow8));

// MAC 9 
MAC MAC9(
.In1(MAC_In1_2[303:288]),
.In2(MAC_In1_2[319:304]),
.In3(MAC_In3[159:144]),
.AddOut(MAC_Out1_2[303:288]),
.SubOut(MAC_Out1_2[319:304]),
.Overflow(Overflow9));

// MAC 10 
MAC MAC10(
.In1(MAC_In1_2[335:320]),
.In2(MAC_In1_2[351:336]),
.In3(MAC_In3[175:160]),
.AddOut(MAC_Out1_2[335:320]),
.SubOut(MAC_Out1_2[351:336]),
.Overflow(Overflow10));

// MAC 11 
MAC MAC11(
.In1(MAC_In1_2[367:352]),
.In2(MAC_In1_2[383:368]),
.In3(MAC_In3[191:176]),
.AddOut(MAC_Out1_2[367:352]),
.SubOut(MAC_Out1_2[383:368]),
.Overflow(Overflow11));

// MAC 12 
MAC MAC12(
.In1(MAC_In1_2[399:384]),
.In2(MAC_In1_2[415:400]),
.In3(MAC_In3[207:192]),
.AddOut(MAC_Out1_2[399:384]),
.SubOut(MAC_Out1_2[415:400]),
.Overflow(Overflow12));

// MAC 13 
MAC MAC13(
.In1(MAC_In1_2[431:416]),
.In2(MAC_In1_2[447:432]),
.In3(MAC_In3[223:208]),
.AddOut(MAC_Out1_2[431:416]),
.SubOut(MAC_Out1_2[447:432]),
.Overflow(Overflow13));

// MAC 14 
MAC MAC14(
.In1(MAC_In1_2[463:448]),
.In2(MAC_In1_2[479:464]),
.In3(MAC_In3[239:224]),
.AddOut(MAC_Out1_2[463:448]),
.SubOut(MAC_Out1_2[479:464]),
.Overflow(Overflow14));

// MAC 15 
MAC MAC15(
.In1(MAC_In1_2[495:480]),
.In2(MAC_In1_2[511:496]),
.In3(MAC_In3[255:240]),
.AddOut(MAC_Out1_2[495:480]),
.SubOut(MAC_Out1_2[511:496]),
.Overflow(Overflow15));
    
assign Overflow = Overflow0 || Overflow1 || Overflow2 || Overflow3 || Overflow4 || Overflow5 ||
                Overflow6 || Overflow7 || Overflow8 || Overflow9 || Overflow10 || Overflow11 ||
                Overflow12 || Overflow13 || Overflow14 || Overflow15;

     
endmodule
