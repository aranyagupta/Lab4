module alu # (
    parameter DATA_SIZE=32,
    parameter CTRL_SIZE=1,
)(
    input logic ALUop1 [DATA_SIZE-1:0],
    input logic ALUop2 [DATA_SIZE-1:0],
    input logic ALUctrl [CTRL_SIZE-1:0],
    output logic ALUout [DATA_SIZE-1:0],
    output logic EQ
);

always_comb begin        
    if (ALUctrl == {CTRL_SIZE-1{1'b0}, 1'b1}) begin
        ALUout = (ALUop1 + ALUop2)[DATA_SIZE-1:0];
    end else if (ALUctrl == {CTRL_SIZE{1'b0}}) begin
        ALUout = {DATA_SIZE{1'b0}};
    end
    if ( (ALUop1-ALUop2) == 1'b0) begin
        EQ=1;
    end else begin
        EQ=0;
    end
end

endmodule
