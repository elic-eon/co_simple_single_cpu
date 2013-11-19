OBJS = Simple_Single_CPU
SRCS = Simple_Single_CPU.v ALU.v ALU_Ctrl.v Adder.v Decoder.v Instr_Memory.v MUX_2to1.v ProgramCounter.v Reg_File.v Shift_Left_Two_32.v Sign_Extend.v Test_Bench.v
B_SRCS = Simple_Single_CPU.v ALU.v ALU_Ctrl.v Adder.v Decoder.v Instr_Memory.v MUX_2to1.v ProgramCounter.v Reg_File.v Shift_Left_Two_32.v Sign_Extend.v Test_Bench.v Unsign_Extend.v
CC   = iverilog

all: $(OBJS)

$(OBJS): $(SRCS)
	$(CC) -o $(OBJS) $(SRCS)

bonus: $(B_SRCS)
	$(CC) -o Bonus_Simple_Single_CPU $(B_SRCS)

clean:
	rm -rf Simple_Single_CPU wave.vcd CO_P2_Result.txt Bonus_Simple_Single_CPU
