; do nothing, probing is currently broken
;G60 S0     ; store current position
;G0 Z0      ; dive deep enough for the probe to be magnetically retracted
;G1 R0  Z0  ; return to saved position