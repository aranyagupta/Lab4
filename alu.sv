module alu # (
    parameter DATA_SIZE=32
)(
    input  logic [DATA_SIZE-1:0] ALUop1,
    input  logic [DATA_SIZE-1:0] ALUop2,
    input  logic                 ALUctrl,
    output logic [DATA_SIZE-1:0] ALUout,
    output logic                 EQ
);

always_comb begin        
    if (ALUctrl == {1'b1})
        //logic [DATA_SIZE-1:0] temp = ALUop1 + ALUop2;
        ALUout = ALUop1 + ALUop2;//temp[DATA_SIZE-1:0]; 
    else
        ALUout = {DATA_SIZE{1'b0}};
    if ( (ALUop1-ALUop2) == 0)
        EQ=1;
    else
        EQ=0;
end

endmodule
