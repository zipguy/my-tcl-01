
  #  zipguy - routine added for puts with date %Y-%m-%d and time 
proc puts_log {message {nr no} {pt pt}} {
	if {$nr == "nr"} {
		puts -nonewline " $message"
	} elseif {$pt == "pt" } {
		set time [clock format [clock seconds] -format "%Y-%m-%d %I:%M:%S %p"]
		puts "$time  $message" 
	} else {
		puts ""
	}
};# END-PROC
proc get_win { } {
	global winspecg winspecw
	set winspecg "[wm geometry .]"
	puts_log "winspecg is: $winspecg"
	set winspecw $winspecg
};# END-PROC
proc set_win { } {
	global winspecw
	wm geometry . $winspecw
	puts_log "winspecw is: $winspecw"
};# END-PROC
proc get_geo { } {
	global geospecc geospecw
	after 20 {
		set geospecc [ console eval {wm geometry .}]
		puts_log "geospecc is: $geospecc"
		set geospecw $geospecc
	}
};# END-PROC
proc set_geo { } {
	global geospecw 
	console eval [list wm geometry . $geospecw]
	puts_log "geospecw is: $geospecw"
};# END-PROC

	wm title . "Geometry"
	wm minsize . 300 0

	set winspecg "Unset"
	set winspecw "Unset"
	set geospec  "Unset"
	set geospecc "Unset"
	set geospecg "Unset"
	set geospecw "Unset"
#	get_geo

	set f .buttons0
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	button $f.l1    \
		-text "Exit"  \
		-command "destroy ." \
		-anchor s  -justify left
	pack $f.l1   -side right
	button $f.l0       \
		-text " Show Console "  \
		-command "console show" \
		-anchor w  -justify left
	pack $f.l0   -side right
	
	set f .buttons2
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	label $f.l02       \
		-text "You can Get (or Set) the Console's Geometry"  \
		-anchor w  -justify left -bg AliceBlue
	pack $f.l02   -side left -fill x -expand 1
	
	set f .buttons3
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	button $f.l1       \
		-text "Get Console Geometry"  \
		-command "get_geo" \
		-anchor w  -justify left
	pack $f.l1   -side left
	
	entry $f.l2       \
		-textvariable geospecc  \
		-justify left
	pack $f.l2   -side left
	
	set f .buttons4
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	button $f.l3       \
		-text "Set Console Geometry"  \
		-command "set_geo" \
		-anchor w  -justify left
	pack $f.l3   -side left

	entry $f.l4       \
		-textvariable geospecw  \
		-justify left
	pack $f.l4   -side left
	
	set f .buttons1a
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	label $f.l02       \
		-text "and you can Get (or Set) the Window's Geometry"  \
		-anchor w  -justify left
	pack $f.l02   -side left -fill x -expand 1
	
	set f .buttons1
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	button $f.l01       \
		-text "Get Window\'s geometry"  \
		-command "get_win" \
		-anchor w  -justify left
	pack $f.l01   -side left -fill x
	entry $f.l02       \
		-textvariable winspecg  \
		-justify left
	pack $f.l02   -side left
	
	set f .buttons1b
	frame $f -relief raised -borderwidth 1 -width 800
	pack $f\
		-side top -fill x -pady 0m 
	button $f.l01       \
		-text "Set Window\'s geometry"  \
		-command "set_win" \
		-anchor w  -justify left
	pack $f.l01   -side left -fill x
	entry $f.l02       \
		-textvariable winspecw  \
		-justify left
	pack $f.l02   -side left
		
	update idletasks
	focus .buttons4.l4
	focus .
	puts "geospecg is: $geospecg"

# console eval [ after idle {return }]
# console eval [ set a [list wm geometry .]]
# console eval {[consoleinterp [list set $geospec {$a}]]}

