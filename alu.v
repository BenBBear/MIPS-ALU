//Implementation of a MIPS-style ALU
//Supported instructions:
//  ADD, SUB, XOR, SLT, MUL
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define NOR nor #320

module alu(inA,inB,Out,Ctrl,zero,overflow,Cout)
  input [31:0] inA;
  input [31:0] inB;
  input [2:0] Ctrl;
  output [31:0] Out;
  output zero,overflow,Cout;
  wire Cin,notCtrl1,notCtrl2;
  
  `NOT notCtrl1gate(notCtrl1,Ctrl[1]);
  `NOT notCtrl2gate(notCtrl2,Ctrl[2]);
  `AND Cingate(Cin,notCtrl2,notCtrl1,Ctrl[0]); //Cin is 1 for SUB (001).
  
  //32 instances of bitSlice
  bitSlice_1bit bitSlice1(Out, Cout, A, B, Cin,Cntrl);
  
  //Handle overflows and check for zero
  `NOR norZero(zero,Out[0],Out[1],Out[2],Out[3],Out[4],Out[5],Out[6],Out[7],
                Out[8],Out[9],Out[10],Out[11],Out[12],Out[13],Out[14],Out[15],
                Out[16],Out[17],Out[18],Out[19],Out[20],Out[21],Out[22],Out[23],
                Out[24],Out[25],Out[26],Out[27],Out[28],Out[29],Out[30],Out[31])
endmodule