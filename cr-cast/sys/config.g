; RRF 3.x config for CR20 IDEX - dual independent Z
	
; General preferences
M451                                                 ; Enable FFF mode
G90                                                  ; Send absolute coordinates...
M83                                                  ; ...but relative extruder moves

G4 P5000                                             ; allow 5 seconds for CAN to settle

; Network
M550 P"CR-CAST"                                      ; Set machine name -- CR20 with IDEX and Bear style mods
M552 S1                                              ; Enable network
M586 P0 S1                                           ; Enable HTTP
M586 P1 S0                                           ; Disable FTP
M586 P2 S0                                           ; Disable Telnet

; Drives 
; M569 P0 S1                                           ; Physical drive 0 goes forwards (U)
M569 P1 S1                                           ; Physical drive 1 goes forwards (Y)
M569 P2 S0                                           ; Physical drive 2 goes backwards (X)
M569 P3 S0                                           ; Physical drive 3 goes backwards (Z left)
M569 P4 S0                                           ; Physical drive 4 goes backwards (Z right)
M569 P20.0 S1                                        ; Physical drive 5 goes forward (E0, rrf36)
M569 P21.0 S1                                        ; Physical drive 6 goes backwards (E1)

M584 X1 Y2 Z3:4 U0 E20.0:21.0                        ; X Y Z:Z U E0:E1
M906 X1200 Y1200 Z800 U1200 E600:600 I30             ; Set motor currents (mA) and motor idle factor in per cent

M350 X16 Y16 U16 Z16 E16 I1                          ; Configure microstepping with interpolation
M92 X80.00 Y80.00 U80 Z1600.00 E631:631              ; Set steps per mm
M566 X210.00 Y210.00 U210.00 Z18 E300.00 P1                  ; Set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 U9000.00 Z600.00 E6000.00     ; Set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 U3000.00 Z100.00 E3000.00     ; Set accelerations (mm/s^2)
                                             ; Set idle timeout

; Axis Limits
M208 X-43:210 Y-110:110 U30:269 Z0:170         ; axis limits. Limit Z due to tall direct extruder.      

; Endstops  
M574 X1 S1 P"^20.io1.in"                             ; X endstop connected to Z probe port on toolboard
M574 Y1 S1 P"io4.in"                             
M574 Z1 S1 P"!io5.in+!io6.in"
M574 U2 S1 P"^21.io1.in"                             ; U endstop connected to Z probe port on toolboard

; Thermistors
M308 S0 P"temp0" Y"thermistor" A"Bed" T100000 B3950  
M308 S1 P"20.temp0" Y"thermistor" A"Left" B4725 C7.06e-8
M308 S2 P"21.temp0" Y"thermistor" A"Right" B4725 C7.06e-8

; Heaters
M950 H0 C"out0" T0                                   ; heater 0 uses the OUT0 pin, sensor 0
M950 H1 C"20.out0" T1                                ; heater 1 uses the out0 pin and temp0 on the toolboard #124
M950 H2 C"21.out0" T2                                ; heater 2 uses the out0 pin and remp0 on the toolboard #125

M307 H1 B0 S1.0
M307 H2 B0 S1.0


; Temperature limits
M143 H0 S115
M143 H1 S290
M143 H2 S290

; Fans
M950 F0 C"20.out1"                                   ; x part cooling fan
M950 F1 C"20.out2"                                   ; x heatsink fan
M950 F2 C"21.out1"                                   ; u part cooling fan
M950 F3 C"21.out2"                                   ; u heatsink fan
  
M106 P0 C"left part fan" H-1 S0                      ; part cooling fan is not thermostatically controlled
M106 P1 C"left head fan" H1 T45                      ; print head fan is thermostatically controlled
M106 P2 C"right part fan" H-1 S0                     ; part cooling fan is not thermostatically controlled
M106 P3 C"right head fan" H2 T45                     ; print head fan is thermostatically controlled


; Bed and tools
M140 H0                                              ; bed heater
; first toolhead (left)
M563 P0 S"left"  D0 H1 X0 F0                         ; first tool, X head
G10 P0 X0 Y0 Z0 S0 R0                                ; set tool 0 offsets and temperatures

; second toolhead (right)
M563 P1 S"right"  D1 H2 X3 F2                        ; second tool, U head
G10 P1 X0 Y0 Z0 S0 R0                                ; tool offsets

; -- copy mode
M563 P2 S"copy mode"  D0:1 H1:2 X0:3 F0:2            ; tool for copy mode, filament drives 0 and 1, heaters 1 and 2, fans 0 and 2
G10 P2 X5 Y0 U-105 S0 R0                             ; tool offsets for copy mode
M567 P2 E1:1                                         ; set mix ratio 100% on both extruders for copy mode

; -- mirror mode 
M563 P3 S"mirror mode" D0:1 H1:2 X0:3 F0:2           ; tool for mirror mode
G10 P3 X0 Y0 U-215 S0 R0                           ; tool offset for mirror mode (flipped X offset)
M567 P3 E1:1                                         ; set mix ratio 100% on both extruders for mirror mode


; Firmware Retract

M207 S1 F3000

; Pressure Advance
M572 D0 S0.02
;M572 D1 S0.02


; Toolboard accelerometer

M955 P20.0 I12
M593 P"ZVD" F74 S0

; Toolboard and Mainboard temp sensors

M308 S3 P"20.temp1" Y"thermistor" A"Left Toolboard" T100000 B4092
M308 S4 P"21.temp1" Y"thermistor" A"Right Toolboard" T100000 B4092
M308 S5 Y"mcu-temp" A"MCU" ; configure sensor 3 as on-chip MCU temperature sensor


; enable display

M98 P"0:/macros/enable-display.g"

; MFM filament sensor

M591 D0 P3 C"20.io2.in" S0

; PID tune values in config-override.g
M501

; Scanning Z Probe -- DIY Sammy C21 and LDC1612

 M558 K0 P11 C"120.i2c.ldc1612" F25000 T30000 