; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2 on Sat May 18 2019 17:29:31 GMT+0200 (Central European Summer Time)

; General preferences
G90                                       ; Send absolute coordinates...
M83                                       ; ...but relative extruder moves

; Network
M550 P"CR20"                              ; Set machine name
M552 S1                                   ; Enable network
M586 P0 S1                                ; Enable HTTP
M586 P1 S0                                ; Disable FTP
M586 P2 S0                                ; Disable Telnet

; Drives 
M569 P0 S1                                ; Physical drive 0 goes forwards (X)
M569 P1 S1                                ; Physical drive 1 goes forwards (Y)
M569 P6 S0                                ; Physical drive 6 goes backwards (U)
M569 P2 S0                                ; Physical drive 2 goes backwards (Z left)
M569 P7 S0                                ; Physical drive 7 goes backwards (Z right)
M569 P4 S0                                ; Physical drive 4 goes backwards (E0)

; motor definitions
M584 X0 Y1 U6 Z2:7 E4:5                         ; X:X Y:Y Z:Z/E4MOT E:E1/E2MOT -- E0 burnt out
M906 X800 Y800 Z800 U800 E1300:1300 I30         ; Set motor currents (mA) and motor idle factor in per cent


M350 X16 Y16 U16 Z16 E16 I1                          ; Configure microstepping with interpolation
M92 X80.00 Y80.00 U80 Z1600.00 E270:135                  ; Set steps per mm
; M566 X600.00 Y600.00 Z20.00 E300.00                ; Set maximum instantaneous speed changes (mm/min)
M205 X10 Y10 U10 Z0.3 E5                             ; Set maximum instantaneous speed changes (mm/sec), lifted from Marlin
M203 X9000.00 Y9000.00 U9000.00 Z600.00 E6000.00     ; Set maximum speeds (mm/min)
M201 X2000.00 Y2000.00 U2000.00 Z100.00 E2000.00     ; Set accelerations (mm/s^2)
M204 P300 T750                                       ; Set print and travel acceleration maximums
M84 S30                                              ; Set idle timeout

; Axis Limits
M208 X-110:105 Y-110:110 U-81:164 Z0:240     
 

; Endstops  
M574 X1 Y1 Z1 S1                                     ; Set active high endstops
; M574 Z1 S2                                         ; Z probe for Z endstop
M574 U2 S0                                           ; U is active low ...

; Z-Probe
M558 P0 H5 F120 T6000                                ; Disable Z probe but set dive height, probe speed and travel speed

; Heaters

; Bed
M305 P0 T100000 B3950                         ; Set thermistor + ADC parameters for heater 0
M143 H0 S115                                  ; Set temperature limit for heater 0 to 110C (allow for 5C overshoot)
; M307 H0 A148.2 C547.8 D0.6 S1.00 V24.3 B0 
M307 H0 A79.9 C326.2 D0.7 S1.00 V24.0 B0      ; PID tuned values for bed


; Nozzles
M305 P1 T100000 B4725 C7.06e-8                ; Set thermistor + ADC parameters for heater 1
M143 H1 S290                                  ; Set temperature limit for heater 1 to 110C (allow for 5C overshoot)
M307 H1 A314.7 C130.9 D3.6 S1.00 V24.0 B0     ; PID tuned values for hotend with sock and full part cooling


M305 P3 T100000 B3950                         ; Set thermistor + ADC parameters for heater 2
M143 H3 S245
; M307 H3 A287.5 C90.5 D3.9 S1.00 V24.2 B0      ; PID tuned values for hotend with sock and full part cooling 
M307 H3 A277.3 C83.6 D3.2 S1.00 V24.2 B0      ; PID tuned values for ti fullmetal with sock and full part cooling


M305 P101 S"Drivers"
 

; Fans
M106 P0 S0 I0 F250 H-1                     ; Set fan 0 (part cooling X). Thermostatic control is turned off.
M106 P1 S1 I0 F250 H1 T45                 ; Set fan 1 value (heatbreak X). Thermostatic control is turned on.
M106 P2 S1 I0 F250 H1:100:101:102 T40     ; Set fan 2 value (board), Thermostatic control is turned on.
M106 P3 S0 I0 F250 H-1                    ; Set fan 3 value (part cooling U). Thermostatic control is turned off.
M106 P8 S1 I0 F250 H3 T45                 ; Set fan 8 value (heatbreak U). Thermostatic control is turned on. (fan 4 does not work)
; Tools
M563 P0 D0 H1 S"Links"                    ; Define tool 0
G10 P0 X0 Y0 Z0                           ; Set tool 0 axis offsets
G10 P0 R0 S0                              ; Set initial tool 0 active and standby temperatures to 0C

M563 P1 D1 H3 X3 F3 S"Rechts"              ; Define tool 1 (runs on U carriage, uses heater 3 and fan 3 for part cooling)
G10 P1 X58.5 Y-14 Z0 R0 S0                    ; set tool offsets and standby temperatures to 0C

; ''' Create a tool that prints 2 copies of the object using both carriages'''
M563 P2 D0:1 H1:3 X0:3 F0:3 S"dd"; tool 2 uses both extruders, hot end heaters and fans, and maps X to both X and U
G10 P2 X85 Y0 U58 S0 R0 ; set tool offsets and temperatures
M567 P2 E1:1 ; set mix ratio 100% on both extruders



; Automatic saving after power loss is not enabled

; Custom settings are not configured

; Miscellaneous
M307 H2 A-1 C-1 D-1                       ; Free second heater for PWM control via Duet board
T0                                        ; Select first tool

; M207 F3600 S2                           ; Firmware retraction

; Touch mi probe
; M558 P8 F300 H10 I0 T4000 ; simple probe
; G31 P500 X-46 Y-9 Z3.777 ; offsets
; M557 X-110:110 Y-110:110 S20 ; grid probe for G29 

; dc42's IR Probe

; M558 P1 F180 T6000 H3
; G31 P500 X0 Y-39 Z2.52 ; trigger value and offsets
; M557 X-100:100 Y-100:70 P6 ; 6x6 grid taking Y offset into account.

; Manual Probe
M558 P0 H1 F360 T3600
; Screw positions 30mm inset from the bed (see M208 for axis limits)
M671 X-83:-83:92 Y-92:83:0 P0.7 ; M4x40 screws on the Creality bed, thread pitch 0.7

; Retraction settings

M207 S1 F3600  Z0.1

; Pressure Advance
; M572 D0 S0.5 ; bowden likes larger values

; DAA
; M593 37.38