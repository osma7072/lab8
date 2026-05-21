## BASYS3 constraints
## Engineer: Adam Osman
## Project: ENGR230 Four-Bit Adder
## Board: BASYS3
## Vivado Version: 2018.2
##
## Source:
## Claude helped with code structure, comments, and debugging.
## Final testing and understanding of the design was done by Adam Osman.
##
## SWITCHES:
## SW0-SW3 -> operand A
## SW4-SW7 -> operand B
## SW8     -> carry in
##
## LEDS:
## LD0-LD3 -> sum output
## LD4     -> carry out
##
## Reading left to right:
## LD4 LD3 LD2 LD1 LD0
## COUT S3  S2  S1  S0


## Board clock (100 MHz)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 [get_ports clk]


## Operand A
## These switches control the first 4-bit input
## SW0 is the least significant bit
## SW3 is the most significant bit

set_property PACKAGE_PIN V17 [get_ports {A[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]

set_property PACKAGE_PIN V16 [get_ports {A[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]

set_property PACKAGE_PIN W16 [get_ports {A[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]

set_property PACKAGE_PIN W17 [get_ports {A[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]


## Operand B
## Same setup as A but using SW4-SW7

set_property PACKAGE_PIN W15 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]

set_property PACKAGE_PIN V15 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]

set_property PACKAGE_PIN W14 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]

set_property PACKAGE_PIN W13 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]


## Carry input
## Lets you manually add an extra 1

set_property PACKAGE_PIN V2 [get_ports Cin]
set_property IOSTANDARD LVCMOS33 [get_ports Cin]


## Sum output
## LEDs show the 4-bit result after addition
## LD0 = least significant bit
## LD3 = most significant bit

set_property PACKAGE_PIN U16 [get_ports {S[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]

set_property PACKAGE_PIN E19 [get_ports {S[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]

set_property PACKAGE_PIN U19 [get_ports {S[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]

set_property PACKAGE_PIN V19 [get_ports {S[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]


## Carry out
## Turns on if the answer needs a 5th bit
## Example: 1111 + 1111

set_property PACKAGE_PIN W18 [get_ports Cout]
set_property IOSTANDARD LVCMOS33 [get_ports Cout]
