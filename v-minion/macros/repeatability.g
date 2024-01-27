G0 X0 Y0 Z10 F3000

while iterations < 9
  G30 X0 Y0 Z-9999 P{iterations}
G30 X0 Y0 Z-9999 P9 S-1