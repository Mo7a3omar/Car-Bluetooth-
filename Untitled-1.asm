.include "m328pdef.inc"
.global forward 
.def speedl = r16
.def speedr = r17
.def in1 = r18
.def in2 = r19
.def in3 = r20
.def in4 = r21

.macro digitalWrite pin, value
  sbrs \pin, 4
  rjmp .+4
  sbr \pin, \value
  rjmp .+2
  cbr \pin, \value
.endm

.macro analogWrite pin, value
  ldi \pin, \value
.endm

.macro forward
  ; Set pin direction as output
  ldi r30, low(DDRB)
  ldi r31, high(DDRB)
  ldi r16, (1 << PB1) | (1 << PB2) | (1 << PB3) | (1 << PB4)
  out  r30, r16
  out  r31, r16

  ; Set pin values
  digitalWrite in1, 1
  digitalWrite in2, 0
  digitalWrite in3, 1
  digitalWrite in4, 0

  ; Set PWM values
  ldi speedl, 250
  ldi speedr, 200
  analogWrite OCR0B, speedl
  analogWrite OCR0A, speedr
.endm
