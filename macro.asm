SYS_WRITE equ 4
SYS_EXIT equ 1
STDOUT equ 1

section .data
msg1 db 'Hello there', 0xa
len1 equ $ - msg1

msg2 db 'Welcome to the world', 0xa
len2 equ $ - msg2

msg3 db 'Of Linux assembly language', 0xa
len3 equ $ - msg3

%macro writeString 2
	mov edx, %2
	mov ecx, %1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
%endmacro

section .text
	global _start

_start:
	writeString msg1, len1
	writeString msg2, len2
	writeString msg3, len3

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
