// program counter example
module pc (
  input	clk,
  input reset,
  
  input [11:0] next_p_ct,
  
  output logic[11:0] p_ct);

  always_ff @(posedge clk) 
		if(reset)
			p_ct <= 0;
		else
			p_ct <= next_p_ct; 
			
endmodule