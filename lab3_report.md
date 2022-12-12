CECS341_Lab3_Group44
=====================

Lab 3: 32-bit ALU Design

Toan Le  
CECS 341: Computer Architecture & Organization
Dr. Sayadi
December 11, 2022

## Objective
The objective of this lab is to design an Arithmetic and Logic Unit (ALU) using VHDL. 
We first developed an ALU defined to the behavioral VHDL model.
We then converted the ALU into a block design using the IP integrator tool. 
The ALU component is illustrated in Figure 1. 

The implementation methods tested are described in Table 1. 

### Design Process
To test our ALU design, we first need to calculate the ALUout, Zero, Overflow, and Carryout values provided in Table 2.
Then we write a tb.vhd file to validate our ALU design for the given inputs of A, B, Carryin, and ALUCntl  
Finally, we report and compare the results with our calculated values.

## Lab Design
We attempt this lab using VHDL code to design the ALU component, which performs the operations  (Table 1 ) for the given ALU control signals and two 32-bit inputs, A and B. 
This result will be output on the 32-bit output port, ALUout. 
The ALU has three flag bits: Zero, Carryout, and Overflow.

### Table 2: Test Vectors for testing the design
__________________________________________________________________________________
|# |   Ahex   | Bhex     | Carryin |ALUCntl | ALUouthex | Zero | Overflow | Cout  |
|:--:|:--------:|:--------:|:-------:|:------:|:---------:|:----:|:--------:|:-----:|
|1 | FFFFFFFF | 00000000 |    -    | 0000   | 00000000  |   1  |   0      |  0    |
|2 | 98989898 | 89898989 |    -    | 0001   |           |      |          |       |
|3 | 01010101 | 10101010 |    -    | 0011   |           |      |          |       |
|4 | 00000001 | FFFFFFF  |    0    | 0010   |           |      |          |       |
|5 | 6389754F | AD5624E6 |    0    | 0010   |           |      |          |       |
|6 | 00000001 | FFFFFFFF |    1    | 0010   |           |      |          |       |
|7 | 6389754F | AD5624E6 |    1    | 0010   |           |      |          |       |
|8 | FFFFFFFF | FFFFFFFF |    1    | 0010   |           |      |          |       |
|9 | 00000000 | 00000001 |    -    | 0110   |           |      |          |       |
|10| F9684783 | F998D562 |    -    | 0110   |           |      |          |       |
|11| 9ABCDEDF | 9ABCDEFD |    -    | 1100   |           |      |          |       |
|12| 89BCDE34 | C53BD687 |    1    | 0010   |           |      |          |       |
|__________________________________________________________________________________|


### Table 3: Results of Test Vectors for Table 2
_________________________________________________________________________________
|# |   Ahex   | Bhex     | Carryin |ALUCntl | ALUouthex | Zero | Overflow | Cout |
|--|:--------:|:--------:|:-------:|:------:|:---------:|:----:|:--------:|:----:|
|1 | FFFFFFFF | 00000000 |    -    | 0000   | 00000000  | 1  |   0        |  0    |
|2 | 98989898 | 89898989 |    -    | 0001   | 99999999  | 0  |   1        |  0    |
|3 | 01010101 | 10101010 |    -    | 0011   | 11111111  | 0  |   0        |  0    |
|4 | 00000001 | FFFFFFF  |    0    | 0010   | 00000000  | 0  |   0        |  1    |
|5 | 6389754F | AD5624E6 |    0    | 0010   | 10df9a35  | 0  |   0        |  1    |
|6 | 00000001 | FFFFFFFF |    1    | 0010   | 00000001  | 0  |   0        |  1    |
|7 | 6389754F | AD5624E6 |    1    | 0010   | 10df9a35  | 0  |   0        |  1    |
|8 | FFFFFFFF | FFFFFFFF |    1    | 0010   | ffffffff  | 0  |   0        |  1    |
|9 | 00000000 | 00000001 |    -    | 0110   | ffffffff  | 0  |   1        |  1    |
|10| F9684783 | F998D562 |    -    | 0110   | ffcf7221  | 0  |   0        |  1    |
|11| 9ABCDEDF | 9ABCDEFD |    -    | 1100   | 65432100  | 0  |   1        |  1    |
|12| 89BCDE34 | C53BD687 |    1    | 0010   | 4ef8b4bc  | 0  |   1        |  1    |
__________________________________________________________________________________

