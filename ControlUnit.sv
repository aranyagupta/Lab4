module ControlUnit #(
	parameter WIDTH = 32
)(
  // interface signals
  input  logic [WIDTH-1:0]              instr,      // instr 
  input  logic                          EQ,     // equal
  output logic                          RegWrite, 	
  output logic                          ALUctrl,
  output logic                          ALUsrc,
  output logic                          ImmSrc,
  output logic                          PCsrc
);


always_comb 
    if (instr[6:0]==1100011)
        Immsrc = 0;
        ALUsrc = 0;
        ALUctrl = 0;
        PCsrc = (!EQ);
        RegWrite = 0;
        
    else 
        Immsrc = 1;
        ALUsrc = 1;
        ALUctrl = 1;
        PCsrc = 0;
        RegWrite = 1;

        
endmodule
