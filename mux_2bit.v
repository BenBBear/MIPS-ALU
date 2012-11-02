//2 input mux
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define AND and #20
`define OR or #20
`define NOT not #10

module mux_2bit(muxOut, in0, in1, s);
  output muxOut;
  input in0, in1;
  input s;
  wire andOut0, andOut1, nots;
  
  `NOT notsgate(nots, s);

  `AND and0(andOut0,in0,nots);
  `AND and1(andOut1,in1,s);

  `OR finalOr(muxOut,andOut0,andOut1);
endmodule

module TESTmux_2bit;
  reg A,B; 
  reg s;
  wire muxOut; 
   
  //test mux
  initial  // Stimulus 
  begin 
    A=0; B=1; s=0; 
    #150 s=1; 
  end 
  mux_5bit UUT (muxOut,A,B,s); 
  initial  // Response 
    $monitor($time,muxOut,A,B,s);
endmodule
