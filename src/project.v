`default_nettype none
`timescale 1ns / 1ps


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

    wire tvalid = uio_in[0];
    assign uio_out[0] = 1'b1;   // tready always high
    assign uio_oe = 8'b00000001;

    always @(posedge clk) begin
        if (!rst_n)
            data <= 8'h00;
        else if (tvalid)
            data <= ui_in;
    end

    assign uo_out = data;

endmodule
