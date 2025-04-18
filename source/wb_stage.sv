module wb_stage#(parameter N=32)(mem_out,alu_out,memtoreg,wb_data,return_addr,imm_out,pc_signed_offset,opcode_out_d);
input logic [N-1:0]mem_out,alu_out,return_addr,imm_out,pc_signed_offset;
output logic [N-1:0]wb_data;
input logic [1:0]memtoreg;
//input logic and_out_ex;
input logic [6:0]opcode_out_d;
(* KEEP = "TRUE" *)wire [1:0]U_control;
(* KEEP = "TRUE" *)wire [31:0] out;
(* DONT_TOUCH = "TRUE" *) mux31 mux_wb (.a(mem_out),.b(alu_out),.c(out),.cntrl(memtoreg),.out(wb_data));
(* DONT_TOUCH = "TRUE" *) control_gen U_cntrl (.opcode_out_d(opcode_out_d),.U_control(U_control));
(* DONT_TOUCH = "TRUE" *) mux31 U_mux (.a(return_addr),.b(imm_out),.c(pc_signed_offset),.cntrl(U_control),.out(out));
endmodule



