; exit mirror mode

; in case we deactivate all tools, shutdown part cooling fans
if state.nextTool == -1
    M106 P0 S0
    M106 P2 S0
elif state.nextTool == 0
    M106 P2 S0
elif state.nextTool == 1
    M106 P0 S0
M400
G28 X    ; return toolheads to homing position
G28 U
; turn off mixing
M568 P2 S0
M400
; revert axis inversion
M579 U1