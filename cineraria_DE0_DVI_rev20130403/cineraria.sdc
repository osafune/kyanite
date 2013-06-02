###########################################################################
#
# Generated by : Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Full Version
#
# Project      : cineraria
# Revision     : cineraria
#
# Date         : Sun Aug 21 07:38:00 JST 2011
#
###########################################################################
 
 
# WARNING: Expected ENABLE_CLOCK_LATENCY to be set to 'ON', but it is set to 'OFF'
#          In SDC, create_generated_clock auto-generates clock latency
#
# ------------------------------------------
#
# Create generated clocks based on PLLs
derive_pll_clocks -use_tan_name
#
# ------------------------------------------


# Original Clock Setting Name: CLOCK_50_2
create_clock -period "20.000 ns" \
             -name {CLOCK_50_2} {CLOCK_50_2}
# ---------------------------------------------


# Original Clock Setting Name: CLOCK_50
create_clock -period "20.000 ns" \
             -name {CLOCK_50} {CLOCK_50}
# ---------------------------------------------

# ** Clock Latency
#    -------------

# ** Clock Uncertainty
#    -----------------

# ** Multicycles
#    -----------

# ** Cuts
#    ----

# ** Input/Output Delays
#    -------------------




# ** Tpd requirements
#    ----------------

# ** Setup/Hold Relationships
#    ------------------------

# ** Tsu/Th requirements
#    -------------------
# QSF: -name TSU_REQUIREMENT 0.7 ns -from * -to *
set_max_delay 0.7 -from [get_ports *] -to [get_registers {DRAM_DQ*}]

# QSF: -name TH_REQUIREMENT 0 ns -from * -to *
set_min_delay 0.0 -from [get_ports *] -to [get_registers {DRAM_DQ*}]

# ** Tco/MinTco requirements
#    -----------------------
# --------------
# Represent unkown external clock as N/C (Not a Clock)
create_clock -name "N/C" -period 10.0
# --------------
# QSF: -name TCO_REQUIREMENT 7.2 ns -from * -to DRAM_*
set_output_delay 0.0 -clock "N/C" [get_ports {DRAM_*}]
set_max_delay 7.2 -from [get_keepers *] -to [get_ports {DRAM_*}]



# ---------------------------------------------
# The following clock group is added to try to 
# match the behavior of:
#   CUT_OFF_PATHS_BETWEEN_CLOCK_DOMAINS = ON
# ---------------------------------------------

#set_clock_groups -asynchronous \
#	-group { \
#		avpll:inst_avpll|altpll:altpll_component|avpll_altpll:auto_generated|wire_pll1_clk[0] \
#		avpll:inst_avpll|altpll:altpll_component|avpll_altpll:auto_generated|wire_pll1_clk[1] \
#		CLOCK_50 \
#	} \
#	-group { \
#		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[0] \
#		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[1] \
#		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[2] \
#		CLOCK_50_2 \
#	}

set_clock_groups -asynchronous \
	-group { \
		avpll_xga:inst_avpll|altpll:altpll_component|avpll_xga_altpll:auto_generated|wire_pll1_clk[0] \
		avpll_xga:inst_avpll|altpll:altpll_component|avpll_xga_altpll:auto_generated|wire_pll1_clk[1] \
		CLOCK_50 \
	} \
	-group { \
		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[0] \
		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[1] \
		syspll:inst_syspll|altpll:altpll_component|syspll_altpll:auto_generated|wire_pll1_clk[2] \
		CLOCK_50_2 \
	}


# ---------------------------------------------

