OBJS = Simple_Single_CPU
SRCS = Simple_Single_CPU.v ALU.v ALU_Ctrl.v Adder.v Decoder.v Instr_Memory.v MUX_2to1.v ProgramCounter.v Reg_File.v Shift_Left_Two_32.v Sign_Extend.v Test_Bench.v
CC   = iverilog

all: $(OBJS)

$(OBJS): $(SRCS)
	$(CC) -o $(OBJS) $(SRCS)


