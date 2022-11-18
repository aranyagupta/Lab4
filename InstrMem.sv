module InstrMem #(
    parameter  WIDTH = 32
)(
    input  logic  [WIDTH-1:0]    addr,
    output logic  [WIDTH-1:0]    dout
);

logic [WIDTH-1:0]  rom_array [6:0];

initial begin
    $display("Loading rom");
    $readmemh("program.mem", rom_array);
end;

always_comb
//output is asynchronous
    dout <= rom_array [addr];
    
endmodule