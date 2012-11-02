//Implementation of a MIPS-style ALU
//Supported instructions:
//  ADD, SUB, XOR, SLT, MUL
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define NOR32 nor #320
`define XOR xor #20
`define BUF buf #10

module alu(A,B,Out,Ctrl,zero,overflow,CoutFinal);
  input [31:0] A;
  input [31:0] B;
  input [2:0] Ctrl;
  output [31:0] Out;
  output zero,overflow,CoutFinal;
  wire [31:0] Cout;
  
  //32 instances of bitSlice
  bitSlice_1bit bitSlice0(Out[0], Cout[0], A[0], B[0], Ctrl[0],Ctrl); //Cin is 1 for SUB (instruction 001).
  bitSlice_1bit bitSlice1(Out[1], Cout[1], A[1], B[1], Cout[0],Ctrl);
  bitSlice_1bit bitSlice2(Out[2], Cout[2], A[2], B[2], Cout[1],Ctrl);
  bitSlice_1bit bitSlice3(Out[3], Cout[3], A[3], B[3], Cout[2],Ctrl);
  bitSlice_1bit bitSlice4(Out[4], Cout[4], A[4], B[4], Cout[3],Ctrl);
  bitSlice_1bit bitSlice5(Out[5], Cout[5], A[5], B[5], Cout[4],Ctrl);
  bitSlice_1bit bitSlice6(Out[6], Cout[6], A[6], B[6], Cout[5],Ctrl);
  bitSlice_1bit bitSlice7(Out[7], Cout[7], A[7], B[7], Cout[6],Ctrl);
  bitSlice_1bit bitSlice8(Out[8], Cout[8], A[8], B[8], Cout[7],Ctrl);
  bitSlice_1bit bitSlice9(Out[9], Cout[9], A[9], B[9], Cout[8],Ctrl);
  bitSlice_1bit bitSlice10(Out[10], Cout[10], A[10], B[10], Cout[9],Ctrl);
  bitSlice_1bit bitSlice11(Out[11], Cout[11], A[11], B[11], Cout[10],Ctrl);
  bitSlice_1bit bitSlice12(Out[12], Cout[12], A[12], B[12], Cout[11],Ctrl);
  bitSlice_1bit bitSlice13(Out[13], Cout[13], A[13], B[13], Cout[12],Ctrl);
  bitSlice_1bit bitSlice14(Out[14], Cout[14], A[14], B[14], Cout[13],Ctrl);
  bitSlice_1bit bitSlice15(Out[15], Cout[15], A[15], B[15], Cout[14],Ctrl);
  bitSlice_1bit bitSlice16(Out[16], Cout[16], A[16], B[16], Cout[15],Ctrl);
  bitSlice_1bit bitSlice17(Out[17], Cout[17], A[17], B[17], Cout[16],Ctrl);
  bitSlice_1bit bitSlice18(Out[18], Cout[18], A[18], B[18], Cout[17],Ctrl);
  bitSlice_1bit bitSlice19(Out[19], Cout[19], A[19], B[19], Cout[18],Ctrl);
  bitSlice_1bit bitSlice20(Out[20], Cout[20], A[20], B[20], Cout[19],Ctrl);
  bitSlice_1bit bitSlice21(Out[21], Cout[21], A[21], B[21], Cout[20],Ctrl);
  bitSlice_1bit bitSlice22(Out[22], Cout[22], A[22], B[22], Cout[21],Ctrl);
  bitSlice_1bit bitSlice23(Out[23], Cout[23], A[23], B[23], Cout[22],Ctrl);
  bitSlice_1bit bitSlice24(Out[24], Cout[24], A[24], B[24], Cout[23],Ctrl);
  bitSlice_1bit bitSlice25(Out[25], Cout[25], A[25], B[25], Cout[24],Ctrl);
  bitSlice_1bit bitSlice26(Out[26], Cout[26], A[26], B[26], Cout[25],Ctrl);
  bitSlice_1bit bitSlice27(Out[27], Cout[27], A[27], B[27], Cout[26],Ctrl);
  bitSlice_1bit bitSlice28(Out[28], Cout[28], A[28], B[28], Cout[27],Ctrl);
  bitSlice_1bit bitSlice29(Out[29], Cout[29], A[29], B[29], Cout[28],Ctrl);
  bitSlice_1bit bitSlice30(Out[30], Cout[30], A[30], B[30], Cout[29],Ctrl);
  bitSlice_1bit bitSlice31(Out[31], Cout[31], A[31], B[31], Cout[30],Ctrl);
  
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
  wire zero,overflow,Cout; 
  wire [31:0] Out;
   
  //test alu
  initial  // Stimulus 
  begin 
    A=4000000000;
    B=4000000000;
    Ctrl[2]=0; Ctrl[1]=0; Ctrl[0]=0; 
    //#150 Ctrl[0]=0; 
    //#150 Ctrl[1]=0;
    //#150 Ctrl[2]=1; 
  end 
  alu UUT (A,B,Out,Ctrl,zero,overflow,Cout); 
  initial  // Response 
    $monitor($time,A,B,Out,Ctrl,zero,overflow,Cout);
endmodule