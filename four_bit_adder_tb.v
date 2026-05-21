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

        // Test 1: start simple
        // 0 + 0 + 0 = 0
        // Expected {Cout,S} = 00000
        A = 4'd0; B = 4'd0; Cin = 0; #100;


        // Test 2: check carry in by itself
        // 0 + 0 + 1 = 1
        // Expected {Cout,S} = 00001
        A = 4'd0; B = 4'd0; Cin = 1; #100;


        // Test 3: small values
        // 1 + 1 + 0 = 2
        // Expected {Cout,S} = 00010
        A = 4'd1; B = 4'd1; Cin = 0; #100;


        // Test 4: another small add
        // 3 + 4 + 0 = 7
        // Expected {Cout,S} = 00111
        A = 4'd3; B = 4'd4; Cin = 0; #100;


        // Test 5: middle value check
        // 5 + 5 + 0 = 10
        // Expected {Cout,S} = 01010
        A = 4'd5; B = 4'd5; Cin = 0; #100;


        // Test 6: largest answer before carry out
        // 6 + 9 + 0 = 15
        // Expected {Cout,S} = 01111
        A = 4'd6; B = 4'd9; Cin = 0; #100;


        // Test 7: first time carry out happens
        // 7 + 8 + 1 = 16
        // Expected {Cout,S} = 10000
        A = 4'd7; B = 4'd8; Cin = 1; #100;


        // Test 8: carry out case
        // 8 + 8 + 0 = 16
        // Expected {Cout,S} = 10000
        A = 4'd8; B = 4'd8; Cin = 0; #100;


        // Test 9: same carry result with different inputs
        // 9 + 7 + 0 = 16
        // Expected {Cout,S} = 10000
        A = 4'd9; B = 4'd7; Cin = 0; #100;


        // Test 10: carry out with Cin
        // 10 + 5 + 1 = 16
        // Expected {Cout,S} = 10000
        A = 4'd10; B = 4'd5; Cin = 1; #100;


        // Test 11: value above 16
        // 11 + 6 + 0 = 17
        // Expected {Cout,S} = 10001
        A = 4'd11; B = 4'd6; Cin = 0; #100;


        // Test 12: another value above 16
        // 13 + 5 + 0 = 18
        // Expected {Cout,S} = 10010
        A = 4'd13; B = 4'd5; Cin = 0; #100;


        // Test 13: highest answer without carry in
        // 15 + 15 + 0 = 30
        // Expected {Cout,S} = 11110
        A = 4'd15; B = 4'd15; Cin = 0; #100;


        // Test 14: max possible result
        // 15 + 15 + 1 = 31
        // Expected {Cout,S} = 11111
        A = 4'd15; B = 4'd15; Cin = 1; #100;


        $finish;

    end

endmodule
