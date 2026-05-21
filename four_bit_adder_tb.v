`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of St. Thomas - ENGR230
// Engineer: Adam Osman
//
// Create Date: 05/05/2026 02:23:16 PM
// Design Name: Four-Bit Adder
// Module Name: four_bit_adder_tb
// Project Name: ENGR230 Lab - Four-Bit Adder
// Target Devices: Basys3 / Artix-7
// Tool Versions: Vivado 2018.2
// Description: Testbench for the four_bit_adder module.
//              Tests 14 input combinations covering zero inputs,
//              small/mid/max values, carry-out cases, and Cin=1 cases.
//
//              RESULT WIDTH: Two 4-bit numbers sum to at most 5 bits.
//              Full result is {Cout, S[3:0]}. Max = 15+15+1 = 31 = 5'b11111.
//
//              HOW TO VIEW IN VIVADO:
//                Right-click A -> Radix -> Unsigned Decimal
//                Right-click B -> Radix -> Unsigned Decimal
//                Right-click S -> Radix -> Binary
//
//              Set simulation run time to at least 1500 ns to see all tests.
//
// Dependencies: four_bit_adder.v, full_adder_1bit.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Source/Citation: This Verilog was Claude-assisted for code structure,
// comments, and debugging support. Final design choices and testing have been
// reviewed and understood by Adam Osman before submission.
//////////////////////////////////////////////////////////////////////////////////

module four_bit_adder_tb();

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] S;
    wire       Cout;

    // Instantiate the device under test
    four_bit_adder DUT (
        .A   (A),
        .B   (B),
        .Cin (Cin),
        .S   (S),
        .Cout(Cout)
    );

    initial begin

        // Test 1: 0 + 0 + 0 = 0
        // Expected: Cout=0  S=0000  {Cout,S}=00000 (decimal 0)
        A = 4'd0;  B = 4'd0;  Cin = 1'b0;  #100;

        // Test 2: 0 + 0 + 1 (Cin) = 1
        // Expected: Cout=0  S=0001  {Cout,S}=00001 (decimal 1)
        A = 4'd0;  B = 4'd0;  Cin = 1'b1;  #100;

        // Test 3: 1 + 1 + 0 = 2
        // Expected: Cout=0  S=0010  {Cout,S}=00010 (decimal 2)
        A = 4'd1;  B = 4'd1;  Cin = 1'b0;  #100;

        // Test 4: 3 + 4 + 0 = 7
        // Expected: Cout=0  S=0111  {Cout,S}=00111 (decimal 7)
        A = 4'd3;  B = 4'd4;  Cin = 1'b0;  #100;

        // Test 5: 5 + 5 + 0 = 10
        // Expected: Cout=0  S=1010  {Cout,S}=01010 (decimal 10)
        A = 4'd5;  B = 4'd5;  Cin = 1'b0;  #100;

        // Test 6: 6 + 9 + 0 = 15 (max sum without Cout)
        // Expected: Cout=0  S=1111  {Cout,S}=01111 (decimal 15)
        A = 4'd6;  B = 4'd9;  Cin = 1'b0;  #100;

        // Test 7: 7 + 8 + 1 (Cin) = 16 (first carry-out case)
        // Expected: Cout=1  S=0000  {Cout,S}=10000 (decimal 16)
        A = 4'd7;  B = 4'd8;  Cin = 1'b1;  #100;

        // Test 8: 8 + 8 + 0 = 16
        // Expected: Cout=1  S=0000  {Cout,S}=10000 (decimal 16)
        A = 4'd8;  B = 4'd8;  Cin = 1'b0;  #100;

        // Test 9: 9 + 7 + 0 = 16 (same result, different inputs)
        // Expected: Cout=1  S=0000  {Cout,S}=10000 (decimal 16)
        A = 4'd9;  B = 4'd7;  Cin = 1'b0;  #100;

        // Test 10: 10 + 5 + 1 (Cin) = 16
        // Expected: Cout=1  S=0000  {Cout,S}=10000 (decimal 16)
        A = 4'd10; B = 4'd5;  Cin = 1'b1;  #100;

        // Test 11: 11 + 6 + 0 = 17
        // Expected: Cout=1  S=0001  {Cout,S}=10001 (decimal 17)
        A = 4'd11; B = 4'd6;  Cin = 1'b0;  #100;

        // Test 12: 13 + 5 + 0 = 18
        // Expected: Cout=1  S=0010  {Cout,S}=10010 (decimal 18)
        A = 4'd13; B = 4'd5;  Cin = 1'b0;  #100;

        // Test 13: 15 + 15 + 0 = 30 (max without Cin)
        // Expected: Cout=1  S=1110  {Cout,S}=11110 (decimal 30)
        A = 4'd15; B = 4'd15; Cin = 1'b0;  #100;

        // Test 14: 15 + 15 + 1 = 31 (absolute maximum, all inputs HIGH)
        // Expected: Cout=1  S=1111  {Cout,S}=11111 (decimal 31)
        A = 4'd15; B = 4'd15; Cin = 1'b1;  #100;

        $finish;
    end

endmodule
