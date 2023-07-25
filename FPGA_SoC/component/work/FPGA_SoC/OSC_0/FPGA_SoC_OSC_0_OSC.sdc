set_component FPGA_SoC_OSC_0_OSC
# Microsemi Corp.
# Date: 2023-Jul-07 15:11:20
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
