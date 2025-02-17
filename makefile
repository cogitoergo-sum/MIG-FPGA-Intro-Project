# Makefile for Icarus Verilog (SystemVerilog)
SOURCES = mux.sv mux_tb.sv
TOPLEVEL = mux_tb   # top-level testbench module
TARGET = simv       # name of the compiled executable

.PHONY: all run clean

# Default target: compile
all: $(TARGET)

# Compile with iverilog
$(TARGET): $(SOURCES)
	iverilog -g2012 -o $(TARGET) -s $(TOPLEVEL) $(SOURCES)

# Run the simulation using vvp
run: $(TARGET)
	vvp $(TARGET)

# Clean up generated files
clean:
	rm -f $(TARGET) *.vcd

vcd: $(TARGET)
	vvp $(TARGET)
	gtkwave mux_tb.vcd

