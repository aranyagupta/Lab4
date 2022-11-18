module top #(
	parameter DATA_WIDTH = 32,
  parameter ADDRESS_WIDTH = 9,
  parameter CTRL_WIDTH = 1
)(
  // interface signals
  input  logic             clk,      // clock 
  input  logic             rst,      // reset
  output  logic            a0        // output signal
);

logic [DATA_WIDTH-1:0] RD1;
logic [DATA_WIDTH-1:0] RD2;
logic [DATA_WIDTH-1:0] ALUout; 
logic                  EQ;
logic [DATA_WIDTH-1:0] ProgramCounter;
logic [DATA_WIDTH-1:0] instr;
logic [DATA_WIDTH-1:0] ImmOp;
logic [DATA_WIDTH-1:0] InstrMemOut;
logic RegWrite;
logic ALUctrl;
logic ALUsrc;
logic ImmSrc;
logic PCsrc;

alu myALU(
  .ALUop1(RD1),
  .ALUop2((ALUsrc) ? ImmOp : RD2), // does work of ALU mux
  .ALUout(ALUout),
  .EQ(EQ),
  .ALUctrl(ALUctrl)
);

regfile myRegisters(
  .AD1(instr[19:15]),
  .AD2(instr[24:20]),
  .AD3(instr[11:7]),
  .WD3(ALUout),
  .WE3(RegWrite),
  .clk(clk),
  .RD1(RD1),
  .RD2(RD2),
  .a0(a0)
);

SignExtend mySignExtend(
  .instr(instr),
  .ImmSrc(ImmSrc),
  .ImmOp(ImmOp)
);

InstrMem myInstrMem(
  .addr(ProgramCounter),
  .dout(InstrMemOut)
);

ControlUnit myControlUnit(
  .instr(instr),
  .EQ(EQ),
  .RegWrite(RegWrite),
  .ALUctrl(ALUctrl),
  .ImmSrc(ImmSrc),
  .PCsrc(PCsrc),
  .ALUsrc(ALUsrc)
);

PC myPC(
    .clk(clk),
    .rst(rst),
    .next_PC((PCsrc) ? ProgramCounter+ImmOp : ProgramCounter + 4), // does work of PC MUX 
    .PC(ProgramCounter)
);

endmodule
