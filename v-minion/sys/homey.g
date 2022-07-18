; minimal cartesian homey.g file.
G91                     ; relative moves
G0 H2 Z5                ; clear bed
G0 H1 Y-200 F3600       ; fast initial homing move
G4 P50                  ; short pause
G0 H2 Y10               ; back off from endstop
G0 H1 Y-15 F360         ; slow secondary homing move
G4 P50                  ; short pause
G0 Y5                   ; back off from endstop
G0 H2 Z-5               ; lower Z again
G90                     ; absolute moves
G0 Y0 F3600             ; move to origin coordinate