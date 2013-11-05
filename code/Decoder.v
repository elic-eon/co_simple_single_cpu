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
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            R_format;
reg            lw;
reg            sw;
reg            beq;

//Parameter

//Main function
always @(*) begin
  R_format <= (instr_op_i == 6'b000000) ? 1 : 0;
  lw       <= (instr_op_i == 6'b100011) ? 1 : 0;
  sw       <= (instr_op_i == 6'b101011) ? 1 : 0;
  beq      <= (instr_op_i == 6'b000100) ? 1 : 0;
end

assign        RegDst_o     = R_format;
assign        ALUSrc_o     = lw | sw;
assign        RegWrite_o   = R_format | lw;
assign        Branch_o     = beq;
assign        ALU_op_o[0]  = beq;
assign        ALU_op_o[1]  = R_format;
assign        ALU_op_o[2]  = 0;

endmodule







