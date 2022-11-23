module SignExtend #(
	parameter WIDTH = 32
)(
  // interface signals
  input  logic [WIDTH-1:0]              instr,      // instr 
  input  logic                          ImmSrc,     // immediate source
  output logic [WIDTH-1:0]              ImmOp 		// tick output
);

wire unused_ok = &{1'b0,
           instr[19:12],
           instr[6:0],
           1'b0};
           
always_comb 
    if (ImmSrc) 
        if (instr[31])
            ImmOp = {20'hFFFFF, instr[31:20]};
        else ImmOp = {20'h00000, instr[31:20]};  
        
    else 
	    if (instr[31]) 
            ImmOp = {20'hFFFFF, instr[31], instr[7], instr[30:25], instr[11:8]};
        else ImmOp = {20'h00000, instr[31], instr[7], instr[30:25], instr[11:8]};  
        
endmodule
