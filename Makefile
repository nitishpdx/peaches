run:
	vlib work
	vlog -source hdl/mWideSorter_TB.sv hdl/mWideSorter.sv hdl/nBitThermMinMax.sv hdl/ShiftReg.sv
	vsim -c mWideSorter_TB -do run.do
