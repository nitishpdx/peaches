compile:
	vlib work
	vlog -source hdl/mWideSorter.sv hdl/mWideSorter_TB.sv hdl/nBitThermMinMax.sv hdl/ShiftReg.sv

run: compile
	vsim -c mWideSorter_TB -do run.do

runV:compile
	vsim  -vopt -voptargs="+acc" -debugdb mWideSorter_TB -do runV.do

shift:
	vlog -source hdl/ShiftReg.sv hdl/shifter_TB.sv
	vsim -c M

cell:
	vlog -source hdl/nBitThermMinMax.sv hdl/nBitThermMinMax_TB.sv
	vsim -c thermComp_TB
