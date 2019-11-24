onerror {exit -code 1}
vlib work
vlog -work work sc_computer.vo
vlog -work work sc_computer_test_wave_01.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.sc_computer_vlg_vec_tst -voptargs="+acc"
vcd file -direction sc_computer.msim.vcd
vcd add -internal sc_computer_vlg_vec_tst/*
vcd add -internal sc_computer_vlg_vec_tst/i1/*
run -all
quit -f
