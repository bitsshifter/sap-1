# SAP-1 implementation in Verilog

### Inspiration
I started watching Ben Eater's videos about building an ASIC version of SAP-1 using components on a breadboard. During this same time, I learned about FPGAs and Verilog. So I thought the best way to learn a Verilog is to write a CPU (or something close) in it.
This is my first Verilog project, and there are so many concepts I still don't understand or didn't even hear of, so please contribute in any way. I like criticism.

### Structure
I know the project has a relatively large number of files. The reason behind it is because I wanted to break the project into smaller pieces so I could test each component more easily and learn how to properly structure Verilog project. Also, I think this makes it easier for someone to approach the project.

### Testing
I think the tests are right. This is what I need the most help with. I am not even sure if this implementation works. I mean, when adding two numbers, it gives the right result, but I am still not sure. The biggest problem I had was the syncronization of all components and testing implementation. Help on this part would be much appreciated, so please contribute.

### Usage
Files in the `tbs` directory are testbenchs. There is also a small script `test.sh` I used to test them individually. In the root of the project, there is a file called `cpu.v`. This file is the actual CPU, all components put together. To run the project, run the `run.sh` script. The script will output a `.vcd` file, which you can view in the GTKWave program to see the behavior of the CPU.


### Writing programs:
In order to write programs, you need to manually change the bit permutation (instructions) in the `memory.v` file. There is already an example program written in it. The table below represents the instruction set.

| **Mnemonic** |           **Description**           | **Opcode** |
|:------------:|:-----------------------------------:|:----------:|
|      LDA     |   Load from memory to accumulator   |    0000    |
|      ADD     |    Add from memory to accumulator   |    0001    |
|      SUB     |       Subtract from accumulator     |    0010    |
|      OUT     |    Output content of accumulator    |    1110    |
|      HLT     |                 Stop                |    1111    |

