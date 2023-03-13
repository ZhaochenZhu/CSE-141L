module lut (
  input[7:0]	label,
  
  output logic[11:0] next_pc);

always_comb begin
	case (label)
		0: next_pc = 2;
		1: next_pc = 2;
		2: next_pc = 347;
		3: next_pc = 200;
		4: next_pc = 213;
		5: next_pc = 226;
		6: next_pc = 239;
		7: next_pc = 252;
		8: next_pc = 265;
		9: next_pc = 278;
		10: next_pc = 291;
		11: next_pc = 302;
		12: next_pc = 313;
		13: next_pc = 324;
		14: next_pc = 334;
		15: next_pc = 449;
		16: next_pc = 481;
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
		34: next_pc = 262;
		35: next_pc = 284;
		36: next_pc = 303;
		37: next_pc = 322;
		38: next_pc = 341;
		39: next_pc = 361;
		40: next_pc = 380;
		41: next_pc = 399;
		42: next_pc = 418;
		43: next_pc = 445;
		default: next_pc = 0;
	endcase
end
			
endmodule