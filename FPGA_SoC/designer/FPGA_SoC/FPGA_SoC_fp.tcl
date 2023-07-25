new_project \
         -name {FPGA_SoC} \
         -location {D:\GitHub\FPGA\FPGA_SoC\designer\FPGA_SoC\FPGA_SoC_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010T} \
         -name {M2S010T}
enable_device \
         -name {M2S010T} \
         -enable {TRUE}
save_project
close_project
