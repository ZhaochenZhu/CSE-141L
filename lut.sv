module lut (
  input[7:0]	label,
  
  output logic[11:0] next_pc);

always_comb begin
	case (label)
		0: next_pc = 2;
		1: next_pc = 2;
		2: next_pc = 325;
		3: next_pc = 203;
		4: next_pc = 214;
		5: next_pc = 225;
		6: next_pc = 236;
		7: next_pc = 247;
		8: next_pc = 258;
		9: next_pc = 269;
		10: next_pc = 280;
		11: next_pc = 290;
		12: next_pc = 300;
		13: next_pc = 310;
		14: next_pc = 317;
		15: next_pc = 451;
		16: next_pc = 460;
		17: next_pc = 620;
		18: next_pc = 6;
		19: next_pc = 20;
		20: next_pc = 35;
		21: next_pc = 50;
		22: next_pc = 65;
		23: next_pc = 82;
		24: next_pc = 92;
		25: next_pc = 109;
		26: next_pc = 127;
		27: next_pc = 145;
		28: next_pc = 160;
		29: next_pc = 177;
		30: next_pc = 201;
		31: next_pc = 216;
		32: next_pc = 233;
		33: next_pc = 250;
		34: next_pc = 254;
		35: next_pc = 276;
		36: next_pc = 295;
		37: next_pc = 314;
		38: next_pc = 333;
		39: next_pc = 353;
		40: next_pc = 372;
		41: next_pc = 391;
		42: next_pc = 410;
		43: next_pc = 435;
		default: next_pc = 0;
	endcase
end
			
endmodule