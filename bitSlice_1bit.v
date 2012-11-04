//ALU bitslice for the MIPS architecture
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define NOT not #10
`define XOR xor #20
`define AND and #20

module bitSlice_1bit (Out, Cout, cOutM, A, B, A32, B32, Cin, cInM,Cntrl);
  input A,B,Cin;
  input [2:0] Cntrl;
  output Out, Cout;

  input [31:0] A32, B32;
  input [30:0] cInM;
  output [30:0] cOutM;

  wire and0, and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17, and18, and19, and20, and21, and22, and23, and24, and25, and26, and27, and28, and29, and30, and31;
  wire sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, sum10, sum11, sum12, sum13, sum14, sum15, sum16, sum17, sum18, sum19, sum20, sum21, sum22, sum23, sum24, sum25, sum26, sum27, sum28, sum29;
  
  wire Xor, Sum, Sub, Slt, Mul, Bin; //Bin is the value fed to the adder (B or not(B))
  
  `XOR subBgate(Bin,B,Cntrl[0]);
  
  add_1bit addOrSub(Sum,Cout,A,Bin,Cin);

  `XOR xorGate(Xor,A,B);
  
  assign Sub = Sum;
  assign Slt = Sum;
  
  //do the multiply!!
  AND and0Gate (and0,A32[0],B32[31]);
  `AND and1Gate (and1,A32[1],B32[30]);
  `AND and2Gate (and2,A32[2],B32[29]);
  `AND and3Gate (and3,A32[3],B32[28]);
  `AND and4Gate (and4,A32[4],B32[27]);
  `AND and5Gate (and5,A32[5],B32[26]);
  `AND and6Gate (and6,A32[6],B32[25]);
  `AND and7Gate (and7,A32[7],B32[24]);
  `AND and8Gate (and8,A32[8],B32[23]);
  `AND and9Gate (and9,A32[9],B32[22]);
  `AND and10Gate (and10,A32[10],B32[21]);
  `AND and11Gate (and11,A32[11],B32[20]);
  `AND and12Gate (and12,A32[12],B32[19]);
  `AND and13Gate (and13,A32[13],B32[18]);
  `AND and14Gate (and14,A32[14],B32[17]);
  `AND and15Gate (and15,A32[15],B32[16]);
  `AND and16Gate (and16,A32[16],B32[15]);
  `AND and17Gate (and17,A32[17],B32[14]);
  `AND and18Gate (and18,A32[18],B32[13]);
  `AND and19Gate (and19,A32[19],B32[12]);
  `AND and20Gate (and20,A32[20],B32[11]);
  `AND and21Gate (and21,A32[21],B32[10]);
  `AND and22Gate (and22,A32[22],B32[9]);
  `AND and23Gate (and23,A32[23],B32[8]);
  `AND and24Gate (and24,A32[24],B32[7]);
  `AND and25Gate (and25,A32[25],B32[6]);
  `AND and26Gate (and26,A32[26],B32[5]);
  `AND and27Gate (and27,A32[27],B32[4]);
  `AND and28Gate (and28,A32[28],B32[3]);
  `AND and29Gate (and29,A32[29],B32[2]);
  `AND and30Gate (and30,A32[30],B32[1]);
  `AND and31Gate (and31,A32[31],B32[0]);

  add_1bit add0 (sum0,cOutM[0],and0,and1,cInM[0]);
  add_1bit add1 (sum1,cOutM[1],sum0,and2,cInM[1]);
  add_1bit add2 (sum2,cOutM[2],sum1,and3,cInM[2]);
  add_1bit add3 (sum3,cOutM[3],sum2,and4,cInM[3]);
  add_1bit add4 (sum4,cOutM[4],sum3,and5,cInM[4]);
  add_1bit add5 (sum5,cOutM[5],sum4,and6,cInM[5]);
  add_1bit add6 (sum6,cOutM[6],sum5,and7,cInM[6]);
  add_1bit add7 (sum7,cOutM[7],sum6,and8,cInM[7]);
  add_1bit add8 (sum8,cOutM[8],sum7,and9,cInM[8]);
  add_1bit add9 (sum9,cOutM[9],sum8,and10,cInM[9]);
  add_1bit add10 (sum10,cOutM[10],sum9,and11,cInM[10]);
  add_1bit add11 (sum11,cOutM[11],sum10,and12,cInM[11]);
  add_1bit add12 (sum12,cOutM[12],sum11,and13,cInM[12]);
  add_1bit add13 (sum13,cOutM[13],sum12,and14,cInM[13]);
  add_1bit add14 (sum14,cOutM[14],sum13,and15,cInM[14]);
  add_1bit add15 (sum15,cOutM[15],sum14,and16,cInM[15]);
  add_1bit add16 (sum16,cOutM[16],sum15,and17,cInM[16]);
  add_1bit add17 (sum17,cOutM[17],sum16,and18,cInM[17]);
  add_1bit add18 (sum18,cOutM[18],sum17,and19,cInM[18]);
  add_1bit add19 (sum19,cOutM[19],sum18,and20,cInM[19]);
  add_1bit add20 (sum20,cOutM[20],sum19,and21,cInM[20]);
  add_1bit add21 (sum21,cOutM[21],sum20,and22,cInM[21]);
  add_1bit add22 (sum22,cOutM[22],sum21,and23,cInM[22]);
  add_1bit add23 (sum23,cOutM[23],sum22,and24,cInM[23]);
  add_1bit add24 (sum24,cOutM[24],sum23,and25,cInM[24]);
  add_1bit add25 (sum25,cOutM[25],sum24,and26,cInM[25]);
  add_1bit add26 (sum26,cOutM[26],sum25,and27,cInM[26]);
  add_1bit add27 (sum27,cOutM[27],sum26,and28,cInM[27]);
  add_1bit add28 (sum28,cOutM[28],sum27,and29,cInM[28]);
  add_1bit add29 (sum29,cOutM[29],sum28,and30,cInM[29]);
  add_1bit add30 (Mul,cOutM[30],sum29,and31,cInM[30]);
    
  mux_5bit finalMux(Out,Sum,Sub,Xor,Slt,Mul,Cntrl);
  
endmodule

module TESTbitSlice_1bit;
  reg A,B,cIn;
  reg [2:0] Cntrl;
  wire out,cOut;
  
  //test 1 bit adder
  initial  // Stimulus 
  begin
    A=1;B=1;cIn=0; Cntrl = 1;
    #150 A=0; 
    #150 cIn=1;
    #150 A=1; 
  end
  bitSlice_1bit UUT (out,cOut,A,B,cIn,Cntrl); 
  initial  // Response 
    $monitor($time, ,out,cOut, ,A,B,cIn, , Cntrl);
endmodule