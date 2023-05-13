#define __SFR_OFFSET 0x00
#include "avr/io.h"
.equ  SCK, 5
.equ  MOSI, 3
.equ  SS, 2
.global main
main:
  RCALL SPI_INIT
loop:
  RCALL disp_text_COOK
  RCALL delay_ms
  RCALL disp_text_PLATE
  RCALL delay_ms
  RCALL disp_text_READY
  RCALL delay_ms
  rjmp loop





SPI_INIT:
  LDI   R17, (1<<MOSI)|(1<<SCK)|(1<<SS)
  OUT   DDRB, R17       ;set MOSI, SCK, SS as o/p
  ;--------------------------------------------------------
  LDI   R17, (1<<SPE)|(1<<MSTR)|(1<<SPR0)
  OUT   SPCR, R17       ;enable SPI as master, fsck=fosc/16
  ;--------------------------------------------------------
  LDI   R17, 0x0A       ;set segment intensity (0 to 15)
  LDI   R18, 8          ;intensity level = 8
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x09       ;set decoding mode command
  LDI   R18, 0b00000000 ;decoding byte
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x0B       ;set scan limit command
  LDI   R18, 0x07       ;8 digits connected to MAX7219
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x0C       ;set turn ON/OFF command
  LDI   R18, 0x01       ;turn ON MAX7219
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  RET


disp_text_COOK:
  LDI   R17, 0x08       ;select digit 7
  LDI   R18, 0b01001110       ;data = d
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x07       ;select digit 6
  LDI   R18, 0b01111110      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x06       ;select digit 6
  LDI   R18, 0b01111110      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x05       ;select digit 3
  LDI   R18, 0b00110111       ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x04       ;select digit 2
  LDI   R18, 0b00000110       ;data = c
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x03       ;select digit 1
  LDI   R18, 0b01110110       ;data = n
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
    LDI   R17, 0x02       ;select digit 0
  LDI   R18, 0b01111011      ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x01       ;select digit 0
  LDI   R18, 0x00       ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  RET

disp_text_PLATE:
  LDI   R17, 0x08       ;select digit 7
  LDI   R18, 0b01100111       ;data = d
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x07       ;select digit 6
  LDI   R18, 0b00001110      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x06       ;select digit 6
  LDI   R18, 0b01111101      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x05       ;select digit 3
  LDI   R18, 0b00001111       ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x04       ;select digit 2
  LDI   R18, 0b00000110       ;data = c
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x03       ;select digit 1
  LDI   R18, 0b01110110       ;data = n
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
    LDI   R17, 0x02       ;select digit 0
  LDI   R18, 0b01111011      ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x01       ;select digit 0
  LDI   R18, 0x00       ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  RET

disp_text_READY:
  LDI   R17, 0x08       ;select digit 7
  LDI   R18, 0b01000110       ;data = d
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x07       ;select digit 6
  LDI   R18, 0b01101111      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x06       ;select digit 6
  LDI   R18, 0b01111101      ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x05       ;select digit 3
  LDI   R18, 0b00111101       ;data = space
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x04       ;select digit 2
  LDI   R18, 0b00111011       ;data = c
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x03       ;select digit 1
  LDI   R18, 0       ;data = n
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
    LDI   R17, 0x02       ;select digit 0
  LDI   R18, 0      ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  LDI   R17, 0x01       ;select digit 0
  LDI   R18, 0x00       ;data = t
  RCALL send_bytes      ;send command & data to MAX7219
  ;--------------------------------------------------------
  RET

send_bytes:
  CBI   PORTB, SS       ;enable slave device MAX7219
  OUT   SPDR, R17       ;transmit command
  ;--------------------------------------------------------
ll2:  IN    R19, SPSR
  SBRS  R19, SPIF       ;wait for byte transmission
  RJMP  ll2             ;to complete
  ;--------------------------------------------------------
  OUT   SPDR, R18       ;transmit data
  ;--------------------------------------------------------
ll3:  IN    R19, SPSR
  SBRS  R19, SPIF       ;wait for byte transmission
  RJMP  ll3             ;to complete
  ;--------------------------------------------------------
  SBI   PORTB, SS       ;disable slave device MAX7219
  RET

delay_ms:
;--------
ldi r25, hi8(1000) ; Memasukkan nilai delay dalam satuan ms ke r25
  ldi r24, lo8(1000) ; Memasukkan nilai delay dalam satuan ms ke r24
outerLoop:
; karena innerLoop berjalan selama 4 cycle, maka di-loop 4000x sehingga menghasilkan
; 1 millisecond (4 x 4000 : 16Mhz = 10^-3)
  ldi r31, hi8(4000) ; mengisi r30 dan r31 dengan 4000
  ldi r30, lo8(4000)
innerLoop:
  sbiw r30,1 ; Mengurangi isi r30 dan r31 sebanyak 1
  brne innerLoop ; Jika hasil pengurangan baris sebelumnya tidak menghasilkan nol,
; innerLoop akan terus diulang
;------------------------------(end of innerLoop)
  
  sbiw r24, 1 ; Mengurangi r24 dan r25 sebanyak 1
  brne outerLoop; Jika hasil pengurangan baris sebelumnya tidak menghasilkan nol,
; maka outerLoop akan terus diulang dan innerLoop akan dijalankan kembali
RET
