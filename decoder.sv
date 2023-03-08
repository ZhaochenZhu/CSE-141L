
module Decoder(
  input [ 8:0] INSTRUCTION,          // instruction to decode
  
  output logic [2:0] OP,		     // ALU opcode

  output logic       RegWrite,		 //writing to a register this cycle
					 MemWrite,		 //writing to memory this cycle
					 ALUSrc,		 //decide if one of the operand is an immediate value
					 Move,			 //select source for regwrite when doing MOVE
					 Copy, 			 //select source for regwrite when doing COPY
					 Load, 			 //select source for regwrite when doing LOAD WORD
					 branch,		 //decide if this instruction is branch
					 D,				 //decide if operand 1 represents D or R register
					 
  output logic [3:0] destination	 //the destination register of current instruction
					 
    );
	 
  always_comb begin
  
  case(INSTRUCTION[8:6])
	//move
	  3'b000 : begin
					OP = 3'b000;
					RegWrite = 1'b1;
					MemWrite = 1'b0;
					ALUSrc = 1'b0;
					Move = 1'b1;
					Copy = 1'b0;
					Load = 1'b0;
					branch = 1'b0;
					D = 1'b0;
					
					destination[3:0] = 4'b1000;
				end
	//load word
	  3'b001 : begin
					OP = 3'b000;
					RegWrite = 1'b1;
					MemWrite = 1'b0;
					ALUSrc = 1'b0;
					Move = 1'b0;
					Copy = 1'b0;
					Load = 1'b1;
					branch = 1'b0;
					D = 1'b0;
					
					destination[3:0] = {1'b0, INSTRUCTION[5:3]}; 
				end
	//store word
	  3'b010 : begin
					OP = 3'b000;
					RegWrite = 1'b0;
					MemWrite = 1'b1;
					ALUSrc = 1'b0;
					Move = 1'b0;
					Copy = 1'b0;
					Load = 1'b0;
					branch = 1'b0;
					D = 1'b0;
					
					destination[3:0] = 4'b0000; 
				end
	//reduction xor
	  3'b011 : begin
					OP = 3'b011;
					RegWrite = 1'b1;
					MemWrite = 1'b0;
					ALUSrc = 1'b0;
					Move = 1'b0;
					Copy = 1'b0;
					Load = 1'b0;
					branch = 1'b0;
					D = 1'b0;
					
					destination[3:0] = {1'b0, INSTRUCTION[2:0]}; 
				end
	//add & xor
	  3'b110 : begin
					case (INSTRUCTION[5])
						//add
						1'b0:  begin
									OP = 3'b000;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b1;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1001; 
								end
						//xor
						1'b1:  begin
									OP = 3'b010;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b1;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1011; 
								end
					endcase
				end
	//beqr & copy
	  3'b111 : begin
					case (INSTRUCTION[5])
						//beqr
						1'b0 :  begin
									OP = 3'b001;
									RegWrite = 1'b0;
									MemWrite = 1'b0;
									ALUSrc = 1'b0;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b1;
									D = 1'b0;
									
									destination[3:0] = 4'b0000; 
									end
						//copy from D register to R register
						1'b1 :  begin
									OP = 3'b000;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b1;
									Move = 1'b0;
									Copy = 1'b1;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b1;
									
									destination[3:0] = {1'b0, INSTRUCTION[2:0]}; 
									end
					endcase
				end
	//addi & lsl
	  3'b100 : begin
					case (INSTRUCTION[5])
						//add immediate
						1'b0 :  begin
									OP = 3'b000;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b0;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1010; 
									end
						//logical shift left
						1'b1 :  begin
									OP = 3'b101;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b0;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1011; 
									end
					endcase
				end
	//lsr & pm
	  3'b101 : begin
					case (INSTRUCTION[5])
						//logical shift right
						1'b0 :  begin
									OP = 3'b110;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b0;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1011; 
									end
						//pattern match
						1'b1 :  begin
									OP = 3'b100;
									RegWrite = 1'b1;
									MemWrite = 1'b0;
									ALUSrc = 1'b1;
									Move = 1'b0;
									Copy = 1'b0;
									Load = 1'b0;
									branch = 1'b0;
									D = 1'b0;
									
									destination[3:0] = 4'b1001; 
									end
					endcase
				end
	  default : begin//default case
				  OP = 3'b000;
				 
				  RegWrite   = 1'b0;
				  MemWrite   = 1'b0;
				  ALUSrc	 = 1'b0;
				  Move		 = 1'b0;
				  Copy		 = 1'b0;
				  Load		 = 1'b0;
				  branch	 = 1'b0;
				  D			 = 1'b0;
				  
				  destination[3:0] = 4'b0000;
				end
	endcase
	
  end

endmodule