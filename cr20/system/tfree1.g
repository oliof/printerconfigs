M83 ; relative extruder movement
G1 E-2 F3600 ; retract 2mm
M106 S0           ; turn off our print cooling fan
G91 ; relative axis movement
G1 Z3 F500 ; up 3mm
G90 ; absolute axis movement
G1  U162 F6000 ; park the U carriage at +134mm