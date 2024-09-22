#!/bin/bash

ghdl -a sram.vhd

ghdl -a sram_tb.vhd

ghdl -e sram_tb

ghdl -r sram_tb --vcd=waveform.vcd

gtkwave waveform.vcd


