module InstrMem #(
    parameter  WIDTH = 8,
    parameter ADDRESS_WIDTH = 8
)(
    input  logic  [ADDRESS_WIDTH-1:0]    addr,
    output logic  [31:0]            dout
);

logic [WIDTH-1:0] rom_array [4*2**ADDRESS_WIDTH-1:0];
logic [WIDTH-1:0] byte1;
logic [WIDTH-1:0] byte2;
logic [WIDTH-1:0] byte3;
logic [WIDTH-1:0] byte4;
initial begin
    $display("Loading rom");
    $readmemh("program.mem", rom_array);
end;

always_comb begin
    byte1 = rom_array[addr];
    byte2 = rom_array[addr+1];
    byte3 = rom_array[addr+2];
    byte4 = rom_array[addr+3];
    dout = {byte1, byte2, byte3, byte4} ;
end
integer i;
initial begin

     $display("instr data:");

     for (i=0; i < 7; i=i+1)

     $display("%d:%h",i,rom_array[i]);

end
    
endmodule
