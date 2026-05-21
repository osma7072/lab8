`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: full_adder_1bit
// Project: ENGR230 Four-Bit Adder
// Board: Basys3
// Vivado Version: 2018.2
//
// Description:
// Single bit full adder.
// Adds A, B, and Cin to make Sum and Cout.
//
// Logic:
// Sum is 1 when the number of 1s is odd.
// Cout is 1 when at least two inputs are 1.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module full_adder_1bit(
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);

    // sum bit for this position
    assign Sum = A ^ B ^ Cin;

    // carry out goes high when two or more inputs are high
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
