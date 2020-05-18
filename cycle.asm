SYS_WRITE equ 4
SYS_EXIT equ 1
STDOUT equ 1

segment .data
endl db 0xa
len equ $ - 0xa

segment .bss
	number resb 2

segment .text
	global _start:

_start:
	mov eax, '0'
	mov ecx, 10

l1:
	mov [number], eax
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	push ecx

	mov edx, 2
	mov ecx, number
	int 0x80

	mov eax, [number]
	sub eax, '0'
	inc eax
	add eax, '0'
	pop ecx

	int 0x80

	loop l1
exit:
	mov eax, SYS_EXIT
	int 0x80