# Calculations of Table 2
When comparing Table 2 vs. Table 3, we can see that we were on the right track when our Test Bench code returned the same values, as confirmed by test case 1 in Table 2.
testcase1.png 
###### testcase1.png
![alt text](https://github.com/toanle0/CECS341_Lab2_Group44/blob/main/testcase1.png)
also shows a screenshot of the expected values:
 ALUouthex =0000000
 Zero  = 1
Overflow = 0
Cout = 0
When input data is
Ahex = FFFFFFFF
Bhex = 00000000
ALUCntl = 0000
We then repeat the calculations for all 12 test cases and validate our ALU design. 

### Lab Report Conclusion 
Our report accomplishes the Lab 3 objective because our ALU design returned the correct outputs for ALUouthex, Zero, Overflow, and Cout.

Table 3 returned the expected results from Table 2. The waveform derived from the simulation waveform match strictly. This demonstrates that our 32-bit ALU VHDL code works as it should.
###### Wave Form
![alt text](https://github.com/toanle0/CECS341_Lab2_Group44/blob/main/tb_behav_waveform.wcfg)


###### Console Output
![alt text](https://github.com/toanle0/CECS341_Lab2_Group44/blob/main/Tcl%20Console.txt)


## What's included

Project file structure

```text
Group44_files/
  -ALU.vhd
  -'Tcl Console.txt'
  -lab3_report.md
  -tb.vhd
  -tb_behav_waveform.wcfg
  -./tb_screenshots/
     testcase0.png
     testcase1.png
     testcase10.png
     testcase11.png
     testcase12.png
     testcase2.png
     testcase3.png
     testcase4.png
     testcase5.png
     testcase6.png
     testcase7.png
     testcase8.png
     testcase9.png
        
        
        
// Full Project tree code following unzip 
// $ tree .
/LAB3
├───.Xil
│   └───Vivado-5384-raven_2
├───CECS341_Lab3_Group44
├───Lab3.cache
│   ├───compile_simlib
│   │   ├───activehdl
│   │   ├───modelsim
│   │   ├───questa
│   │   ├───riviera
│   │   ├───vcs
│   │   └───xcelium
│   ├───ip
│   │   └───2022.1
│   │       ├───7
│   │       │   └───9
│   │       │       └───7928554dd2148309
│   │       └───9
│   │           └───a
│   │               └───9a3f2aeabe0892ce
│   ├───sim
│   └───wt
├───Lab3.gen
│   └───sources_1
│       └───bd
│           ├───design_1
│           │   ├───hdl
│           │   ├───hw_handoff
│           │   ├───ip
│           │   │   └───design_1_ALU_0_0
│           │   │       ├───sim
│           │   │       └───synth
│           │   ├───sim
│           │   └───synth
│           └───mref
│               └───ALU
│                   └───xgui
├───Lab3.hw
├───Lab3.ip_user_files
│   ├───bd
│   │   └───design_1
│   │       ├───ip
│   │       │   └───design_1_ALU_0_0
│   │       │       └───sim
│   │       └───sim
│   ├───mem_init_files
│   └───sim_scripts
│       └───design_1
│           ├───activehdl
│           ├───modelsim
│           ├───questa
│           ├───riviera
│           ├───vcs
│           ├───xcelium
│           └───xsim
│               └───protoinst_files
├───Lab3.runs
│   ├───.jobs
│   └───design_1_ALU_0_0_synth_1
│       └───.Xil
├───Lab3.sim
│   └───sim_1
│       └───behav
│           └───xsim
│               ├───.Xil
│               │   ├───Webtalk-19404-LAPTOP-RH4S86H2
│               │   │   └───webtalk
│               │   └───Webtalk-22168-LAPTOP-RH4S86H2
│               │       └───webtalk
│               ├───protoinst_files
│               └───xsim.dir
│                   ├───tb_behav
│                   │   ├───obj
│                   │   └───webtalk
│                   └───xil_defaultlib
└───Lab3.srcs
    └───sources_1
        ├───bd
        │   └───design_1
        │       ├───ip
        │       │   └───design_1_ALU_0_0
        │       └───ui
        └───new
```
