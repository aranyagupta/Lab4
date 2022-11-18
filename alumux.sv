module alumux # (
    parameter DATA_WIDTH = 32
)(
    input logic regOp2 [DATA_WIDTH-1:0],
    input logic ImmOp [DATA_WIDTH-1:0],
    input logic ALUsrc,
    output logic ALUop2 [DATA_WIDTH-1:0]
);
    
always_comb begin
    ALUop2 = (ALUsrc) ? ImmOp : regOp2;
end

endmodule