//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        2010/8/16
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module Decoder(
  instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
//reg            ALUSrc_o;
//reg            RegWrite_o;
//reg            RegDst_o;
//reg            Branch_o;
reg            R_format;
reg            beq;
reg            addi;
reg            slti;
reg            lui;
reg            ori;
reg            bne;
//Parameter
parameter      R_type      = 6'b000000;
parameter      BEQ         = 6'b000100;
parameter      ADDi        = 6'b001000;
parameter      SLTi        = 6'b001010;
parameter      LUI         = 6'b001111;
parameter      ORi         = 6'b001101;
parameter      BNE         = 6'b000101;
//Main function
always @(*) begin
  R_format <= (instr_op_i == R_type) ? 1 : 0;
  beq      <= (instr_op_i == BEQ)    ? 1 : 0;
  addi     <= (instr_op_i == ADDi)   ? 1 : 0;
  slti     <= (instr_op_i == SLTi)   ? 1 : 0;
  lui      <= (instr_op_i == LUI)    ? 1 : 0;
  ori      <= (instr_op_i == ORi)    ? 1 : 0;
  bne      <= (instr_op_i == BNE)    ? 1 : 0;
end

assign         RegDst_o    = R_format;
assign         ALUSrc_o    = addi || slti || lui || ori;
assign         Branch_o    = beq || bne;
assign         RegWrite_o  = ~beq && ~bne;

always @(*) begin
  case(instr_op_i)
    R_type:  ALU_op_o       = 3'b010;
    BEQ:     ALU_op_o       = 3'b001;
    ADDi:    ALU_op_o       = 3'b100;
    SLTi:    ALU_op_o       = 3'b101;
    LUI:     ALU_op_o       = 3'b110;
    ORi:     ALU_op_o       = 3'b111;
    BNE:     ALU_op_o       = 3'b001;
    default: ALU_op_o       = 3'b000;
  endcase
end

endmodule







