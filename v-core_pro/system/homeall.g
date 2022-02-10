; enable the following two lines for stealthchop tuning
M17 X Y Z               ; enable XYZ motors
G4 P150                 ; wait 150ms

M400                    ; wait til stuff stops
M913 X30 Y30            ; drop motor currents to 30% 
M201 X1000 Y1000        ; reduce acceleration on X/Y to stop false triggers
M915 P0:1 S2 R0 F0 H400 ; both motors because corexy; Sensitivity 2, don’t take action, don’t filter, 400steps/sec
G91                     ; set relative
G1 Z5 F600 H2           ; clear the bed
G1 H1 X-400 F4000       ; move left 400mm, stopping at the endstop
G1 X120 F1200           ; move away from end
G1 H1 Y400 F4000        ; move 400mm, stopping at the endstop
G0 Y-20 F1200           ; move away from end
G90                     ; back to absolute positioning
M400                    ; wait again
M913 X100 Y100          ; motor currents back to 100%
G0 X0 Y0 F3600          ; move to center of bed
G1  X30 Y37 F1200       ; go to first probe point
G30                     ; home Z by probing the bed
M201 X3000 Y3000        ; reset acceleration on X/Y


; Uncomment the following lines to lift Z after probing
G91                    ; relative positioning
G1 Z5 F480             ; lift Z relative to current position
G90                    ; absolute positioning

