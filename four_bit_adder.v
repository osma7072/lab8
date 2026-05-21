`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: four_bit_adder
// Project: ENGR230 Four-Bit Adder
// Board: Basys3
// Vivado Version: 2018.2
//
// Description:
// 4-bit ripple carry adder made from four 1-bit full adders.
// The carry from each bit moves into the next bit.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module four_bit_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] S,
    output       Cout
);

    // These wires connect the carry between each full adder.
    // Cin -> bit 0 -> bit 1 -> bit 2 -> bit 3 -> Cout
    wire C1, C2, C3;


    // bit 0: adds A[0], B[0], and Cin
    // this gives S[0] and sends carry to C1
    full_adder_1bit FA0 (
        .A   (A[0]),
        .B   (B[0]),
        .Cin (Cin),
        .Sum (S[0]),
        .Cout(C1)
    );


    // bit 1: adds A[1], B[1], and carry from bit 0
    full_adder_1bit FA1 (
        .A   (A[1]),
        .B   (B[1]),
        .Cin (C1),
        .Sum (S[1]),
        .Cout(C2)
    );


    // bit 2: adds A[2], B[2], and carry from bit 1
    full_adder_1bit FA2 (
        .A   (A[2]),
        .B   (B[2]),
        .Cin (C2),
        .Sum (S[2]),
        .Cout(C3)
    );


    // bit 3: adds A[3], B[3], and carry from bit 2
    // Cout is the extra 5th bit of the answer
    full_adder_1bit FA3 (
        .A   (A[3]),
        .B   (B[3]),
        .Cin (C3),
        .Sum (S[3]),
        .Cout(Cout)
    );

endmodule
