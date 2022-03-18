G91               ; relative positioning
G1 H1 X-225 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000       ; go back a few mm
G1 H1 X-225 F360  ; move slowly to X axis endstop once more (second pass)
G90               ; absolute positioning