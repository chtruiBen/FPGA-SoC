set_device \
    -family  SmartFusion2 \
    -die     PA4M1000 \
    -package vf256 \
    -speed   -1 \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def USE_TCGEN 1
set_def NETLIST_TYPE EDIF
set_name FPGA_SoC
set_workdir {D:\GitHub\FPGA\FPGA_SoC\designer\FPGA_SoC}
set_log     {D:\GitHub\FPGA\FPGA_SoC\designer\FPGA_SoC\FPGA_SoC_sdc.log}
set_design_state pre_layout
