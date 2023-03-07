
module reg_file(
  input           clk,
                  RegWrite,
				  D,
				  
  input  [2:0]    operand1,
                  operand2,
				  
  input  [3:0]    destination,
				  
  input [7:0]     write_data,
  
  output logic [7:0] data_outA,
					 data_outB,
					 R1);
					 
	logic [11:0] registers[12];

// combinational reads
always_comb 
begin
	case(D)
		1'b0: data_outA = registers[{1'b0, operand1}];
		1'b1: data_outA = registers[{1'b1, operand1}];
	endcase
	data_outB = registers[{1'b0, operand2}];
	R1 = registers[1];

end
	
// sequential (clocked) writes
always_ff @ (posedge clk)
  if (RegWrite)
    registers[destination] <= write_data;

endmodule
