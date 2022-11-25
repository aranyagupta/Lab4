module top #(
	parameter DATA_WIDTH = 32
  //parameter ADDRESS_WIDTH = 9,
  //parameter CTRL_WIDTH = 1
)(
  // interface signals
  input   logic                             clk,      // clock 
  input   logic                             rst,      // reset
  output  logic [DATA_WIDTH-1:0]            a0        // output signal
);

logic [DATA_WIDTH-1:0] RD1;
logic [DATA_WIDTH-1:0] regOp2;
logic [DATA_WIDTH-1:0] ALUout; 
logic                  EQ;
logic [DATA_WIDTH-1:0] ProgramCounter;
logic [DATA_WIDTH-1:0] instr;
logic [DATA_WIDTH-1:0] ImmOp;
//logic [DATA_WIDTH-1:0] InstrMemOut;
logic [1:0] ImmSrc;
logic RegWrite;
logic ALUctrl;
logic ALUsrc;
logic PCsrc;
logic select;
logic S0;
logic S1;
logic toWD3;

alu myALU(
  .ALUop1(RD1),
  .ALUop2((ALUsrc) ? ImmOp : regOp2), // does work of ALU mux
  .ALUout(ALUout),
  .EQ(EQ),
  .ALUctrl(ALUctrl)
);

regfile myRegisters(
  .AD1(instr[19:15]),
  .AD2(instr[24:20]),
  .AD3(instr[11:7]),
  .WD3(toWD3),
  .WE3(RegWrite),
  .clk(clk),
  .RD1(RD1),
  .RD2(regOp2),
  .a0(a0)
);
DataMemory myDataMemory(
  .clk(clk),
  .A(ALUout),
  .WD(WD),
  .WE(WE),
  .RD(RD)
);
WD3mux myWD3mux(
  .S0(ALUout),
  .S1(RD),
  .select(WD3select),
  .toWD3(toWD3)
);

SignExtend mySignExtend(
  .instr(instr),
  .ImmSrc(ImmSrc),
  .ImmOp(ImmOp)
);

InstrMem myInstrMem(
  .addr(ProgramCounter),
  .dout(instr)
);

ControlUnit myControlUnit(
  .instr(instr),
  .EQ(EQ),
  .RegWrite(RegWrite),
  .ALUctrl(ALUctrl),
  .ImmSrc(ImmSrc),
  .PCsrc(PCsrc),
  .ALUsrc(ALUsrc)
  .WD3select(WD3select)
);

PC myPC(
    .clk(clk),
    .rst(rst),
    .next_PC((PCsrc) ? ProgramCounter+ImmOp : ProgramCounter + 4), // does work of PC MUX 
    .PC(ProgramCounter)
);

endmodule
