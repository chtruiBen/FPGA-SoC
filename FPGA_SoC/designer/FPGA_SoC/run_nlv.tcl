# Netlist Viewer TCL File
set_family -name SmartFusion2
top_module -name FPGA_SoC
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/work/FPGA_SoC/FCCC_0/FPGA_SoC_FCCC_0_FCCC.v}
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/work/FPGA_SoC_MSS/FPGA_SoC_MSS_syn.v}
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/work/FPGA_SoC_MSS/FPGA_SoC_MSS.v}
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/Actel/SgCore/OSC/2.0.101/osc_comps.v}
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/work/FPGA_SoC/OSC_0/FPGA_SoC_OSC_0_OSC.v}
addfile -view RTL -lib work -type VLOG -mode verilog_2k -name {D:/GitHub/FPGA/FPGA_SoC/component/work/FPGA_SoC/FPGA_SoC.v}
addfile -view HIER -lib work -type EDIF -mode NONE -name {D:/GitHub/FPGA/FPGA_SoC/synthesis/FPGA_SoC.edn}
addfile -view FLAT -lib work -type AFL -mode NONE -name {D:/GitHub/FPGA/FPGA_SoC/designer/FPGA_SoC/FPGA_SoC.afl}