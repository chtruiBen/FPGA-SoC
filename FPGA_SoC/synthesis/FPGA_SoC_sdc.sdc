# Written by Synplify Pro version mapact, Build 2172R. Synopsys Run ID: sid1688713901 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {FPGA_SoC_FCCC_0_FCCC|GL0_net_inferred_clock} [get_pins {FCCC_0/CCC_INST:GL0}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {FPGA_SoC_FCCC_0_FCCC|GL1_net_inferred_clock} [get_pins {FCCC_0/CCC_INST:GL1}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_0 [list FPGA_SoC_FCCC_0_FCCC|GL0_net_inferred_clock]
set Inferred_clkgroup_1 [list FPGA_SoC_FCCC_0_FCCC|GL1_net_inferred_clock]
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_1


# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 

# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

