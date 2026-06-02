# AXI4-Stream Receiver

A simple AXI4-Stream receiver implemented for Tiny Tapeout.

## How it works

The design receives 8-bit data through the AXI4-Stream interface.

* `ui_in[7:0]` carries the data byte (`TDATA`).
* `uio_in[0]` is used as `TVALID`.
* `uio_out[0]` is used as `TREADY`.

When both `TVALID` and `TREADY` are high on the rising edge of the clock, the incoming byte is captured into an internal register. The received value is then displayed on `uo_out[7:0]`.

## How to test

1. Apply reset by setting `rst_n = 0`.
2. Release reset by setting `rst_n = 1`.
3. Drive a value on `ui_in[7:0]`.
4. Assert `uio_in[0]` (`TVALID`).
5. Wait for a rising clock edge.
6. Verify that the value appears on `uo_out[7:0]`.

Example test sequence:

* Set `ui_in = 8'h55`
* Set `uio_in[0] = 1`
* Wait one clock cycle
* Check `uo_out == 8'h55`

Repeat with additional values such as `8'hAA` and `8'h42`.
