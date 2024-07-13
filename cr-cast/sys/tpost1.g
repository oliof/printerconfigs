; after enabling tool 1, prepare toolhead to continue printing
M400
M116 P1           ; wait for tool 1 heaters to reach operating temperature
M83               ; relative extruder movement
G1 E0.5 F3600     ; extrude 0.5mm
M400
G1 R2 X0 Y0 Z2    ; restore position 2mm above
G1 R2 X0 Y0 Z0    ; restore position
M106 R2           ; restore print cooling fan speed
M400