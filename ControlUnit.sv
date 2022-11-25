module ControlUnit #(
	parameter WIDTH = 32
)(
  // interface signals
  input  logic [WIDTH-1:0]              instr,      // instr 
  input  logic                          EQ,     // equal
  output logic                          RegWrite, 	
  output logic                          ALUctrl,
  output logic                          ALUsrc,
  output logic [1:0]                    ImmSrc,
  output logic                          WD3select,
  output logic                          PCsrc,
  output logic                          WE
);

wire unused_ok = &{1'b0,
           instr[WIDTH-1:7],
           1'b0};

always_comb 
    if (instr[6:0]==7'b1100011) begin
        ImmSrc = 2'b00;
        ALUsrc = 0;
        ALUctrl = 0;
        PCsrc = (!EQ);
        RegWrite = 0;
        WD3select = 0;
        WE = 1'b0;
    end
    else if (instr[6:0]==7'b0000011) begin
        ImmSrc = 2'b01;
        ALUsrc = 1;
        ALUctrl = 1;
        PCsrc = 0;
        RegWrite = 1;
        WD3select = 1;
        WE = 1'b0;
    end

    else begin
        ImmSrc = 2'b10;
        ALUsrc = 1;
        ALUctrl = 1;
        PCsrc = 0;
        RegWrite = 1;
        WD3select = 0;
        WE = 1'b0;
    end
        
endmodule
