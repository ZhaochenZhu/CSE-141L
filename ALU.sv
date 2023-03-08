// Engineer: 
// 
// Create Date:    2016.10.15
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//   combinational (unclocked) ALU

module ALU(
  input [ 2:0] OP,				  // ALU opcode, part of microcode
  
  input [ 7:0] INPUT_A,			  // data inputs
               INPUT_B,
			   
  output logic [7:0] OUT,		  // or:  output reg [7:0] OUT,
  
  output logic ZERO
    );
	
  always_comb begin

	case(OP)
	  3'b000    : OUT = INPUT_A + INPUT_B;
	  3'b001    : OUT = INPUT_A - INPUT_B;
	  3'b010    : OUT = INPUT_A ^ INPUT_B;
	  3'b011	: OUT = ^INPUT_A;
	  3'b100    : OUT = (INPUT_A[7:3] == INPUT_B[7:3]);
	  3'b101	: OUT = INPUT_A << INPUT_B;
	  3'b110	: OUT = INPUT_A >> INPUT_B;
	  default	: OUT = INPUT_A;
	endcase

  end
  
  always_comb begin
	if (INPUT_A - INPUT_B == 0)
		ZERO = 1;
	else begin
		ZERO = 0;
		end

endmodule