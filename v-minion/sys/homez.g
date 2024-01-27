; homez.g
; called to home the Z axis
; set z probe values for homing z

; re-read variables
M98 P"0:/sys/variables"

G91                ; relative positioning
G1 H2 Z5  F1200    ; lift Z relative to current position
G90                ; absolute positioning
; G1 X{global.x_axis_min+5+(-global.probe_x_offset)} Y{global.y_axis_min+5+(-global.probe_y_offset)} F7200 ; go to first probe point
G1 X{-5-global.probe_x_offset} Y{-5-global.probe_y_offset} F7200
G30                ; home Z by probing the bed

G91               ; relative positioning
G1 Z{5-sensors.probes[0].triggerHeight} F600        ; lift Z relative to current position
G90               ; absolute positioning