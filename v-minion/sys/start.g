if !move.axes[0].homed || !move.axes[1].homed
   echo "X and/or Y axes not homed, homing"
   G28 ; home only if needed

G90    ; absolute moves, just to make sure
G4 P1  ; wait a second
G29 S1 ; load mesh
echo "continuing with slicer start gcode"