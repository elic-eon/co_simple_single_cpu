//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter
parameter  R_type   = 3'b010;
parameter  LW       = 3'b000;
parameter  SW       = 3'b000;
parameter  BEQ      = 3'b001;
parameter  ADD      = 6'b100000;
parameter  SUB      = 6'b100010;
parameter  AND      = 6'b100100;
parameter  OR       = 6'b100101;
parameter  SLT      = 6'b101010;
parameter  ALU_AND  = 4'b0000;
parameter  ALU_OR   = 4'b0001;
parameter  ALU_ADD  = 4'b0010;
parameter  ALU_SUB  = 4'b0110;
parameter  ALU_NOR  = 4'b1100;
parameter  ALU_NAND = 4'b1101;
parameter  ALU_SLT  = 4'b0111;
//Select exact operation

always @(funct_i, ALUOp_i) begin
  case (ALUOp_i)
    LW:       ALUCtrl_o <= ALU_ADD;
    SW:       ALUCtrl_o <= ALU_ADD;
    BEQ:      ALUCtrl_o <= ALU_SUB;
    R_type: begin
      case (funct_i)
        ADD:  ALUCtrl_o <= ALU_AND;
        SUB:  ALUCtrl_o <= ALU_SUB;
        AND:  ALUCtrl_o <= ALU_AND;
        OR:   ALUCtrl_o <= ALU_OR;
        SLT:  ALUCtrl_o <= ALU_SLT;
        default: ALUCtrl_o <= 0;
      endcase
    end
    default:  ALUCtrl_o <= 0;
  endcase
end

endmodule
