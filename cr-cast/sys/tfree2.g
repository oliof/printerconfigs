M83          ; relative extruder movement
G1 E-2 F3600 ; retract 2mm
; in case we deactivate all tools, shutdown part cooling fans
if state.nextTool == -1
    M106 P0 S0
    M106 P2 S0
if state.nextTool == 0
    M106 P2 S0
if state.nextTool == 1
    M106 P0 S0
    
M400
G91          ; relative axis movement
G1 Z3 F500   ; up 3mm
G90          ; absolute axis movement
;G28 XU      ; park the X and U carriages
; reset offsets

G0 H2 X-43 F6000
G0 H2 U270 F6000
; turn off mixing
M400
M568 P2 S0
M400
echo "tfree 2 end"