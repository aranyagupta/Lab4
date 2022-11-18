module regfile #(
    parameter ADDRESS_WIDTH = 5,
    parameter DATA_WIDTH = 32
) (
    input logic AD1 [ADDRESS_WIDTH-1:0],
    input logic AD2 [ADDRESS_WIDTH-1:0],
    input logic AD3 [ADDRESS_WIDTH-1:0],
    input logic WD3 [DATA_WIDTH-1:0]
    input logic WE3,
    input logic clk,
    output logic RD1 [DATA_WIDTH-1:0],
    output logic RD2 [DATA_WIDTH-1:0],
    output logic a0 [DATA_WIDTH-1:0]
);
logic [DATA_WIDTH-1:0] register_array [2**ADDRESS_WIDTH-1:0]
always_comb begin
    RD1 = register_array[AD1];
    RD2 = register_array[AD2];
    a0 = register_array[2**(ADDRESS_WIDTH-1)]
end

always_ff @(posedge clk) begin
    if (WE3) begin
        register_array[AD3] = WD3;
    end
end
    
endmodule
