SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
msg db 'Enter number', 0xa
msgLen equ $ - msg
evenNum db 'Even number', 0xa
evenLen equ $ - evenNum
oddNum db 'Odd number', 0xa
oddLen equ $ - oddNum

section .bss
	number resb 1

section .text
	global _start

_start:
	mov edx, msgLen
	mov ecx, msg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
	
	mov edx, 1
	mov ecx, number
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov eax, [number]
	and eax, 1
	jz evenn
	jmp oddn

oddn:
	mov edx, oddLen
	mov ecx, oddNum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
	jmp exit

evenn:
	mov edx, evenLen
	mov ecx, evenNum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
	jmp exit

exit:
	mov eax, SYS_EXIT
	int 0x80
