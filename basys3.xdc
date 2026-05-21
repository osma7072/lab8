## ============================================================
## Constraints  : basys3.xdc
## Engineer     : Adam Osman
## Project      : ENGR230 Lab - Four-Bit Adder
## Board        : Digilent BASYS3 (Artix-7 XC7A35T)
## Tool Version : Vivado 2018.2
##
## SWITCH MAP:
##   SW0  -> A[0]   LSB of operand A
##   SW1  -> A[1]
##   SW2  -> A[2]
##   SW3  -> A[3]   MSB of operand A
##   SW4  -> B[0]   LSB of operand B
##   SW5  -> B[1]
##   SW6  -> B[2]
##   SW7  -> B[3]   MSB of operand B
##   SW8  -> Cin    carry in
##
## LED MAP:
##   LD0  -> S[0]   LSB of sum
##   LD1  -> S[1]
##   LD2  -> S[2]
##   LD3  -> S[3]   MSB of sum
##   LD4  -> Cout   carry out (MSB of full 5-bit result)
##
##   Board reads left to right: LD4 LD3 LD2 LD1 LD0
##                               Cout S3  S2  S1  S0
## ============================================================

## Clock
set_property PACKAGE_PIN W5  [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 [get_ports clk]

## Operand A (SW0-SW3)
set_property PACKAGE_PIN V17 [get_ports {A[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]

set_property PACKAGE_PIN V16 [get_ports {A[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]

set_property PACKAGE_PIN W16 [get_ports {A[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]

set_property PACKAGE_PIN W17 [get_ports {A[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]

## Operand B (SW4-SW7)
set_property PACKAGE_PIN W15 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]

set_property PACKAGE_PIN V15 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]

set_property PACKAGE_PIN W14 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]

set_property PACKAGE_PIN W13 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]

## Carry In (SW8)
set_property PACKAGE_PIN V2  [get_ports Cin]
set_property IOSTANDARD LVCMOS33 [get_ports Cin]

## Sum LEDs (LD0-LD3)
set_property PACKAGE_PIN U16 [get_ports {S[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]

set_property PACKAGE_PIN E19 [get_ports {S[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]

set_property PACKAGE_PIN U19 [get_ports {S[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]

set_property PACKAGE_PIN V19 [get_ports {S[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]

## Carry Out (LD4) - MSB of the 5-bit result, positioned left of sum LEDs
set_property PACKAGE_PIN W18 [get_ports Cout]
set_property IOSTANDARD LVCMOS33 [get_ports Cout]
