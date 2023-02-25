module data_mem(
  input              clk,

  input              WriteMem,
  input [7:0]        write_data,
  
  input [7:0]		 address,
  
  output logic[7:0]  read_data
  );

  logic [7:0] my_memory [256];

  always_comb
      read_data = my_memory[address];

  always_ff @ (posedge clk)
    if(WriteMem) begin
      my_memory[address] <= write_data;
    end

endmodule
