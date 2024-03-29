// Create Date:    2017.01.25 
// Design Name: 
// Module Name:    InstROM 
// Description: Verilog module -- instruction ROM 	
//
module instr_ROM (
  input       [11:0] InstAddress,
  output logic[8:0] InstrOut);
	 
// need $readmemh or $readmemb to initialize all of the elements
// declare ROM array
  logic[8:0] inst_rom[4096];
    
// read from it
  always_comb InstrOut = inst_rom[InstAddress];

endmodule