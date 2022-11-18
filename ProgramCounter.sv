module ProgramCounter #(
    parameter WIDTH = 32
)(
    // interface signals
    input logic              clk,         //clock
    input logic              rst,         //reset
    input logic  [WIDTH-1:0] next_PC,     //count input
    input logic  [WIDTH-1:0] ImmOp,
    inout logic              PCsrc,
    output logic [WIDTH-1:0] PC           //count output
);

//syncronous reset
always_ff @ (posedge clk)      //specifies a clocked circuit 
    if (rst) begin PC <= {WIDTH{1'b0}};
    end else begin  if (PCsrc) PC <= PC + ImmOp; 
                    else PC <= PC + 4;
    end


endmodule
