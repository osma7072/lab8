`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of St. Thomas - ENGR230
// Engineer: Adam Osman
//
// Create Date: 05/05/2026 02:23:16 PM
// Design Name: Four-Bit Adder
// Module Name: four_bit_adder
// Project Name: ENGR230 Lab - Four-Bit Adder
// Target Devices: Basys3 / Artix-7
// Tool Versions: Vivado 2018.2
// Description: A 4-bit ripple-carry adder built by instantiating four
//              single-bit full adders (full_adder_1bit).
//
//              HOW IT WORKS - RIPPLE CARRY:
//              Each full adder handles one bit position. The carry-out
//              of each stage ripples into the carry-in of the next,
//              exactly like long addition by hand.
//
//              Bit position:   3     2     1     0
//              -----------------------------------------
//              A input:       A[3]  A[2]  A[1]  A[0]
//              B input:       B[3]  B[2]  B[1]  B[0]
//              Carry chain: Cout <- C3 <- C2 <- C1 <- Cin
//              Sum output:    S[3]  S[2]  S[1]  S[0]
//
//              The sum of two 4-bit numbers needs 5 bits.
//              Max: 1111(15) + 1111(15) + 1(Cin) = 11111 (31)
//              Full result is {Cout, S[3:0]}.
//
// Dependencies: full_adder_1bit.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Source/Citation: This Verilog was Claude-assisted for code structure,
// comments, and debugging support. Final design choices and testing have been
// reviewed and understood by Adam Osman before submission.
//////////////////////////////////////////////////////////////////////////////////

module four_bit_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] S,
    output       Cout
);

    // Internal carry wires connecting the four full adder stages.
    // Cin -> FA0 -> C1 -> FA1 -> C2 -> FA2 -> C3 -> FA3 -> Cout
    wire C1, C2, C3;

    // Stage 0 (bit 0, LSB): A[0] + B[0] + Cin -> S[0], carry out to C1
    full_adder_1bit FA0 (
        .A   (A[0]),
        .B   (B[0]),
        .Cin (Cin),   // external carry in (SW8 on BASYS3)
        .Sum (S[0]),  // bit 0 of the result
        .Cout(C1)     // internal carry wire to stage 1
    );

    // Stage 1 (bit 1): A[1] + B[1] + C1 -> S[1], carry out to C2
    full_adder_1bit FA1 (
        .A   (A[1]),
        .B   (B[1]),
        .Cin (C1),    // carry ripples in from stage 0
        .Sum (S[1]),  // bit 1 of the result
        .Cout(C2)     // internal carry wire to stage 2
    );

    // Stage 2 (bit 2): A[2] + B[2] + C2 -> S[2], carry out to C3
    full_adder_1bit FA2 (
        .A   (A[2]),
        .B   (B[2]),
        .Cin (C2),    // carry ripples in from stage 1
        .Sum (S[2]),  // bit 2 of the result
        .Cout(C3)     // internal carry wire to stage 3
    );

    // Stage 3 (bit 3, MSB): A[3] + B[3] + C3 -> S[3], carry out to Cout
    full_adder_1bit FA3 (
        .A   (A[3]),
        .B   (B[3]),
        .Cin (C3),    // carry ripples in from stage 2
        .Sum (S[3]),  // bit 3 of the result
        .Cout(Cout)   // final carry out -> MSB LED (LD4) on BASYS3
    );

endmodule
