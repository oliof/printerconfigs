; homez.g
; called to home the Z axis
; set z probe values for homing z
M558 P5 C"!^e0stop" H20 F600 T6000 
G31 P500 X{global.probe_x_offset} Y{global.probe_y_offset} Z{global.probe_z_offset}

G91                ; relative positioning
G1 H2 Z5  F6000    ; lift Z relative to current position
G90                ; absolute positioning
G1 X{global.x_axis_min+5+(-global.probe_x_offset)} Y{global.y_axis_min+5+(-global.probe_y_offset)} F7200 ; go to first probe point
G30                ; home Z by probing the bed

G91               ; relative positioning
G1 Z5-{sensors.probes[0].triggerHeight} F600        ; lift Z relative to current position
G90               ; absolute positioning
