module bitSlice_1bit (Out, Cout, A, B,Cin,Cntrl);
  input A,B,Cin;
  input [2:0] Cntrl;
  output Out, Cout;
  
  wire Xor, Add, Sub, Slt, Mul;
  
  xor xorGate(Xor,A,B);
  
  
endmodule
