onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label N /mWideSorter_TB/sort/N
add wave -noupdate -label M /mWideSorter_TB/sort/M
add wave -noupdate -label CLK /mWideSorter_TB/sort/Clk
add wave -noupdate -label X -expand /mWideSorter_TB/sort/X
add wave -noupdate -label Y -expand /mWideSorter_TB/sort/Y
add wave -noupdate -label RowWire /mWideSorter_TB/sort/RowWire
add wave -noupdate -label ColWire /mWideSorter_TB/sort/ColWire
add wave -noupdate -expand -group {OutPipe Y[4]} -label CLK {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYMin/Clk}
add wave -noupdate -expand -group {OutPipe Y[4]} -label SI {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYMin/SI}
add wave -noupdate -expand -group {OutPipe Y[4]} -label SO {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYMin/SO}
add wave -noupdate -expand -group {OutPipe Y[4]} -label SR {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYMin/temp}
add wave -noupdate -expand -group {OutPipe Y[3]} -label SI {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYAlmostMin/SI}
add wave -noupdate -expand -group {OutPipe Y[3]} -label SO {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYAlmostMin/SO}
add wave -noupdate -expand -group {OutPipe Y[3]} -label SR {/mWideSorter_TB/sort/genblk1[3]/genblk1[3]/genblk2/genblk1/OutDelayYAlmostMin/temp}
add wave -noupdate -expand -group {OutPipe Y[2]} -label SI {/mWideSorter_TB/sort/genblk1[3]/genblk1[2]/genblk2/genblk1/OutDelay/SI}
add wave -noupdate -expand -group {OutPipe Y[2]} -label SO {/mWideSorter_TB/sort/genblk1[3]/genblk1[2]/genblk2/genblk1/OutDelay/SO}
add wave -noupdate -expand -group {OutPipe Y[2]} -label SR {/mWideSorter_TB/sort/genblk1[3]/genblk1[2]/genblk2/genblk1/OutDelay/temp}
add wave -noupdate -expand -group {OutPipe Y[1]} -label SI {/mWideSorter_TB/sort/genblk1[3]/genblk1[1]/genblk2/genblk1/OutDelay/SI}
add wave -noupdate -expand -group {OutPipe Y[1]} -label SO {/mWideSorter_TB/sort/genblk1[3]/genblk1[1]/genblk2/genblk1/OutDelay/SO}
add wave -noupdate -expand -group {OutPipe Y[1]} -label SR -radix unsigned {/mWideSorter_TB/sort/genblk1[3]/genblk1[1]/genblk2/genblk1/OutDelay/temp}
add wave -noupdate -expand -group {OutPipe Y[0]} -label SI {/mWideSorter_TB/sort/genblk1[3]/genblk1[0]/genblk2/genblk1/OutDelay/SI}
add wave -noupdate -expand -group {OutPipe Y[0]} -label SO {/mWideSorter_TB/sort/genblk1[3]/genblk1[0]/genblk2/genblk1/OutDelay/SO}
add wave -noupdate -expand -group {OutPipe Y[0]} -label SR {/mWideSorter_TB/sort/genblk1[3]/genblk1[0]/genblk2/genblk1/OutDelay/temp}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 162
configure wave -valuecolwidth 179
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1102500 ps}
