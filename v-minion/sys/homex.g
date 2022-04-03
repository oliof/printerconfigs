; homex.g
; called to home the X axis

var sensitivity=-16
var stealthchop_switchover=60
M569 P0 V{var.stealthchop_switchover} D3
M18 X                  ; Disable stepper
M400                   ; Wait for all moves to stop
G91                    ; Use relative moves
G1 H2 X0.1             ; Move X a small amount to enable
M400                   ; Wait for all moves to stop
G4 P100                ; Delay to allow TMC to detect stopped state
M913 X40               ; Limit X motor power to avoid destructive behavior if stall doesn't trigger
G4 P200                ; Delay to ensure settings are made
G1 H2 Z5 F2500         ; Lift Z relative to current position
G1 H2 X-5 F2000        ; Back away from endstop
M400                   ; Wait for all moves to stop
M915 P0 S{var.sensitivity} H200 R0 F0  ; Configure stall detect
G4 P100                ; Delay to ensure settings are made
G1 H1 X200 F3600       ; Move to end of axis
G1 X-1 F3000           ; Move away from stop and clear stall
G1 H2 Z-5 F2500        ; Return Z to original position
M400                   ; Wait for all moves to stop
M569 P0 V2000 D2       ; return to early spreadcycle switchover
G90                    ; Absolute positioning
M913 X100              ; Back to full power
M915 P0 S{var.sensitivity+40} H200 R1    ; Report any stalls