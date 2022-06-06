; homey.g
; called to home the Y axis

; re-read variables
M98 P"0:/sys/variables"

var sensitivity = 10
var stealthchop_switchover = 60
G91 ; relative moves
M569 P1 V{var.stealthchop_switchover} D3
M913 Y40               ; Lower Y power
M18 Y                  ; Disable stepper
;  Delay to ensure settings are made
G1 H2 Z5 F2500         ; Lift Z relative to current position
G1 H1 Y-5 F2000        ; Back away from endstop
M400                   ; Wait for all moves to stop
M915 P1 S{var.sensitivity}  H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y-2 F600         ; tuning move
G1 H1 Y230 F3600       ; Move towards endstop until it stalls
M400                   ; Wait for all moves to stop
M915 P1 S{var.sensitivity}  H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y-10 F2000       ; Back away from endstop
M400                   ; Wait for all moves to stop
M915 P1 S{var.sensitivity}  H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y230 F2000       ; Move towards endstop until it stalls
M915 P1 S{var.sensitivity}  H200 R0   ; Configure stall detect to be less sensitive
G1 Y-1 F1000           ; Move away from stop and clear stall
G1 H2 Z-5 F2500        ; Return Z to original position
M400                   ; Wait for all moves to stop
M569 P1 V2000 D2       ; Reset to early spreadcycle switching
G90                    ; Absolute positioning
M913 Y100              ; Back to full power
M915 P1 {var.sensitivity+10}  H200 R1    ; Report any stalls
