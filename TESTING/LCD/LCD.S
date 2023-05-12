#define __SFR_OFFSET 0x00
#include "avr/io.h"
.global main

main:
  RCALL I2C_init ;initialize TWI module

loop:
  RCALL I2C_start ;transmit START condition
  LDI R27, 0b10010000
  RCALL I2C_write ;write slave address SLA+W
  LDI R27, 0b11111111
  RCALL I2C_write ;write data byte
  RCALL I2C_stop ;transmit STOP condition
  rjmp loop

  I2C_init:
  LDI R21, 2
  STS TWSR, R21 ;prescaler = 4^2
  LDI R21, 83 ;division factor = 83
  STS TWBR, R21 ;SCK freq = 598 kHz
  LDI R21, (1<<TWEN)
  STS TWCR, R21 ;enable TWI
  RET
I2C_start:
  LDI R21, (1<<TWINT)|(1<<TWSTA)|(1<<TWEN)
  STS TWCR, R21 ;transmit START condition
wt1:
  LDS R21, TWCR
  SBRS R21, TWINT ;TWI interrupt = 1?
  RJMP wt1 ;no, wait for end of transmission
  RET
I2C_write:
  STS TWDR, R27 ;copy SLA+W into data register
  LDI R21, (1<<TWINT)|(1<<TWEN)
  STS TWCR, R21 ;transmit SLA+W
wt2:
  LDS R21, TWCR
  SBRS R21, TWINT
  RJMP wt2 ;wait for end of transmission
  RET
I2C_stop:
  LDI R21, (1<<TWINT)|(1<<TWSTO)|(1<<TWEN)
  STS TWCR, R21 ;transmit STOP condition
  RET