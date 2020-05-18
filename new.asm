section .bss
	num resb 4

section .text
	global _start

_start:
	mov edx, 4
	mov ecx, num
	mov eax, 3
	mov ebx, 2
	int 0x80

	mov edx, 4
	mov ecx, num
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
