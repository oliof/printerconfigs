M106 R2           ; restore print cooling fan speed
M116 P1           ; wait for tool 1 heaters to reach operating temperature
M83               ; relative extruder movement
G1 E2 F3600       ; extrude 2mm
G1 R2 X0 Y0 Z2    ; restore position 2mm above
G1 R2 X0 Y0 Z0    ; restore position 