module data_mem (
    input logic clk,
    input logic mem_write,
    input logic mem_read,
    input logic [31:0] addr,
    input logic [31:0] write_data,
    output logic [31:0] read_data
);

    logic [7:0] mem [0:255]; // 256 bytes of RAM

    // Write
    always_ff @(posedge clk) begin
        if (mem_write) begin
            mem[addr]     <= write_data[7:0];
            mem[addr + 1] <= write_data[15:8];
            mem[addr + 2] <= write_data[23:16];
            mem[addr + 3] <= write_data[31:24];
        end
    end

    // Read: 
    always_ff @(posedge clk) begin
        if (mem_read) begin
            read_data <= {mem[addr + 3], mem[addr + 2], mem[addr + 1], mem[addr]};
        end
    end

endmodule
