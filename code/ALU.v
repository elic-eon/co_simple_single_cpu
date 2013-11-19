//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Huang Szuyi
//----------------------------------------------
//Date:        11.05.13
//----------------------------------------------
//Description: 32-bit alu with AND, OR, ADD, SUB, NOR, NAND, SLT and zeor
//             detect
//--------------------------------------------------------------------------------

module ALU(
  src1_i,
	src2_i,
  shamt_i,
	ctrl_i,
	result_o,
	zero_o
	);

//I/O ports
input   [32-1:0] src1_i;
input   [32-1:0] src2_i;
input    [5-1:0] shamt_i;
input    [4-1:0] ctrl_i;

output  [32-1:0] result_o;
output           zero_o;

//Internal signals
reg     [32-1:0] result_o;
wire             zero_o;

//Parameter
parameter  ALU_AND  = 4'b0000;
parameter  ALU_OR   = 4'b0001;
parameter  ALU_ADD  = 4'b0010;
parameter  ALU_SUB  = 4'b0110;
parameter  ALU_NOR  = 4'b1100;
parameter  ALU_NAND = 4'b1101;
parameter  ALU_SLT  = 4'b0111;
parameter  ALU_SLL  = 4'b0011;
parameter  ALU_LUI  = 4'b0100;
parameter  ALU_SLLV = 4'b0101;

//Main function
assign zero_o = (result_o == 0); //if result_o == 0

always @(ctrl_i, src1_i, src2_i) begin
  case (ctrl_i)
    ALU_AND : result_o <= src1_i & src2_i;
    ALU_OR  : result_o <= src1_i | src2_i;
    ALU_ADD : result_o <= src1_i + src2_i;
    ALU_SUB : result_o <= src1_i - src2_i;
    ALU_NOR : result_o <= ~(src1_i & src2_i);
    ALU_NAND: result_o <= ~(src1_i | src2_i);
    ALU_SLT : result_o <= (src1_i < src2_i) ? 1 : 0;
    ALU_SLL : result_o <= src2_i << shamt_i;
    ALU_SLLV: result_o <= src2_i << src1_i;
    ALU_LUI : result_o <= src2_i << 16;
    default : result_o <= 0;
  endcase
end

endmodule
