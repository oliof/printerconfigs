
G1 X0 Y0 F6000 ; go to X=0 Y=0

M83 ; relative extrusion
G1 E-2 F3600 ; retract 2mm
G91 ; relative movement
G1 Z2 F500 ; raise head 2mm
G90 ; absolute movement
G1 S2 X-109 U134 F6000 ; park both heads

