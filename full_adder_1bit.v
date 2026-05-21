`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of St. Thomas - ENGR230
// Engineer: Adam Osman
//
// Create Date: 05/05/2026 02:23:16 PM
// Design Name: Four-Bit Adder
// Module Name: full_adder_1bit
// Project Name: ENGR230 Lab - Four-Bit Adder
// Target Devices: Basys3 / Artix-7
// Tool Versions: Vivado 2018.2
// Description: A single-bit full adder.
//              Adds three 1-bit inputs (A, B, Cin) and produces
//              a 1-bit Sum and a 1-bit Carry-out (Cout).
//
//              Truth table:
//              A  B  Cin | Sum  Cout
//              0  0   0  |  0     0
//              0  0   1  |  1     0
//              0  1   0  |  1     0
//              0  1   1  |  0     1
//              1  0   0  |  1     0
//              1  0   1  |  0     1
//              1  1   0  |  0     1
//              1  1   1  |  1     1
//
//              Boolean equations:
//              Sum  = A ^ B ^ Cin
//              Cout = (A & B) | (Cin & (A ^ B))
//
// Dependencies: none
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Source/Citation: This Verilog was Claude-assisted for code structure,
// comments, and debugging support. Final design choices and testing have been
// reviewed and understood by Adam Osman before submission.
//////////////////////////////////////////////////////////////////////////////////

module full_adder_1bit(
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);

    // Sum is 1 when an odd number of inputs are 1 (XOR of all three)
    assign Sum  = A ^ B ^ Cin;

    // Cout is 1 when at least two inputs are 1 (majority function)
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
