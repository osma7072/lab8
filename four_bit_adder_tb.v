`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adam Osman
//
// Create Date: 05/05/2026
// Module Name: four_bit_adder_tb
// Project: ENGR230 Four-Bit Adder
// Board: BASYS3
// Vivado Version: 2018.2
//
// Description:
// Testbench for the 4-bit adder.
// Runs different input combinations and checks normal cases,
// carry cases, and max values.
//
// Notes:
// Final answer is {Cout, S}
// Example:
// 1111 + 1111 + 1 = 11111
//
// Vivado tips:
// A -> Unsigned Decimal
// B -> Unsigned Decimal
// S -> Binary
//
// Run sim for about 1500 ns to see all tests.
//
// Source:
// Claude helped with code structure, comments, and debugging.
// Final testing and understanding of the design was done by Adam Osman.
//////////////////////////////////////////////////////////////////////////////////

module four_bit_adder_tb();

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] S;
    wire       Cout;


    // module being tested
    four_bit_adder DUT (
        .A   (A),
        .B   (B),
        .Cin (Cin),
        .S   (S),
        .Cout(Cout)
    );


    initial begin

        // start simple
        // 0 + 0 = 0
        A = 4'd0; B = 4'd0; Cin = 0; #100;


        // check carry in by itself
        // result should become 1
        A = 4'd0; B = 4'd0; Cin = 1; #100;


        // small values
        A = 4'd1; B = 4'd1; Cin = 0; #100;

        A = 4'd3; B = 4'd4; Cin = 0; #100;

        A = 4'd5; B = 4'd5; Cin = 0; #100;


        // largest answer before carry out
        A = 4'd6; B = 4'd9; Cin = 0; #100;


        // first time carry out happens
        A = 4'd7; B = 4'd8; Cin = 1; #100;


        // same carry result with different inputs
        A = 4'd8; B = 4'd8; Cin = 0; #100;

        A = 4'd9; B = 4'd7; Cin = 0; #100;

        A = 4'd10; B = 4'd5; Cin = 1; #100;


        // check values above 16
        A = 4'd11; B = 4'd6; Cin = 0; #100;

        A = 4'd13; B = 4'd5; Cin = 0; #100;


        // highest answer without carry in
        A = 4'd15; B = 4'd15; Cin = 0; #100;


        // max possible result
        // all inputs HIGH
        A = 4'd15; B = 4'd15; Cin = 1; #100;


        $finish;

    end

endmodule
