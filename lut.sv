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
		18: next_pc = 8;
		19: next_pc = 22;
		20: next_pc = 37;
		21: next_pc = 52;
		22: next_pc = 67;
		23: next_pc = 86;
		24: next_pc = 96;
		25: next_pc = 113;
		26: next_pc = 131;
		27: next_pc = 149;
		28: next_pc = 164;
		29: next_pc = 183;
		30: next_pc = 207;
		31: next_pc = 222;
		32: next_pc = 239;
		33: next_pc = 256;
		34: next_pc = 260;
		35: next_pc = 282;
		36: next_pc = 301;
		37: next_pc = 320;
		38: next_pc = 339;
		39: next_pc = 359;
		40: next_pc = 378;
		41: next_pc = 397;
		42: next_pc = 416;
		43: next_pc = 443;
		default: next_pc = 0;
	endcase
end
			
endmodule