G91          ; relative position
G0 Z5        ; lift print head(s)
G90          ; absolute position
G0 Y110      ; present print
G28 XU       ; home print head(s)
T-1          ; deselect print head(s)
M140 S-273.1 ; disable bed heater