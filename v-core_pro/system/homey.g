M400                          ; wait til stuff stops
M915 P0:1 S2 R0 F0 H400       ; both motors because corexy; Sensitivity 2, don’t take action, don’t filter, 400steps/sec
M913 X30 Y30                  ; drop motor currents to 30%
M201 X1000 Y1000              ; reduce acceleration on X/Y to stop false triggers
G91                           ; set relative coordinates
G1 Z5 F600 H2                 ; clear the bed
G1 H1 Y400 F4000              ; move 400mm, stopping at the endstop
G0 Y-20 F1200                  ; move away from end
G1 Z-5 F600 H2                ; bed back to original height
G90                           ; back to absolute positioning
M400                          ; wait again
M913 X100 Y100                ; motor currents back to 100%
M201 X3000 Y3000              ; reset acceleration on X/Y
M400
G0 Y0                         ; move to center