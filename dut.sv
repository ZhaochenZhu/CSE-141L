module top_level (
	input	clk,
	input reset,
	output logic done);
   
	wire [11:0] pcOut;
	
	logic [11:0] pcAdd1;
	
	//PC Adder
	assign pcAdd1 = pcOut + 1;
	
	logic [11:0] afterbranch;
	
	wire[8:0] instOut;
	
	wire[2:0] ALUControl;
	wire regwrite;
	wire memwrite;
	wire alusrc;
	wire move;
	wire copy;
	wire load;
	wire branch;
	wire d;
	wire[3:0] destination;
	
	wire[5:0] operands;
	
	wire F;
	
	assign operands = {F, instOut[4:0]};
	
	wire[7:0] read1;
	wire[7:0] read2;
	wire[7:0] r1;
	
	wire zero;
	
	wire branchresult;
	
	assign branchresult = branch & zero;
	
	wire[7:0] readdata;
	
	wire[7:0] L;
	wire[7:0] A;
	wire[7:0] B;
	wire[7:0] C;
	wire[7:0] M;
	
	wire[7:0] aluresult;
	
	wire[11:0] nextpcvalue;
	
	lut LUT(
		.label(read2),
		.next_pc(afterbranch)
	);
	
	pc programCounter(
		.clk(clk),
		.reset(reset),
		.next_p_ct(nextpcvalue),
		.p_ct(pcOut)
	);
	
	
	instr_ROM instructionRom (
		.InstAddress(pcOut),
		.InstrOut(instOut)
	);
	

	Decoder decoder  (
		.INSTRUCTION(instOut),
		.OP(ALUControl),
		.RegWrite(regwrite),
		.MemWrite(memwrite),
		.ALUSrc(alusrc),
		.Move(move),
		.Copy(copy),
		.Load(load),
		.branch(branch),
		.D(d),
		.destination(destination)
	);
	
	reg_file regFile (
		.clk(clk),
		.RegWrite(regwrite),
		.D(d),
		.operand1(operands[5:3]),
		.operand2(operands[2:0]),
		.destination(destination),
		.write_data(L),
		.data_outA(read1),
		.data_outB(read2),
		.R1(r1)
	);
	
	MultiMux multiMux (
		.format(instOut[8]),
		.Load(load),
		.ALUSrc(alusrc),
		.Branch(branch),
		.Copy(copy),
		.Move(move),
		.BranchResult(branchresult),
		.format_input_a(instOut[5]),
		.format_input_b({1'b0}),
		.Load_input_a(C),			  
        .Load_input_b(readdata),
		//sign extension
		.ALUSrc_input_a({instOut[2], instOut[2], instOut[2], instOut[2], instOut[2], instOut[2:0]}),
		.ALUSrc_input_b(read2),
		.BranchSrc_input_a(A),
		.BranchSrc_input_b(r1),
		.Copy_input_a(M),
		.Copy_input_b(read1),
		.Move_input_a(aluresult),
		//sign extension
		.Move_input_b({instOut[5], instOut[5], instOut[5:0]}),
		.BranchResult_input_a(pcAdd1),
		.BranchResult_input_b(afterbranch),
		.F(F),
		.L(L),
        .A(A),
        .B(B),
        .C(C),
        .M(M),
        .Br(nextpcvalue)
	);
	
	data_mem dm1 (
		.clk(clk),
		.WriteMem(memwrite),
		.write_data(read1),
		.address(read2),
		.read_data(readdata)
	);
	
	ALU alu (
		.OP(ALUControl),
		.INPUT_A(read1),
		.INPUT_B(B),
		
		.OUT(aluresult),
		
		.ZERO(zero)
	);
	
	always_comb begin
		if (pcOut == 183)
			done = 1;
		else
			done = 0;
	end
	
  
  
endmodule