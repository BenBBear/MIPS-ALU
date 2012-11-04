//This file is a test of the multiplication circuitry for a bitslice

`define AND and #20

module mul_bitslice_4bit (out,cOut,A,B,cIn);
  input [3:0] A,B;
  input [2:0] cIn;
  output [2:0] cOut;
  output out;
  
  wire and0, and1, and2, and3;
  wire sum0, sum1;
  
  `AND and0Gate (and0,A[0],B[3]);
  `AND and1Gate (and1,A[1],B[2]);
  `AND and2Gate (and2,A[2],B[1]);
  `AND and3Gate (and3,A[3],B[0]);
  
  add_1bit add0 (sum0,cOut[0],and0,and1,cIn[0]);
  add_1bit add1 (sum1,cOut[1],sum0,and2,cIn[1]);
  add_1bit add2 (out,cOut[2],sum1,and3,cIn[2]);
endmodule

module TEST_mul_bitslice_4bit;
  reg [3:0] A,B;
  reg [2:0] cIn;
  wire out;
  wire [2:0] cOut;
  
  //test 1 bit adder
  initial  // Stimulus 
  begin
    A=1;B=1;cIn=0;
    #300 B=2; 
    #300 B=3; 
  end
  mul_bitslice_4bit UUT (out,cOut,A,B,cIn); 
  initial  // Response 
    $monitor($time, ,out, ,cOut, ,A, ,B, ,cIn);
endmodule
