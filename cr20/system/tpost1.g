M106 R3           ; restore print cooling fan speed
M116 P1           ; wait for tool 1 heaters to reach operating temperature
M83               ; relative extruder movement
G1 E0.5 F3600     ; extrude 0.5mm