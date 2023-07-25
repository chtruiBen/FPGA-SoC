open_project -project {D:\GitHub\FPGA\FPGA_SoC\designer\FPGA_SoC\FPGA_SoC_fp\FPGA_SoC.pro}
set_programming_file -name {M2S010T} -file {D:\GitHub\FPGA\FPGA_SoC\designer\FPGA_SoC\FPGA_SoC.ipd}
enable_device -name {M2S010T} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010T} 
run_selected_actions
set_programming_file -name {M2S010T} -no_file
save_project
close_project
