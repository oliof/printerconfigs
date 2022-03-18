; RRF 3.x config for CR20 IDEX - dual independent Z
	
; General preferences
M451                                      ; Enable FFF mode
G90                                       ; Send absolute coordinates...
M83                                       ; ...but relative extruder moves

; Network
M550 P"CRIDEX-CUB"                                   ; Set machine name -- CR20 with IDEX and Bear style mods
M552 S1                                              ; Enable network
M586 P0 S1                                           ; Enable HTTP
M586 P1 S0                                           ; Disable FTP
M586 P2 S0                                           ; Disable Telnet

; Drives 
M569 P0 S0                                           ; Physical drive 0 goes forwards (U)
M569 P1 S1                                           ; Physical drive 1 goes forwards (Y)
M569 P2 S0                                           ; Physical drive 2 goes backwards (X)
M569 P3 S0                                           ; Physical drive 3 goes backwards (Z left)
M569 P4 S0                                           ; Physical drive 4 goes backwards (Z right)
M569 P5 S1                                           ; Physical drive 5 goes forwards (E0)
M569 P6 S1                                           ; Physical drive 6 goes backwards (E1)

M584 X2 Y1 Z3:4 U0 E5:6                              ; X Y Z:Z U E0:E1
M906 X800 Y800 Z800 U800 E1300:1300 I30              ; Set motor currents (mA) and motor idle factor in per cent

M350 X16 Y16 U16 Z16 E16 I1                          ; Configure microstepping with interpolation
M92 X80.00 Y80.00 U80 Z1600.00 E830:690              ; Set steps per mm
M566 X360.00 Y360.00 Z18 E300.00 P1                  ; Set maximum instantaneous speed changes (mm/min)
; M205 X6 Y6 U6 Z0.3 E5                                ; Set maximum instantaneous speed changes (mm/sec), lifted from Marlin
M203 X9000.00 Y9000.00 U9000.00 Z600.00 E6000.00     ; Set maximum speeds (mm/min)
M201 X7500.00 Y7500.00 U7500.00 Z100.00 E6000.00     ; Set accelerations (mm/s^2)
M204 P20000 T20000                                   ; Set print and travel acceleration maximums
M84 S30                                              ; Set idle timeout

; Axis Limits
M208 X-110:105 Y-110:110 U-49:164.95 Z0:240    

; Endstops  
M574 X1 S1 P"io0.in"
M574 Y1 S1 P"io1.in"                                    
M574 Z1 S1 P"!io2.in"
M574 U2 S1 P"io3.in"

; Thermistors
M308 S0 P"temp0" Y"thermistor" A"bed" T100000 B3950  
M308 S1 P"temp1" Y"thermistor" A"left" B4725 C7.06e-8
M308 S2 P"temp2" Y"thermistor" A"right" B4725 C7.06e-8

; Heaters
M950 H0 C"OUT0" T0                                   ; heater 0 uses the OUT0 pin, sensor 0
M950 H1 C"OUT1" T1                                   ; heater 1 uses the OUT2 pin and sensor 1
M950 H2 C"OUT2" T2                                   ; heater 2 uses the OUT2 pin and sensor 2

; Fans
M950 F0 C"OUT6"                                      ; x part cooling fan
M950 F1 C"OUT5"                                      ; x heatsink fan
M950 F2 C"OUT4"                                      ; u part cooling fan
M950 F3 C"OUT3"                                      ; u heatsink fan
  
M106 P0 C"left part fan" H-1 S0 Q100                 ; part cooling fan is not thermostatically controlled
M106 P1 C"left head fan" H1 T45 Q100                 ; print head fan is thermostatically controlled
M106 P2 C"right part fan" H-1 S0                     ; part cooling fan is not thermostatically controlled
M106 P3 C"right head fan" H2 T45                     ; print head fan is thermostatically controlled


; Bed and tools
M140 H0                                              ; bed heater
; first toolhead (left)
M563 P0 S"left"  D0 H1 X0 F0                         ; first tool, X head
G10 P0 X0 Y0 Z0 S0 R0                                ; set tool 0 offsets and temperatures
; second toolhead (right)
M563 P1 S"right"  D1 H2 X3 F2                        ; second tool, U head
G10 P1 58.5 X61 Y-7.9  Z0 S0 R0                      ; tool offsets
; -- copy mode
M563 P2 S"copy mode"  D0:1 H1:2 X0:3 F0:2            ; tool for copy mode
G10 P2 X85 Y0 U61 S0 R0                              ; tool offsets for copy mode
M567 P2 E1:1                                         ; set mix ratio 100% on both extruders for copy mode
; -- mirror mode 
M563 P3 S"mirror mode" D0:1 H1:2 X0:3 F0:2           ; tool for mirror mode
G10 P3 X60 Y0 U-61 S0 R0                             ; tool offset for mirror mode (flipped X offset)
M567 P3 E1:1                                         ; set mix ratio 100% on both extruders for mirror mode


; temperature limits
M143 H0 S115
M143 H1 S290
M143 H2 S290

; enable display

M918 P2 E-4
G4 S1  ; pause
M918 P2 E-4
M150 X2 R255 U255 B255 S3 ; set all 3 LEDs to white

; PID tune
M501