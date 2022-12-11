CECS341_Lab2_Group44
===========

Lab 3: 32-bit ALU Design

Toan Le  
CECS 341: Computer Architecture & Organization
Dr. Hossein Sayadi

## Lab 3

### Figure 1: ALU Unit to be developed in this Lab project
Figure_1-ALU_Design.png


### Table 2: Test Bench Results Test Vectors for testing the ALU design

_________________________________________________________________________________
|# |   Ahex   | Bhex     | Carryin |ALUCntl | ALUouthex | Zero | Overflow | Cout |
|--|----------|----------|---------|--------|-----------|------|----------|------|
|1 | FFFFFFFF | 00000000 |  -      | 0000   | 00000000  | 1    | 0        | 0    |
|2 | 98989898 | 89898989 |  -      | 0001   | 99999999  | 0    | 1        | 0    |
|3 | 01010101 | 10101010 |  -      | 0011   | 11111111  | 0    | 0        | 0    |
|4 | 00000001 | FFFFFFF  |  0      | 0010   | 00000000  | 0    | 0        | 1    |
|5 | 6389754F | AD5624E6 |  0      | 0010   | 10df9a35  | 0    | 0        | 1    |
|6 | 00000001 | FFFFFFFF |  1      | 0010   | 00000001  | 0    | 0        | 1    |
|7 | 6389754F | AD5624E6 |  1      | 0010   | 10df9a35  | 0    | 0        | 1    |
|8 | FFFFFFFF | FFFFFFFF |  1      | 0010   | ffffffff  | 0    | 0        | 1    |
|9 | 00000000 | 00000001 |  -      | 0110   | ffffffff  | 0    | 1        | 1    |
|10| F9684783 | F998D562 |  -      | 0110   | ffcf7221  | 0    | 0        | 1    |
|11| 9ABCDEDF | 9ABCDEFD |  -      | 1100   | 65432100  | 0    | 1        | 1    |
|12| 89BCDE34 | C53BD687 |  1      | 0010   | 4ef8b4bc  | 0    | 1        | 1    |
__________________________________________________________________________________


### Pre Analysis

The truth table of expected results and the truth table derived from the simulation waveform match exactly. This demonstrates that the full adder VHDL code works as it should.

## Main Lab

### Final Circuit Schematic

  Here is the final circuit schematic. The design uses four full adder components, labeled 3 through 0 as can be seen. The final design also implements the logic from four different multiplexers. These multiplexers switch the input to the adder between B and B' based on whether or not the subtraction button is enabled.

 A Final Schematic of the addder-subtractor can be found in file named 'final schematic.png'

### Four-Bit Adder Testbench Output
The four-bit adder/subtractor waveform can be seen below. There are 512 potential combinations, each one corresponding to 1ns.


###### Console Output
![alt text](https://github.com/JasperArneberg/ECE281_Lab2/blob/master/console_output.png?raw=true "Console Output")


### Design Process
Throughout this lab, it was necessary to constantly break each problem down into smaller pieces. The first task was to make the full adder work. After that, the four-bit adder had to function correctly before moving on. The overflow was pretty easy to implement with a single line of code. The subtractor, on the other hand, took quite a bit of work, because it required multiplexer behavior.

Creating the testbench proved to be a challenge. This was the first exercise or lab that required for loops to test. Since the syntax of VHDL can be very foreign, I had to research how to do for loops. I also looked up how to print error messages stating why certain numbers were not adding up correctly.

### Demonstrations
I demonstrated basic functionality of four-bit adder to Dr. Neebel at 1424 on 10 Feb 14.  
I demonstrated complete funtionality including subtraction and overflow detection to Dr. Neebel at 1322 on 12 Feb 14.

## Documentation
C3C El-Saawy helped me with determining the initial setup of the four-bit adder/subtractor. He also told me to change the reporting severity to FAILURE in the testbench to stop the test if there's an assertion error. 
I learned how to use for loops in a testbench and report results:
http://www.seas.upenn.edu/~ese171/vhdl/VHDLTestbench.pdf  
I used this site to understand why the overflow is Cout(2) xor Cout(3):
http://www.cs.umd.edu/class/sum2003/cmsc311/Notes/Comb/overflow.html
