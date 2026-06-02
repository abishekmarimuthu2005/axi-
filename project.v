module tt_um_axis_rx (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       clk,
    input  wire       rst_n
);

    reg [7:0] rx_data;

    assign uio_out[0] = 1'b1;   // tready
    assign uio_oe[0]  = 1'b1;

    always @(posedge clk) begin
        if (!rst_n)
            rx_data <= 8'h00;
        else if (uio_in[0])      // tvalid
            rx_data <= ui_in;
    end

    assign uo_out = rx_data;

endmodule
