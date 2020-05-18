section .date
	usrMsg db 'Please enter a number: '
	usrLen equ $ - usrMsg
	dispMsg db 'You have entered: '
	dispLen equ $ - dispMsg

section .bss
	num resb 5

section .data
	global _start

_start:
	mov edx, usrLen
	mov ecx, usrMsg
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov edx, 5
	mov ecx, num
	mov eax, 3
	mov ebx, 2
	int 0x80

	mov edx, dispLen
	mov ecx, dispMsg
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov edx, 5
	mov ecx, num
	mov eax, 4
	mov ebx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
