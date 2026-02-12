# run.do - ModelSim script (optional)
vlib work
vmap work work
vlog lfsr.v cipher.v tb_cipher.v
vsim -voptargs=+acc work.tb_cipher
add wave -r /*
run 200 ns
