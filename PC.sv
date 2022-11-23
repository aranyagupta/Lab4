module PC #(
    parameter WIDTH = 32
)(
    // interface signals
    input logic              clk,         //clock
    input logic              rst,         //reset
    input logic  [WIDTH-1:0] next_PC,     //count input
    output logic [WIDTH-1:0] PC           //count output
);

//syncronous reset
always_ff @ (posedge clk)      //specifies a clocked circuit 
    if (rst)
        PC<={WIDTH{1'b0}};
    else
        PC<=next_PC;

endmodule
