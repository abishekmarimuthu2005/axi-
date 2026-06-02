# AXI4-Stream Receiver

## How it works

This project implements a simple AXI4-Stream receiver.

The receiver accepts 8-bit data on `ui_in[7:0]`.
`uio_in[0]` is used as `TVALID` and `uio_out[0]` is used as `TREADY`.

Whenever `TVALID` and `TREADY` are both high on a rising clock edge, the incoming byte is captured and stored. The received byte is displayed on `uo_out[7:0]`.

## How to test

1. Apply reset (`rst_n = 0`).
2. Release reset (`rst_n = 1`).
3. Drive a byte on `ui_in[7:0]`.
4. Assert `TVALID` on `uio_in[0]`.
5. Wait for a clock edge.
6. Verify the received value appears on `uo_out[7:0]`.

Example:

- Send `8'h55`
- Assert `TVALID`
- Verify `uo_out == 8'h55`
