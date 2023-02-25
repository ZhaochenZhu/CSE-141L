module lut (
  input[7:0]	label,
  
  output logic[11:0] next_pc);

always_comb begin
	case (label)
		0: next_pc = 2;
		1: next_pc = 507;
		2: next_pc = 385;
		3: next_pc = 396;
		4: next_pc = 407;
		5: next_pc = 418;
		6: next_pc = 429;
		7: next_pc = 440;
		8: next_pc = 451;
		9: next_pc = 462;
		10: next_pc = 472;
		11: next_pc = 482;
		12: next_pc = 492;
		13: next_pc = 499;
		14: next_pc = 633;
		15: next_pc = 642;
		16: next_pc = 697;
		17: next_pc = 184;
		18: next_pc = 703;
		19: next_pc = 717;
		20: next_pc = 732;
		21: next_pc = 747;
		22: next_pc = 762;
		23: next_pc = 779;
		24: next_pc = 789;
		25: next_pc = 806;
		26: next_pc = 824;
		27: next_pc = 842;
		28: next_pc = 857;
		29: next_pc = 876;
		30: next_pc = 900;
		31: next_pc = 915;
		32: next_pc = 932;
		33: next_pc = 949;
		34: next_pc = 953;
		35: next_pc = 975;
		36: next_pc = 994;
		37: next_pc = 1013;
		38: next_pc = 1032;
		39: next_pc = 1052;
		40: next_pc = 1071;
		41: next_pc = 1090;
		42: next_pc = 1109;
		43: next_pc = 1134;
		default: next_pc = 0;
	endcase
end
			
endmodule