#!/bin/bash
echo "MODULE TESTING"
echo -n "Verilog module file path: "
read path

iverilog -o ${path::-5} $path
vvp ${path::-5}

gtkwave ${path::-5}.vcd

echo "Removing test files..."
sleep 1

rm ${path::-5}.vcd ${path::-5}

echo "Done"
