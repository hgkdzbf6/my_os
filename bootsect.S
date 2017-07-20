.code16

.global _bootstart

.equ BOOTSEG,0x07c0

#16-real mode
#SEG:OFFSET e.g. 0x07c0:0x0000 -> SEG<<4+OFFSET =0x7c00

.text

ljmp $BOOTSEG,$_bootstart

_bootstart:
#get cursor position
	mov $0x03,%ah
	int $0x10

#output
	mov $BOOTSEG,%ax
	mov %ax,%es
	mov $_string, %bp
	mov $0x1301,%ax
	mov $0x000b,%bx
	mov $0x14,%cx
	int $0x10

loop:
	jmp loop


	jmp _bootstart

_string:
	.ascii "Hello Bootloader!"
	.byte 13,10,13,10
.=510

signature:
	.word 0xaa55

	