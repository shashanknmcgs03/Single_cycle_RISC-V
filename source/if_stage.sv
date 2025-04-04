module if_stage #(parameter N=32)
(
    input logic clk, and_out, reset, 
    input logic [N-1:0] pc_signed_offset,
    input logic [6:0]opcode,
    output logic [N-1:0] address, pc_new
    
);
    wire [N-1:0] pc_next;
    wire pc_gen_out;
    (* DONT_TOUCH = "TRUE" *) adder #(N) add (.address(address), .b(4), .pc_new(pc_new));
    (* DONT_TOUCH = "TRUE" *) mux21 mu (.a(pc_new), .b(pc_signed_offset), .control(pc_gen_out), .y(pc_next));
    (* DONT_TOUCH = "TRUE" *) Program_Counter programc (.pc_next(pc_next), .address(address), .clk(clk), .reset(reset));
    (* DONT_TOUCH = "TRUE" *) pc_cntrl pc_cnt (.opcode(opcode),.and_out(and_out),.pc_gen_out(pc_gen_out));
endmodule
