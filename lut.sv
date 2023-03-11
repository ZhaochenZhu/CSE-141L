module lut (
  input[7:0]	label,
  
  output logic[11:0] next_pc);

always_comb begin
	case (label)
		0: next_pc = 2;
		1: next_pc = 2;
		2: next_pc = 323;
		3: next_pc = 201;
		4: next_pc = 212;
		5: next_pc = 223;
		6: next_pc = 234;
		7: next_pc = 245;
		8: next_pc = 256;
		9: next_pc = 267;
		10: next_pc = 278;
		11: next_pc = 288;
		12: next_pc = 298;
		13: next_pc = 308;
		14: next_pc = 315;
		15: next_pc = 449;
		16: next_pc = 458;
		17: next_pc = 620;
		18: next_pc = 6;
		19: next_pc = 20;
		20: next_pc = 35;
		21: next_pc = 50;
		22: next_pc = 65;
		23: next_pc = 84;
		24: next_pc = 94;
		25: next_pc = 111;
		26: next_pc = 129;
		27: next_pc = 147;
		28: next_pc = 162;
		29: next_pc = 181;
		30: next_pc = 205;
		31: next_pc = 220;
		32: next_pc = 237;
		33: next_pc = 254;
		34: next_pc = 258;
		35: next_pc = 280;
		36: next_pc = 299;
		37: next_pc = 318;
		38: next_pc = 337;
		39: next_pc = 357;
		40: next_pc = 376;
		41: next_pc = 395;
		42: next_pc = 414;
		43: next_pc = 437;
		default: next_pc = 0;
	endcase
end
			
endmodule