module DataMemory #(
    parameter WIDTH = 32,
    parameter ADDRESS_WIDTH = 8
)(
    input  logic                         clk,
    input  logic  [ADDRESS_WIDTH-1:0]    A,
    input  logic                         WE,
    input  logic  [WIDTH-1:0]            WD,
    output logic  [WIDTH-1:0]            RD
);

logic [WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading ram");
    $readmemh("sinerom.mem", ram_array);
end;

always_comb
//output is synchronous
    RD = rom_array [A];

always_ff @(posedge clk) begin
    if (WE) ram_array[A] <= WD
end

integer i;
initial begin

     $display("data:");

     for (i=0; i < 7; i=i+1)

     $display("%d:%h",i,rom_array[i]);

end
    
endmodule
