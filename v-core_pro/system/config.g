; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up

; General preferences
G90                                                   ; send absolute coordinates...
M83                                                   ; ...but relative extruder moves
M550 P"vcore-pro"                                     ; set printer name

M669 K1                                               ; select CoreXY mode


G4 P1                                                 ; delay 1 second to allow for CANbus sync before driver
                                                      ; assignment.
; Drives
M569 P0.0 S0                                          ; physical drive 0.0 goes backwards (X)
M569 P0.1 S0                                          ; physical drive 0.1 goes backwards (Y)
M569 P0.3 S1                                          ; physical drive 0.3 goes forwards  (Z1)
M569 P0.4 S1                                          ; physical drive 0.4 goes forwards  (Z2)
M569 P0.5 S1                                          ; physical drive 0.5 goes forwards  (Z3)
M569 P10.0 S1                                         ; physical drive 10.0 goes forwards (E -- tool board)
M584 X0.0 Y0.1 Z0.3:0.4:0.5                           ; set drive mapping -- 3HC
M584 E10.0                                            ; set drive mapping -- tool board
M350 X16 Y16 Z16 I1 ;  E16 I1                         ; configure microstepping with interpolation
M92 X160.00 Y160.00 Z1600.00 E415.00                  ; set steps per mm

; extruder speeds cribbed from https://forum.duet3d.com/topic/18694/duet-maximum-achievable-step-rates/10
; max speed 9000 mm/min, max instantaneous speed 3600mm/sec, acceleration 6000 mm/sec^2

M566 X600.00 Y600.00   Z360.00 E3600.00 P1             ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z1200.00 E9000.00               ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z120.00 E6000.00                ; set accelerations (mm/s^2)

M906 X1400 Y1400 Z1400 E1000 I30                      ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                               ; Set idle timeout

; Axis Limits -- reachable for Hemera extruder
M208 X-150 Y-150 Z0 S1                                ; set axis minima
M208 X135 Y140 Z330 S0                                ; set axis maxima

; Endstops
M574 X1 S3                                         ; use stall guard for  XY endstops (X min, y max)
M574 Y2 S3

; Z-Probe -- dc42 IR probe
M558 P8 C"!^10.io0.in" H5 F120 T3600 A4 S0.02           ; set Z probe type to digital with pullup and the dive height + speeds
G31 P500 X-30 Y-37 Z2.37                                ; set Z probe trigger value, offset and trigger height
M557 X-140:100 Y-140:100 P6                             ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"   ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0 Q1                                 ; create bed heater output on out0 and map it to sensor 0
M143 H0 S120                                          ; set temperature limit for heater 0 to 120C
M307 H0 B1 S1.00                                      ; enable bang-bang mode for the bed heater and set PWM limit
M140 H0                                               ; map heated bed to heater 0

M308 S1 P"10.temp0" Y"thermistor" T100000 B4092 C0 A"Tool0" ; Semitec on toolboard with address 10
M950 H1 C"10.out0" T1                                 ; create nozzle heater output on out1 and map it to sensor 1
M143 H1 S295                                          ; set temperature limit for heater 1 to 280C
M307 H1 B0 S1.00                                      ; disable bang-bang mode for heater  and set PWM limit

; Fans
M950 F0 C"10.out1"                                    ; create fan 0 on pin 10.out1 and set its frequency
M106 P0 S0 H-1                                        ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"10.out2+out2.tach" Q5000                    ; create fan 1 on pin out2 and set its frequency, and tacho output on out2.tach
M106 P1 S1 H1 T45                                     ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                      ; define tool 0
G10 P0 X0 Y0 Z0                                       ; set tool 0 axis offsets
G10 P0 R0 S0                                          ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; kinematic joint positions for V-Core bed
M671 X-150:0:150 Y-150:150:-150 S5

; Load config-override.g
M501

; Linear Advance
; M572 D0 S0.03
; Retract
; M207 P0 S1.8 F2400 Z0.3                              ; default Hemera retract settings

; PanelDue
M575 P1 B57600 S1
