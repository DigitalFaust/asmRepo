section .data
	name db 'Zara Ali '
	len equ $ - name

section .text
	global _start

_start:
	mov edx, len
	mov ecx, name
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov [name], dword 'Nuha'

	mov edx, len
	mov ecx, name
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov eax, 1
	int 0x80
