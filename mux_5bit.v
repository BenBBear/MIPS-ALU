//5 input mux
//Olin College - CompArch

`define AND and #20
`define OR or #20
`define NOT not #10

//It might make more sense to take [2:0] s as an input. Change later?
module mux_5bit(muxOut, in0, in1, in2, in3, in4, s0, s1, s2);
  output muxOut;
  input in0, in1, in2, in3, in4, s0, s1, s2;
  wire andOut0, andOut1, andOut2, andOut3, andOut4, nots0, nots1, nots2;
  
  `NOT nots0gate(nots0, s0);
  `NOT nots1gate(nots1, s1);
  `NOT nots2gate(nots2, s2);
  `AND and0(andOut0,in0,nots0,nots1,nots2);
  `AND and1(andOut1,in1,nots0,nots1,s2);
  `AND and2(andOut2,in2,nots0,s1,nots2);
  `AND and3(andOut3,in3,nots0,s1,s2);
  `AND and4(andOut4,in4,s0,nots1,nots2);
  `OR finalOr(muxOut,andOut0,andOut1,andOut2,andOut3,andOut4);
endmodule

module TESTmux_5bit;
  reg A,B,C,D,E,s0,s1,s2; 
  wire muxOut; 
   
  //test mux
  initial  // Stimulus 
  begin 
    A=0; B=1; C=0; D=1; E=1; s0=0; s1=1; s2=1; 
    #150 s2=0; 
    #150 s1=0;
    #150 s0=1; 
  end 
  mux_5bit UUT (muxOut,A,B,C,D,E,s0,s1,s2); 
  initial  // Response 
    $monitor($time,muxOut,A,B,C,D,E,s0,s1,s2);
endmodule
