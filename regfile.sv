module regfile #(
    parameter ADDRESS_WIDTH = 5,
    parameter DATA_WIDTH = 32
) (
    input logic [ADDRESS_WIDTH-1:0] AD1 ,
    input logic [ADDRESS_WIDTH-1:0] AD2 ,
    input logic [ADDRESS_WIDTH-1:0] AD3,
    input logic [DATA_WIDTH-1:0] WD3, 
    input logic WE3,
    input logic clk,
    output logic [DATA_WIDTH-1:0] RD1 ,
    output logic [DATA_WIDTH-1:0] RD2 ,
    output logic [DATA_WIDTH-1:0] a0 
);

logic [DATA_WIDTH-1:0] register_array [2**ADDRESS_WIDTH-1:0];

always_comb begin
    RD1 = register_array[AD1];
    RD2 = register_array[AD2];
    a0 = register_array[2**(ADDRESS_WIDTH-1)];
end

always_ff @(posedge clk) begin
    if (WE3) begin
        register_array[AD3] <= WD3;
    end
end
    
endmodule
