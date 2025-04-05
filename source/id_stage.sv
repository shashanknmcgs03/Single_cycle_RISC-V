module id_stage(rs1_data,rs2_data,imm_out,wb_data,opcode_out_d,fn3_out_d,fn7_5,imm11_5,branch,mem_read,memtoreg,aluop,mem_write,alu_src,clk,reset,instruction);
input logic [31:0]instruction,wb_data;
input logic clk,reset;
//output logic reg_write;
output logic [31:0]rs1_data,rs2_data,imm_out;
output logic [6:0]opcode_out_d,imm11_5;
output logic [2:0]fn3_out_d;
output logic [2:0]aluop;
output logic [1:0]memtoreg;
output logic fn7_5,branch,mem_read,mem_write,alu_src;
(* KEEP = "TRUE" *) wire reg_write;
(* KEEP = "TRUE" *) wire [4:0]rs1_out_d,rs2_out_d,rd_out_d;
(* KEEP = "TRUE" *) wire [19:0]imm_uj_outd;
(* KEEP = "TRUE" *) wire [11:0]imm_out_d;
//(* KEEP = "TRUE" *) wire [31:0][31:0]reg_out;
//(* KEEP = "TRUE" *) wire [31:0] out;
(* DONT_TOUCH = "TRUE" *) decoder #(32) decode (.imm11_5(imm11_5),.instruction(instruction),.rs1(rs1_out_d),.rs2(rs2_out_d),.rd(rd_out_d),.imm(imm_out_d),.imm_uj(imm_uj_outd),.fn3(fn3_out_d),.opcode(opcode_out_d),.fn7_5(fn7_5));
//(* DONT_TOUCH = "TRUE" *) decoder_5_32 decoding (.in(rd_out_d),.out(out));
(* DONT_TOUCH = "TRUE" *) imm_generator imm_gen (.imm_input_uj(imm_uj_outd),.imm_input(imm_out_d),.imm_output(imm_out),.opcode(opcode_out_d));
(* DONT_TOUCH = "TRUE" *) reg_file register_file (.rd_sel(rd_out_d),.reg_write(reg_write),.wb_data(wb_data),.clk(clk),.reset(reset),.rs1_sel(rs1_out_d),.rs1_data(rs1_data),.rs2_sel(rs2_out_d),.rs2_data(rs2_data));
(* DONT_TOUCH = "TRUE" *) main_control mc (.opcode(opcode_out_d),.branch(branch),.memread(mem_read),.memtoreg(memtoreg),.aluop(aluop),.memwrite(mem_write),.alusrc(alu_src),.reg_write(reg_write));
endmodule
