module MultiMux(
//control signals
  input			format,
				Load,
				ALUSrc,
				Branch,
				Copy,
				Move,
				BranchResult,

//input data
  input			format_input_a,
				format_input_b,
				
  input [ 7:0]  Load_input_a,			  
                Load_input_b,
			
				ALUSrc_input_a,
				ALUSrc_input_b,
				
				BranchSrc_input_a,
				BranchSrc_input_b,
				
				Copy_input_a,
				Copy_input_b,
				
				Move_input_a,
				Move_input_b,
				
  input [11:0]	BranchResult_input_a,
				BranchResult_input_b,
 
 //output data
  output logic  	 F,
  output logic [7:0] L,
  output logic [7:0] A,
  output logic [7:0] B,
  output logic [7:0] C,
  output logic [7:0] M,
  output logic [11:0] Br
    );
	 
always_comb begin

	F = (format) ? format_input_a : format_input_b;
	L = (Load) ? Load_input_a : Load_input_b;
	A = (ALUSrc) ? ALUSrc_input_a : ALUSrc_input_b;
	B = (Branch) ? BranchSrc_input_a : BranchSrc_input_b;
	C = (Copy) ? Copy_input_a : Copy_input_b;
	M = (Move) ? Move_input_a : Move_input_b;
	Br = (BranchResult) ? BranchResult_input_a : BranchResult_input_b;

end
	 
	 
endmodule