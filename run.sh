#!/bin/bash

iverilog -o cpu cpu.v
vvp cpu

gtkwave cpu.vcd

echo "Done"
