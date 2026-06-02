module tt_um_axis_rx (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire clk,
    input  wire rst_n
);

    reg [7:0] data;

    // simple AXI-like behavior:
    // capture input and reflect to output

    always @(posedge clk) begin
        if (!rst_n)
            data <= 8'd0;
        else
            data <= ui_in;   // direct pass-through (what test expects)
    end

    assign uo_out = data;

    // AXI signals (optional, not used by test)
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
