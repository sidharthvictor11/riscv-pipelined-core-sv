import risc_pkg::*;

module alu(
  //Operands
  input logic [31:0] alu_a,
  input logic [31:0] alu_b,
  
  //Op type
  input alu_op_t     alu_op,
  
  //ALU result
  output logic [31:0] alu_result
);

  logic signed [31:0] signed_a;
  logic signed [31:0] signed_b;
  
  assign signed_a = alu_a;
  assign signed_b = alu_b;
  
  //ALU Operations
  always_comb begin
    alu_result = 32'd0;
    
    case(alu_op)
      
      ADD : alu_result = alu_a + alu_b;
      SUB : alu_result = alu_a - alu_b;
      
      SLL : alu_result = alu_a << alu_b[4:0];
      SRL : alu_result = alu_a >> alu_b[4:0];
      SRA : alu_result = signed_a >> alu_b[4:0];
      
      OR  : alu_result = alu_a | alu_b;
      AND : alu_result = alu_a & alu_b;
      XOR : alu_result = alu_a ^ alu_b;
      
      SLTU: alu_result = (alu_a < alu_b) ? 32'd1 : 32'd0;
      SLT : alu_result = (signed_a < signed_b) ? 32'd1 : 32'd0 ;
    endcase
  end
     
endmodule
