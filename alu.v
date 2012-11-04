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

  `NOT notCtrl2gate(notCtrl2,Ctrl[2]);
  `AND3 sltFlagGate(sltFlag,notCtrl2,Ctrl[1],Ctrl[0]);  
  
  wire zero;
  assign zeroconst=0;

  mux_2bit sltMux0(FinalOut[0], Out[0], Out[31],sltFlag);
  mux_2bit sltMux1(FinalOut[1], Out[1], zeroconst,sltFlag);
  mux_2bit sltMux2(FinalOut[2], Out[2], zeroconst,sltFlag);
  mux_2bit sltMux3(FinalOut[3], Out[3], zeroconst,sltFlag);
  mux_2bit sltMux4(FinalOut[4], Out[4], zeroconst,sltFlag);
  mux_2bit sltMux5(FinalOut[5], Out[5], zeroconst,sltFlag);
  mux_2bit sltMux6(FinalOut[6], Out[6], zeroconst,sltFlag);
  mux_2bit sltMux7(FinalOut[7], Out[7], zeroconst,sltFlag);
  mux_2bit sltMux8(FinalOut[8], Out[8], zeroconst,sltFlag);
  mux_2bit sltMux9(FinalOut[9], Out[9], zeroconst,sltFlag);
  mux_2bit sltMux10(FinalOut[10], Out[10], zeroconst,sltFlag);
  mux_2bit sltMux11(FinalOut[11], Out[11], zeroconst,sltFlag);
  mux_2bit sltMux12(FinalOut[12], Out[12], zeroconst,sltFlag);
  mux_2bit sltMux13(FinalOut[13], Out[13], zeroconst,sltFlag);
  mux_2bit sltMux14(FinalOut[14], Out[14], zeroconst,sltFlag);
  mux_2bit sltMux15(FinalOut[15], Out[15], zeroconst,sltFlag);
  mux_2bit sltMux16(FinalOut[16], Out[16], zeroconst,sltFlag);
  mux_2bit sltMux17(FinalOut[17], Out[17], zeroconst,sltFlag);
  mux_2bit sltMux18(FinalOut[18], Out[18], zeroconst,sltFlag);
  mux_2bit sltMux19(FinalOut[19], Out[19], zeroconst,sltFlag);
  mux_2bit sltMux20(FinalOut[20], Out[20], zeroconst,sltFlag);
  mux_2bit sltMux21(FinalOut[21], Out[21], zeroconst,sltFlag);
  mux_2bit sltMux22(FinalOut[22], Out[22], zeroconst,sltFlag);
  mux_2bit sltMux23(FinalOut[23], Out[23], zeroconst,sltFlag);
  mux_2bit sltMux24(FinalOut[24], Out[24], zeroconst,sltFlag);
  mux_2bit sltMux25(FinalOut[25], Out[25], zeroconst,sltFlag);
  mux_2bit sltMux26(FinalOut[26], Out[26], zeroconst,sltFlag);
  mux_2bit sltMux27(FinalOut[27], Out[27], zeroconst,sltFlag);
  mux_2bit sltMux28(FinalOut[28], Out[28], zeroconst,sltFlag);
  mux_2bit sltMux29(FinalOut[29], Out[29], zeroconst,sltFlag);
  mux_2bit sltMux30(FinalOut[30], Out[30], zeroconst,sltFlag);
  mux_2bit sltMux31(FinalOut[31], Out[31], zeroconst,sltFlag);
  
  //Handle overflows and check for zero
  `XOR overflowXor(overflow,Cout[30],Cout[31]); //set overflow to true if last two Cout bits differ
  `BUF coutBuf(CoutFinal,Cout[31]); //set CoutFinal to value of last Cout
  //set zero to 1 if all of the Out bits are 0
  `NOR32 norZero(zero,FinalOut[0],FinalOut[1],FinalOut[2],FinalOut[3],FinalOut[4],FinalOut[5],
                FinalOut[6],FinalOut[7],FinalOut[8],FinalOut[9],FinalOut[10],FinalOut[11],
                FinalOut[12],FinalOut[13],FinalOut[14],FinalOut[15],FinalOut[16],FinalOut[17],
                FinalOut[18],FinalOut[19],FinalOut[20],FinalOut[21],FinalOut[22],FinalOut[23],
                FinalOut[24],FinalOut[25],FinalOut[26],FinalOut[27],FinalOut[28],FinalOut[29],
                FinalOut[30],FinalOut[31]);
endmodule

module TESTalu;
  reg [31:0] A;
  reg [31:0] B; 
  reg [2:0] Ctrl;
  reg flag;
  wire zero,overflow;
  wire Cout; 
  wire [31:0] Out;
   
  //test alu
  initial  // Stimulus 
  begin
    flag=1; //flag is 1 if all tests succeed; 0 otherwise
    
    //ADD TESTS
    Ctrl[2]=0; Ctrl[1]=0; Ctrl[0]=0; //set control code to ADD
    A=2; B=5; //example ADD
    #500 
    if (Out!=7)
      flag=0;
    A=2000000000; B=2000000000; //overflow ADD
    #500
    if (overflow!=1)
      flag=0;
    A=2; B=-5; //negative number ADD
    #500 
    if (Out!=-3)
      flag=0;
    A=12345678; B=87654321; //large number ADD
    #500 
    if (Out!=99999999)
      flag=0;
    A=10; B=-10; //zero result ADD
    #1700 
    if (zero!=1 || Out!=0)
      flag=0;

    //SUB TESTS
    Ctrl[2]=0; Ctrl[1]=0; Ctrl[0]=1; //set control code to SUB
    A=2; B=5; //example SUB
    #1700 
    if (Out!=-3)
      flag=0;
    A=2000000000; B=-2000000000; //overflow SUB
    #500
    if (overflow!=1)
      flag=0;
    A=-2000000000; B=2000000000; //underflow SUB
    #500
    if (overflow!=1)
      flag=0;
    A=-2; B=5; //negative number SUB
    #500 
    if (Out!=-7)
      flag=0;
    A=23456789;B=11111111; //large number SUB
    #500 
    if (Out!=12345678)
      flag=0;
    A=10; B=10; //zero result SUB
    #1700 
    if (zero!=1 || Out!=0)
      flag=0;
      
    //XOR TESTS
    Ctrl[2]=0; Ctrl[1]=1; Ctrl[0]=0; //set control code to XOR
    A='b10000000000000000000000000001010;
    B='b00000000000000000000000000001100;
    //test each possible XOR pairing with only one test
    //also test timing by placing one nonzero pair in the last spot
    #500 
    if (Out!='b10000000000000000000000000000110)
      flag=0;
    
    //SLT TESTS
    Ctrl[2]=0; Ctrl[1]=1; Ctrl[0]=1; //set control code to SLT
    A=2; B=9; //A < B SLT
    #1800 
    if (Out!=1)
      flag=0;
    A=10; B=10; //A = B SLT
    #1800 
    if (zero!=1 || Out!=0)
      flag=0;
    A=10; B=5; //A > B SLT
    #1800 
    if (zero!=1 || Out!=0)
      flag=0;
    A=2000000000; B=-2000000000; //overflow SLT
    #1800
    if (overflow!=1)
      flag=0;
    
    //uncomment after implementing MUL
    /*
    //MUL TESTS
    Ctrl[2]=1; Ctrl[1]=0; Ctrl[0]=0; //set control code to MUL
    A=2; B=5; //example MUL
    #5000 //change timing once known
    if (Out!=10)
      flag=0;
    A=6; B=-3; //example MUL
    #5000 //change timing once known
    if (Out!=-18)
      flag=0;
    A=200000; B=200000; //overflow MUL
    #5000 //change timing once known
    if (overflow!=1)
      flag=0;*/
      
    if (flag==1)
      $display("All tests passed!");
    else
      $display("One or more tests failed.");
      
  end 
  alu UUT (A,B,Out,Ctrl,zero,overflow,Cout);
  initial  // Response
    $monitor($time,A,B,Out,Ctrl,zero,overflow,Cout);
endmodule