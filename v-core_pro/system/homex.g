M400                    ; wait til stuff stops
M913 X30 Y30            ; drop motor currents to 30% 
M201 X1000 Y1000        ; reduce acceleration on X/Y to stop false triggers
M915 P0:1 S2 R0 F0 H400 ; both motors because corexy; Sensitivity 2, don’t take action, don’t filter, 400steps/sec
G91                     ; set relative
G1 Z5 F600 H2          ; clear the bed
G1 H1 X-400 F4000       ; move left 400mm, stopping at the endstop
G1 X20 F1200            ; move away from end
G1 Z-5 F600 H2
G90                     ; back to absolute positioning
M400                    ; wait again
M913 X100 Y100          ; motor currents back to 100%
M201 X3000 Y3000        ; reset acceleration on X/Y
M400
G0 X0 F3600             ; move to center of bed
