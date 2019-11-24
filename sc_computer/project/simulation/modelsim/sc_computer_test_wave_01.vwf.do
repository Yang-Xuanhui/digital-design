vlog -work work sc_computer_test_wave_01.vwf.vtvsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.sc_computer_vlg_vec_tst -voptargs="+acc"
add wave /*
run -all
