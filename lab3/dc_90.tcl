#-------------------------------------------------------
#use
#dc_shell -f dc_90.tcl
#-------------------------------------------------------


#Path_RTL:Verilog放置的位置
#Path_Top:合成後report.txt檔案要放置的根位置
set Path_Top		"/home/VLSICAD33/CSE_CAD_VLSI/lab3"
set Path_RTL     	"/home/VLSICAD33/CSE_CAD_VLSI/lab3"

#合成完放置Report timing/area/power時的檔案 的資料夾路徑
sh  mkdir -p		$Path_Top/Report
set Path_Syn		$Path_Top/Report

#Report timing/area/power時的檔案名稱
set File_Name		"RGB2YUV"

#設定Top的module 名稱
set Top				"RGB2YUV"

#設定clk腳位和頻率
set Clk_pin			"clk"
set Clk_period		"5.0"

#設定90nm製程路徑
set search_path        "/cad/CBDK/CBDK_TSMC90GUTM_Arm_f1.0/CIC/SynopsysDC/db $search_path"


#設定90nm製程路徑檔，如果有memory compiler的檔案db檔的路徑，記得在這邊設定
set target_library     "typical.db slow.db fast.db"

set link_library  "* $target_library dw_foundation.sldb"
set symbol_library  "generic.sdb"
set synthetic_library  "dw_foundation.sldb"
set sh_source_uses_search_path true

set_host_options  	-max_cores 16

#-------------------------------------------------------
#Read File
#-------------------------------------------------------

#read_file -format verilog "$Path_RTL/*.v"

#讀.v檔，並設定top的module
analyze -format verilog -autoread $Path_RTL
elaborate $Top -architecture verilog -library WORK
current_design $Top

link

#-------------------------------------------------------
#Timing
#-------------------------------------------------------

create_clock -name $Clk_pin -period $Clk_period [get_ports  $Clk_pin]
set_dont_touch_network                  	[ find clock clk ]
set_fix_hold                            	[ find clock clk ]
set_ideal_network                 			[ find clock clk ]
#set_ungroup [get_cells u_relu] false 
#
#set_max_delay 5 -from [all_inputs] -to [all_outputs] #no clk

#set_clock_uncertainty     0.3           	[get_clocks $Clk_pin]
#set_clock_latency         0.5           	[get_clocks $Clk_pin]
#set_clock_transition      0.1           	[get_clocks $Clk_pin]
#set_input_transition      0.5           	[all_inputs]

# Setting Input Delay & Output Delay
# set_input_delay  [expr $Clk_period/4.0]  -clock $Clk_pin  [remove_from_collection [all_inputs] [get_ports $Clk_pin]]
# set_output_delay [expr $Clk_period/2.0]  -clock $Clk_pin  [all_outputs]


# Setting Input Delay & Output Delay
set_input_delay  0 -clock [get_clocks clk] [all_inputs]
set_output_delay 0 -clock [get_clocks clk] [all_outputs]

#-------------------------------------------------------
#Clock Gating
#-------------------------------------------------------

#replace_clock_gates
#report_clock_gating -gating_elements > $Path_Syn/${File_Name}_clock_gating_pre_syn.txt

#set_ideal_network [get_pins -hierarchical *main_gate/Z]

#-------------------------------------------------------
#RC Delay
#The value of R and C are defined by the IOPAD or the connected module.
#
#At first time of synthesis, set the RC to 0.
#After APR, you can get the precise value of RC.
#Finally, set the precise value of RC and redo synthesis and APR.
#-------------------------------------------------------

#set_driving 	0.0  	[get_ports $Clk_pin]
#set_driving 	0.0  	[remove_from_collection [all_inputs] [get_ports ${Clk_pin}]]
#set_load  		0.0		[all_outputs]

#-------------------------------------------------------
#Process Corner
#-------------------------------------------------------
#90nm
	#Min/Max Case
		set_operating_conditions -max slow -min fast
	#Single Case
		#set_operating_conditions

#-------------------------------------------------------
#wire load model
#-------------------------------------------------------

#set auto_wire_load_selection false
#remove_wire_load_model
#90nm
	set_wire_load_model -name tsmc090_wl10 -library slow

#-------------------------------------------------------
#Area
#-------------------------------------------------------

set_max_area 0

#-------------------------------------------------------
#Power
#-------------------------------------------------------

set_leakage_optimization true
set_dynamic_optimization true

#-------------------------------------------------------
#DRC
#-------------------------------------------------------

#set_max_fanout 6    [all_inputs]

#-------------------------------------------------------
#Other
#-------------------------------------------------------

#uniquify
#set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#check_timing > $Path_Syn/${File_Name}_check_timing.txt

#-------------------------------------------------------
#Compile
#-------------------------------------------------------
compile \
	-map_effort  	medium	\
	-area_effort 	high 	\
	-power_effort 	high	\
	-exact_map				\
	-boundary_optimization	
#	-map / area /power_effort 	high / medium / low / none
	#-auto_ungroup 	area 
#	-inc

#-------------------------------------------------------
#Report
#-------------------------------------------------------
	#Timing
		report_timing -path full -delay max -max_paths 1 -nworst 1 > $Path_Syn/${File_Name}_timing_90nm.txt
	#Ideal Network
		report_ideal_network > $Path_Syn/${File_Name}_ideal_network.txt
	#Area
		report_area -hier -nosplit > $Path_Syn/${File_Name}_area_90nm.txt
	#Power
		report_power -analysis_effort low > $Path_Syn/${File_Name}_power_90nm.txt
	#Clock Gating
	# 	report_clock_gating > $Path_Syn/${File_Name}_clock_gating_post_syn.txt
	# #Hvt Rvt
	# 	set_attribute [get_libs sc9_cln40g_base_rvt*] -type string default_threshold_voltage_group rvt
	# 	set_attribute [get_libs sc9_cln40g_base_hvt*] -type string default_threshold_voltage_group hvt
	# 	report_threshold_voltage_group -lvth_groups {se_rvt base_hvt} > $Path_Syn/${File_Name}_vt_ratio.txt
	# #Check Design
	# 	check_design > $Path_Syn/${File_Name}_check_design.txt
	# #Check Error
	# 	check_error > $Path_Syn/${File_Name}_check_error.txt

#-------------------------------------------------------
#Write out
#-------------------------------------------------------

# remove_unconnected_ports -blast_buses [get_cells -hierarchical *]

#set bus_inference_style {%s[%d]}
#set bus_naming_style {%s[%d]}
#set hdlout_internal_busses true
#change_names -hierarchy -rule verilog
#define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
#define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
#define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
#define_name_rules name_rule -case_insensitive
#change_names -hierarchy -rules name_rule

write -format ddc	   -hierarchy -output 	$Path_Syn/${File_Name}_syn.ddc
write -format verilog  -hierarchy -output 	$Path_Syn/${File_Name}_syn.v
write_sdf -version 2.1 						$Path_Syn/${File_Name}_syn.sdf
write_sdc									$Path_Syn/${File_Name}_SYN.sdc

exit  
