; homey.g
; called to home the Y axis

M400                   ; Wait for all moves to stop
G91                    ; Use relative moves
G1 H2 Y0.01            ; Move X a small amount to enable
M400                   ; Wait for all moves to stop
G4 P200                ; Delay to allow TMC to detect stopped state
M915 P1 S-10 H200 R0   ; Configure stall detect
M913 Y50               ; Lower X and Z power
G4 P200                ; Delay to ensure settings are made
G1 H2 Z5 F2500         ; Lift Z relative to current position
G1 H1 Y-5 F2000        ; Back away from endstop
M400                   ; Wait for all moves to stop
M915 P1 S-30 H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y230 F3600       ; Move towards endstop until it stalls
M400                   ; Wait for all moves to stop
M915 P1 S-10 H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y-10 F2000       ; Back away from endstop
M400                   ; Wait for all moves to stop
M915 P1 S-30 H200 R0   ; Configure stall detect
G4 P200                ; Delay to ensure settings are made
G1 H1 Y230 F2000       ; Move towards endstop until it stalls
M915 P1 S-10 H200 R0   ; Configure stall detect to be less sensitive
G1 Y-1 F1000           ; Move away from stop and clear stall
G1 H2 Z-5 F2500        ; Return Z to original position
M400                   ; Wait for all moves to stop
G90                    ; Absolute positioning
M913 Y100              ; Back to full power
M915 P1 S20 H200 R1    ; Report any stalls
