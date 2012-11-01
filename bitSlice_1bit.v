//ALU bitslice for the MIPS architecture
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define NOT not #10
`define XOR xor #20

module bitSlice_1bit (Out, Cout, A, B, Cin,Cntrl);
  input A,B,Cin;
  input [2:0] Cntrl;
  output Out, Cout;
  
  wire Xor, Sum, Slt, Mul, Bin; //Bin is the value fed to the adder (B or not(B))
  
  `XOR subBgate(Bin,B,Cntrl[0]);
  
  add_1bit addOrSub(Sum,Cout,A,Bin,Cin);

  `XOR xorGate(Xor,A,B);
  
  mux_5bit finalMux(Out,Add,Sub,Xor,Slt,Mul,Cntrl);
  
endmodule

module TESTbitSlice_1bit;
  reg A,B,cIn;
  reg [2:0] Cntrl;
  wire out,cOut;
  
  //test 1 bit adder
  initial  // Stimulus 
  begin
    A=1;B=1;cIn=0; Cntrl = 0;
    #150 A=0; 
    #150 cIn=1;
    #150 A=1; 
  end
  bitSlice_1bit UUT (out,cOut,A,B,cIn,Cntrl); 
  initial  // Response 
    $monitor($time,out,cOut,A,B,cIn);
endmodule