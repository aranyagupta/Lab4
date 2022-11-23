module InstrMem #(
    parameter  WIDTH = 32,
    parameter ADDRESS_WIDTH = 8
)(
    input  logic  [ADDRESS_WIDTH-1:0]    addr,
    output logic  [WIDTH-1:0]            dout
);

logic [WIDTH-1:0] rom_array [0:6];

initial begin
    $display("Loading rom");
    $readmemh("program.mem", rom_array);
end;

always_comb
    dout = rom_array [addr/4];

integer i;
initial begin

     $display("data:");

     for (i=0; i < 7; i=i+1)

     $display("%d:%h",i,rom_array[i]);

end
    
endmodule
