# elficpu1
Another one simple 4-bit CPU written in VHDL

# Features
- 4-bit word CPU
- Up to 65536 words of instruction memory
- Up to 256 I/O ports
- Two general purpose registers A and B
- One 16-bit counter register CNT

# Reset behaviour
Program counter is set to address 0x0000.
General purpose registers are set to 0.

# Instructions
- nop. No operation :)
- mov const, a. Load register A with a 4-bit constant data. Opcode: 1h X.
- mov const, b. Load register B with a 4-bit constant data. Opcode: 2h X.
- halt. Halts CPU. Opcode: Fh.
- out a, portaddr. Write register A to port. Opcode: 3h, X, Y.
- out b, portaddr. Write register A to port. Opcode: 4h, X, Y.
- init cnt, xxxx. Load register CNT with a 16-bit constant value. Opcode: 5h, A, B, C, D
- dec cnt. Decrement CNT register. Opcode: 6h.
- jnz addr. Jump on CNT register is not zero. Opcode: 7h, A, B, C, D.
- jmp addr. Jump to address. Opcode: 7h, A, B, C, D.

# FPGA resources
On Sparten 3e board: 147 slices. Max. clock frequency: 118 MHz.

# RTL schematics
![RTL schematics](Spartan3E_StarterKit/RTL-schematics.png)
