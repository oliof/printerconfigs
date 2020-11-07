M106 R2           ; restore print cooling fan speed
M116 P0           ; wait for tool 0 heaters to reach operating temperature
M83               ; relative extruder movement
G1 E0.5 F3600     ; extrude 2mm