if (move.axes[0].homed && move.axes[1].homed && move.axes[2].homed && move.axes[3].homed)
  echo "already homed, skipping" 
else
  G91 
  G0 H2 X5 Y5 U-5 Z5             ; back off from endstops just in case
  G0 H1 X-250 Y-250 U+250 F1800  ; home X,Y,U at the same time
  G0 H2 X5 Y5 U-5                ; back off from endstops
  G0 H1 X-250 Y-250 U+250 F360   ; rehome X,Y,U slowly for accuracy
  G1 H1 Z-225 F120  ; move quickly to Z axis endstop and stop there (first pass)
  G1 H2 Z5 F600     ; go back a few mm
  G1 H1 Z-225 F60   ; move slowly to Z axis endstop once more (second pass)
  G90
  G0 Z5