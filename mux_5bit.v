//5 input mux
//Ian Hoover and Derek Redfern
//Olin College - CompArch

`define AND4 and #40
`define OR5 or #50
`define NOT not #10

module mux_5bit(muxOut, in0, in1, in2, in3, in4, s);
  output muxOut;
  input in0, in1, in2, in3, in4;
  input [2:0] s;
  wire andOut0, andOut1, andOut2, andOut3, andOut4, nots0, nots1, nots2;
  
  `NOT nots0gate(nots0, s[0]);
  `NOT nots1gate(nots1, s[1]);
  `NOT nots2gate(nots2, s[2]);
  `AND4 and0(andOut0,in0,nots2,nots1,nots0);
  `AND4 and1(andOut1,in1,nots2,nots1,s[0]);
  `AND4 and2(andOut2,in2,nots2,s[1],nots0);
  `AND4 and3(andOut3,in3,nots2,s[1],s[0]);
  `AND4 and4(andOut4,in4,s[2],nots1,nots0);
  `OR5 finalOr(muxOut,andOut0,andOut1,andOut2,andOut3,andOut4);
endmodule

module TESTmux_5bit;
  reg A,B,C,D,E; 
  reg [2:0] s;
  wire muxOut; 
   
  //test mux
  initial  // Stimulus 
  begin 
    A=0; B=1; C=0; D=1; E=1; s[2]=0; s[1]=1; s[0]=1; 
    #150 s[0]=0; 
    #150 s[1]=0;
    #150 s[2]=1; 
  end 
  mux_5bit UUT (muxOut,A,B,C,D,E,s); 
  initial  // Response 
    $monitor($time,muxOut,A,B,C,D,E,s);
endmodule