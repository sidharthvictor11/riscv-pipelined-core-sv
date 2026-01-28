`timescale 1ns / 1ps

module if_stage_tb;

    // Parameters
    localparam int XLEN = 32;
    
    // Clock & reset
    logic i_clk;
    logic i_rst_n;
    
    // Branch control
    logic            i_branch_taken;
    logic [XLEN-1:0] i_branch_addr;
    
    // Instruction memory interface
    logic [XLEN-1:0] o_imem_addr;
    logic [31:0]     i_imem_rdata;
    
    // IF outputs
    logic [XLEN-1:0] o_if_pc;
    logic [31:0]     o_if_instr;
    logic            o_if_valid;
    
    // DUT Instantiation
    if_stage #(
      .XLEN(XLEN),
      .RESET_PC(32'h00000000)
    ) dut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_branch_taken(i_branch_taken),
        .i_branch_addr(i_branch_addr),
        .o_imem_addr(o_imem_addr),
        .i_imem_rdata(i_imem_rdata),
        .o_if_pc(o_if_pc),
        .o_if_instr(o_if_instr),
        .o_if_valid(o_if_valid)
    );
    
    // ---------------------
    // Clock Generation(10 ns)
    //-----------------------
    always #5 i_clk = ~i_clk;
    
    //------------------------
    // Instruction memory
    // -----------------------
    
    logic [31:0] imem [0:15];
    
    initial begin
        imem[0]  = 32'h00000013; // NOP
        imem[1]  = 32'h00100093; // addi x1, x0, 1
        imem[2]  = 32'h00200113; // addi x2, x0, 2
        imem[3]  = 32'h00300193; // addi x3, x0, 3
        imem[4]  = 32'h00400213; // addi x4, x0, 4
        imem[5]  = 32'h00500293; // addi x5, x0, 5
    end
        
    always_comb begin
        i_imem_rdata = imem[o_imem_addr[5:2]];
    end
    
    initial begin
        i_clk = 0;
        i_rst_n = 0;
        i_branch_taken = 0;
        i_branch_addr = '0;
        
        // Apply reset
        #20;
        i_rst_n = 1;
        
        // Normal PC Increment
        #50;
        
        // Trigger branch
        i_branch_taken = 1;
        i_branch_addr = 32'h0000_0010;
        #10;
        i_branch_taken = 0;
        
        #50;
        
        $finish;
    end
endmodule
        
        
    
        
