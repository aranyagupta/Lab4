module alu # (
    parameter DATA_SIZE=32,
    parameter CTRL_SIZE=1
)(
    input logic [DATA_SIZE-1:0] ALUop1 ,
    input logic [DATA_SIZE-1:0] ALUop2 ,
    input logic [CTRL_SIZE-1:0] ALUctrl ,
    output logic [DATA_SIZE-1:0] ALUout ,
    output logic EQ
);

always_comb begin        
    if (ALUctrl == {{CTRL_SIZE-1{1'b0}}, 1'b1}) begin
        logic [DATA_SIZE:0] temp = ALUop1 + ALUop2;
        ALUout = temp[DATA_SIZE-1:0]; 
    end
    else if (ALUctrl == {CTRL_SIZE{1'b0}})
        ALUout = 1'b0;
    if ( (ALUop1-ALUop2) == 0)
        EQ=1;
    else
        EQ=0;
end

endmodule
