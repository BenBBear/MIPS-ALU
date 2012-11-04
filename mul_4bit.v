//test of the multiplication circuitry ALU implementation
module mul_4bit(out,A,B);
  
  input [3:0] A,B;
  output [3:0] out;
  
  wire [3:0] A0, A1, A2, A3;
  wire [2:0] cIn0, cOut0, cOut1, cOut2, cOut3;
  
  
  //using shifts in this way essentially puts the long-multiplication upside down, as it were
  assign A0 = A<<3;
  assign A1 = A<<2;
  assign A2 = A<<1;
  assign A3 = A;
  assign cIn0 = 0;
  
  mul_bitslice_4bit bit0 (out[0],cOut0,A0,B,cIn0);
  mul_bitslice_4bit bit1 (out[1],cOut1,A1,B,cOut0);
  mul_bitslice_4bit bit2 (out[2],cOut2,A2,B,cOut1);
  mul_bitslice_4bit bit3 (out[3],cOut3,A3,B,cOut2);

endmodule

module TESTmul_4bit;
  reg [3:0] A,B;
  wire [3:0] out;
  
  //test 1 bit adder
  initial  // Stimulus 
  begin
    A=1;B=1;
    #500 B=2; 
    #500 B=3;
    #500 A=2;
    #500 A=3;
  end
  mul_4bit UUT (out,A,B); 
  initial  // Response 
    $monitor($time, ,out, ,A, ,B);
endmodule