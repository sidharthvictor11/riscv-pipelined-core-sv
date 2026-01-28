module if_stage #(
  parameter int XLEN = 32,
  parameter logic [XLEN -1:0] RESET_PC = '0
)(
  input logic i_clk,
  input logic i_rst_n,
  
  input logic i_branch_taken,
  input logic [XLEN-1:0] i_branch_addr,
  
  output logic [XLEN-1:0] o_imem_addr,
  input logic [31:0] i_imem_rdata,
  
  output logic [XLEN-1:0] o_if_pc,
  output logic [31:0] o_if_instr,
  output logic o_if_valid
);

    logic [XLEN-1:0] pc_d, pc_q;
    
    //next program counter logic
    always_comb begin
      if(i_branch_taken)
        pc_d = i_branch_addr;
      else
        pc_d = pc_q + XLEN'(4);
    end
    
    //pc register
    always_ff @(posedge i_clk) begin
      if(!i_rst_n)
        pc_q <= RESET_PC;
      else
        pc_q <= pc_d;
    end
    
    //Instruction memory interface
    assign o_imem_addr = pc_q;
    
    //Output to Decode
    assign o_if_pc = pc_q;
    assign o_if_instr = i_imem_rdata;
    assign o_if_valid = 1'b1;

endmodule
