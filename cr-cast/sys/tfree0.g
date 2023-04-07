
; park tool 0
M400
M83 ; relative extruder movement
G1 E-2 F3600 ; retract 2mm
M106 S0           ; turn off our print cooling fan
G91 ; relative axis movement
G1 Z2 F500 ; up 2mm
G90 ; absolute axis movement
G1 H1 X-200 F6000 ; park the X carriage at endstop