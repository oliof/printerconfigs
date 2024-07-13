G91
G1 H1 X-300 F3600 ; move quickly to X axis endstop and stop there (first pass)
G1 X4 F6000       ; go back a few mm
G1 H1 X-300 F360  ; move slowly to X axis endstop once more (second pass)
G90