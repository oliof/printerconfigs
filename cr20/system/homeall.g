; homeall.g
; called to home all axes
G91                           ; relative positioning
G1 Z4 F120 H2                 ; clear bed
G1 S1 X-225 Y-225 U300 F1800  ; move quickly to X,Y and U axis endstops and stop there (first pass)
G1 X5 Y5 F6000                ; go back a few mm
G1 S1 X-225 Y-225 F360        ; move slowly to X, Y and U axis endstops once more (second pass)
G1 S1 Z-225 F120              ; move quickly to Z axis endstop and stop there (first pass)
G1 Z5 F1800                   ; go back a few mm
G1 S1 Z-225 F60               ; move slowly to Z axis endstop once more (second pass)
G1 Z5 F420                   ; clear bed
G1 S1 U240 F1800              ; move quickly to U axis endstop and stop there (first pass)
G1 U-5 F6000                  ; go back a few mm
G1 S1 U240 F360               ; move slowly to U axis endstop once more (second pass)
G1 S1 U240 F360
G90                           ; absoute position
G0 X0 Y0 U163 Z10 F2400        ; start position: X, Y at 0 point, U out of the way, some distance to the bed