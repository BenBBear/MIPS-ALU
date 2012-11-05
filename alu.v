//Implementation of a MIPS-style ALU
//Supported instructions:
//  ADD, SUB, XOR, SLT, MUL
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define NOR32 nor #320
`define XOR xor #20
`define BUF buf #10
`define AND3 and #30
`define NOT not #10

module alu(A,B,FinalOut,Ctrl,zero,overflow,CoutFinal);
  input [31:0] A;
  input [31:0] B;
  input [2:0] Ctrl;
  output [31:0] FinalOut;
  output zero,overflow,CoutFinal;
  wire notCtrl2,sltFlag;
  wire [31:0] Cout;
  wire [31:0] Out;
  
  //multiplication overhead
  wire [31:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31;
  wire [30:0] cInM0, cOutM0, cOutM1, cOutM2, cOutM3, cOutM4, cOutM5, cOutM6, cOutM7, cOutM8, cOutM9, cOutM10, cOutM11, cOutM12, cOutM13, cOutM14, cOutM15, cOutM16, cOutM17, cOutM18, cOutM19, cOutM20, cOutM21, cOutM22, cOutM23, cOutM24, cOutM25, cOutM26, cOutM27, cOutM28, cOutM29, cOutM30, cOutM31;

  assign A0 = A<<31;
  assign A1 = A<<30;
  assign A2 = A<<29;
  assign A3 = A<<28;
  assign A4 = A<<27;
  assign A5 = A<<26;
  assign A6 = A<<25;
  assign A7 = A<<24;
  assign A8 = A<<23;
  assign A9 = A<<22;
  assign A10 = A<<21;
  assign A11 = A<<20;
  assign A12 = A<<19;
  assign A13 = A<<18;
  assign A14 = A<<17;
  assign A15 = A<<16;
  assign A16 = A<<15;
  assign A17 = A<<14;
  assign A18 = A<<13;
  assign A19 = A<<12;
  assign A20 = A<<11;
  assign A21 = A<<10;
  assign A22 = A<<9;
  assign A23 = A<<8;
  assign A24 = A<<7;
  assign A25 = A<<6;
  assign A26 = A<<5;
  assign A27 = A<<4;
  assign A28 = A<<3;
  assign A29 = A<<2;
  assign A30 = A<<1;
  assign A31 = A;
  assign cInM0 = 0;
  
  //32 instances of bitSlice
  //Cin is 1 for SUB (instruction 001).
  bitSlice_1bit bitSlice0(Out[0], Cout[0], cOutM0, A[0], B[0], A0, B, Ctrl[0], cIn0, Ctrl);
  bitSlice_1bit bitSlice1(Out[1], Cout[1], cOutM1, A[1], B[1], A1, B, Cout[0], cIn1, Ctrl);
  bitSlice_1bit bitSlice2(Out[2], Cout[2], cOutM2, A[2], B[2], A2, B, Cout[1], cIn2, Ctrl);
  bitSlice_1bit bitSlice3(Out[3], Cout[3], cOutM3, A[3], B[3], A3, B, Cout[2], cIn3, Ctrl);
  bitSlice_1bit bitSlice4(Out[4], Cout[4], cOutM4, A[4], B[4], A4, B, Cout[3], cIn4, Ctrl);
  bitSlice_1bit bitSlice5(Out[5], Cout[5], cOutM5, A[5], B[5], A5, B, Cout[4], cIn5, Ctrl);
  bitSlice_1bit bitSlice6(Out[6], Cout[6], cOutM6, A[6], B[6], A6, B, Cout[5], cIn6, Ctrl);
  bitSlice_1bit bitSlice7(Out[7], Cout[7], cOutM7, A[7], B[7], A7, B, Cout[6], cIn7, Ctrl);
  bitSlice_1bit bitSlice8(Out[8], Cout[8], cOutM8, A[8], B[8], A8, B, Cout[7], cIn8, Ctrl);
  bitSlice_1bit bitSlice9(Out[9], Cout[9], cOutM9, A[9], B[9], A9, B, Cout[8], cIn9, Ctrl);
  bitSlice_1bit bitSlice10(Out[10], Cout[10], cOutM10, A[10], B[10], A10, B, Cout[9], cIn10, Ctrl);
  bitSlice_1bit bitSlice11(Out[11], Cout[11], cOutM11, A[11], B[11], A11, B, Cout[10], cIn11, Ctrl);
  bitSlice_1bit bitSlice12(Out[12], Cout[12], cOutM12, A[12], B[12], A12, B, Cout[11], cIn12, Ctrl);
  bitSlice_1bit bitSlice13(Out[13], Cout[13], cOutM13, A[13], B[13], A13, B, Cout[12], cIn13, Ctrl);
  bitSlice_1bit bitSlice14(Out[14], Cout[14], cOutM14, A[14], B[14], A14, B, Cout[13], cIn14, Ctrl);
  bitSlice_1bit bitSlice15(Out[15], Cout[15], cOutM15, A[15], B[15], A15, B, Cout[14], cIn15, Ctrl);
  bitSlice_1bit bitSlice16(Out[16], Cout[16], cOutM16, A[16], B[16], A16, B, Cout[15], cIn16, Ctrl);
  bitSlice_1bit bitSlice17(Out[17], Cout[17], cOutM17, A[17], B[17], A17, B, Cout[16], cIn17, Ctrl);
  bitSlice_1bit bitSlice18(Out[18], Cout[18], cOutM18, A[18], B[18], A18, B, Cout[17], cIn18, Ctrl);
  bitSlice_1bit bitSlice19(Out[19], Cout[19], cOutM19, A[19], B[19], A19, B, Cout[18], cIn19, Ctrl);
  bitSlice_1bit bitSlice20(Out[20], Cout[20], cOutM20, A[20], B[20], A20, B, Cout[19], cIn20, Ctrl);
  bitSlice_1bit bitSlice21(Out[21], Cout[21], cOutM21, A[21], B[21], A21, B, Cout[20], cIn21, Ctrl);
  bitSlice_1bit bitSlice22(Out[22], Cout[22], cOutM22, A[22], B[22], A22, B, Cout[21], cIn22, Ctrl);
  bitSlice_1bit bitSlice23(Out[23], Cout[23], cOutM23, A[23], B[23], A23, B, Cout[22], cIn23, Ctrl);
  bitSlice_1bit bitSlice24(Out[24], Cout[24], cOutM24, A[24], B[24], A24, B, Cout[23], cIn24, Ctrl);
  bitSlice_1bit bitSlice25(Out[25], Cout[25], cOutM25, A[25], B[25], A25, B, Cout[24], cIn25, Ctrl);
  bitSlice_1bit bitSlice26(Out[26], Cout[26], cOutM26, A[26], B[26], A26, B, Cout[25], cIn26, Ctrl);
  bitSlice_1bit bitSlice27(Out[27], Cout[27], cOutM27, A[27], B[27], A27, B, Cout[26], cIn27, Ctrl);
  bitSlice_1bit bitSlice28(Out[28], Cout[28], cOutM28, A[28], B[28], A28, B, Cout[27], cIn28, Ctrl);
  bitSlice_1bit bitSlice29(Out[29], Cout[29], cOutM29, A[29], B[29], A29, B, Cout[28], cIn29, Ctrl);
  bitSlice_1bit bitSlice30(Out[30], Cout[30], cOutM30, A[30], B[30], A30, B, Cout[29], cIn30, Ctrl);
  bitSlice_1bit bitSlice31(Out[31], Cout[31], cOutM31, A[31], B[31], A31, B, Cout[30], cIn31, Ctrl);

  `NOT notCtrl2gate(notCtrl2,Ctrl[2]);
  `AND3 sltFlagGate(sltFlag,notCtrl2,Ctrl[1],Ctrl[0]);  
  mux_2bit sltMux0(FinalOut[0], Out[0], Out[31],sltFlag);
  mux_2bit sltMux1(FinalOut[1], Out[1], 0,sltFlag);
  mux_2bit sltMux2(FinalOut[2], Out[2], 0,sltFlag);
  mux_2bit sltMux3(FinalOut[3], Out[3], 0,sltFlag);
  mux_2bit sltMux4(FinalOut[4], Out[4], 0,sltFlag);
  mux_2bit sltMux5(FinalOut[5], Out[5], 0,sltFlag);
  mux_2bit sltMux6(FinalOut[6], Out[6], 0,sltFlag);
  mux_2bit sltMux7(FinalOut[7], Out[7], 0,sltFlag);
  mux_2bit sltMux8(FinalOut[8], Out[8], 0,sltFlag);
  mux_2bit sltMux9(FinalOut[9], Out[9], 0,sltFlag);
  mux_2bit sltMux10(FinalOut[10], Out[10], 0,sltFlag);
  mux_2bit sltMux11(FinalOut[11], Out[11], 0,sltFlag);
  mux_2bit sltMux12(FinalOut[12], Out[12], 0,sltFlag);
  mux_2bit sltMux13(FinalOut[13], Out[13], 0,sltFlag);
  mux_2bit sltMux14(FinalOut[14], Out[14], 0,sltFlag);
  mux_2bit sltMux15(FinalOut[15], Out[15], 0,sltFlag);
  mux_2bit sltMux16(FinalOut[16], Out[16], 0,sltFlag);
  mux_2bit sltMux17(FinalOut[17], Out[17], 0,sltFlag);
  mux_2bit sltMux18(FinalOut[18], Out[18], 0,sltFlag);
  mux_2bit sltMux19(FinalOut[19], Out[19], 0,sltFlag);
  mux_2bit sltMux20(FinalOut[20], Out[20], 0,sltFlag);
  mux_2bit sltMux21(FinalOut[21], Out[21], 0,sltFlag);
  mux_2bit sltMux22(FinalOut[22], Out[22], 0,sltFlag);
  mux_2bit sltMux23(FinalOut[23], Out[23], 0,sltFlag);
  mux_2bit sltMux24(FinalOut[24], Out[24], 0,sltFlag);
  mux_2bit sltMux25(FinalOut[25], Out[25], 0,sltFlag);
  mux_2bit sltMux26(FinalOut[26], Out[26], 0,sltFlag);
  mux_2bit sltMux27(FinalOut[27], Out[27], 0,sltFlag);
  mux_2bit sltMux28(FinalOut[28], Out[28], 0,sltFlag);
  mux_2bit sltMux29(FinalOut[29], Out[29], 0,sltFlag);
  mux_2bit sltMux30(FinalOut[30], Out[30], 0,sltFlag);
  mux_2bit sltMux31(FinalOut[31], Out[31], 0,sltFlag);
  
  //Handle overflows and check for zero
  `XOR overflowXor(overflow,Cout[30],Cout[31]); //set overflow to true if last two Cout bits differ
  `BUF coutBuf(CoutFinal,Cout[31]); //set CoutFinal to value of last Cout
  //set zero to 1 if all of the Out bits are 0
  `NOR32 norZero(zero,Out[0],Out[1],Out[2],Out[3],Out[4],Out[5],Out[6],Out[7],
                Out[8],Out[9],Out[10],Out[11],Out[12],Out[13],Out[14],Out[15],
                Out[16],Out[17],Out[18],Out[19],Out[20],Out[21],Out[22],Out[23],
                Out[24],Out[25],Out[26],Out[27],Out[28],Out[29],Out[30],Out[31]);
endmodule

module TESTalu;
  reg [31:0] A;
  reg [31:0] B; 
  reg [2:0] Ctrl;
  wire zero,overflow;
  wire Cout; 
  wire [31:0] Out;
   
  //test alu
  initial  // Stimulus 
  begin 
    A=2;
    B=5;
    Ctrl[2]=1; Ctrl[1]=0; Ctrl[0]=0; 
    //#150 Ctrl[0]=0; 
    //#150 Ctrl[1]=0;
    //#150 Ctrl[2]=1; 
  end 
  alu UUT (A,B,Out,Ctrl,zero,overflow,Cout);
  initial  // Response
    $monitor($time,A,B,Out, ,Ctrl,zero,overflow,Cout);
endmodule