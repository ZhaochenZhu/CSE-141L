module lut (
  input[7:0]	label,
  
  output logic[11:0] next_pc);

logic [11:0] addresses [256] = 0;



always_comb begin
	next_pc = addresses[label];
end
			
endmodule