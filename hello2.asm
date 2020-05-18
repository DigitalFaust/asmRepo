section .data
msg db 'Hello world', 0xa
len equ $ - msg

section .text
	global _start

_start:
	mov eax, 4
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	int 0x80

	mov eax, 1
	int 0x80
