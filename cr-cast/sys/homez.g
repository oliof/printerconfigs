; homez.g
; called to home the Z axis

G91               ; relative positioning
G1 H1 Z-225 F600  ; move quickly to X axis endstop and stop there (first pass)
G1 Z5 F600 H2     ; go back a few mm
G1 H1 Z-225 F120   ; move slowly to X axis endstop once more (second pass)
G90               ; absolute positioning
G0 Z5 F600        ; move up a bit  