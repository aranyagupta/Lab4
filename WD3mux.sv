module WD3mux #(
	parameter WIDTH = 32
)(
  // interface signals
  input  logic [WIDTH-1:0]              S0, 
  input  logic [WIDTH-1:0]              S1,
  input  logic                          select,     // immediate source
  output logic [WIDTH-1:0]              toWD3 		// tick output
);

always_comb 
    if (select) 
        toWD3 = S1;
    else
        toWD£ = S2;


endmodule
