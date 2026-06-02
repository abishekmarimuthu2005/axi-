AXI4-Stream Receiver
How it works
This project implements a simplified AXI4-Stream receiver.

Incoming 8-bit data is applied to the input pins and sampled on the rising edge of the clock. The received value is stored in an internal register and driven to the output pins.

The design demonstrates the basic concept of receiving streaming data synchronized to a clock.

How to test
Apply reset.
Drive an 8-bit value on the input pins.
Wait for a rising clock edge.
Observe the same value on the output pins.
Example:

Input	Output
0x55	0x55
0xAA	0xAA
0xF0	0xF0
External hardware
No external hardware is required.
