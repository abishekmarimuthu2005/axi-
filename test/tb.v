`timescale 1ns/1ps

module tb_axis_rx;

    reg         clk;
    reg         rst_n;

    reg  [7:0]  ui_in;
    reg  [7:0]  uio_in;

    wire [7:0]  uo_out;
    wire [7:0]  uio_out;
    wire [7:0]  uio_oe;

    // DUT
    tt_um_axis_rx dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // 100 MHz clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // AXI-stream send task
    task send_byte;
        input [7:0] data;
        begin
            @(posedge clk);
            ui_in     <= data;
            uio_in[0] <= 1'b1;    // tvalid

            @(posedge clk);
            uio_in[0] <= 1'b0;    // deassert tvalid
        end
    endtask

    initial begin
        // init
        ui_in  = 8'h00;
        uio_in = 8'h00;
        rst_n  = 1'b0;

        // reset
        repeat(5) @(posedge clk);
        rst_n = 1'b1;

        // send some bytes
        send_byte(8'h55);
        send_byte(8'hAA);
        send_byte(8'h42);

        repeat(5) @(posedge clk);

        $finish;
    end

    // monitor
    always @(posedge clk) begin
        if (rst_n) begin
            $display("%0t  TVALID=%0b TREADY=%0b TDATA=%02h RX=%02h",
                     $time,
                     uio_in[0],
                     uio_out[0],
                     ui_in,
                     uo_out);
        end
    end

endmodule
