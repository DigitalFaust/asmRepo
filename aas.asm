SYS_WRITE equ 4
SYS_EXIT equ 1
STDOUT equ 1
SYS_READ equ 3
STDIN equ 0

section .data
msg1 db 'Enter first number: '
len1 equ $ - msg1
msg2 db 'Enter second number: '
len2 equ $ - msg2
msg3 db 'The result is: '
len3 equ $ - msg3
endl db 0xa
lend equ $ - endl

section .bss
	num1 resb 2
	num2 resb 2
	res resb 2

section .text
	global _start

_start:
	mov edx, len1
	mov ecx, msg1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, num2
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, len2
	mov ecx, msg2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, num2
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	sub ah, ah
	mov al, [num1]
	mov bl, [num2]
	adc al, bl
	aaa
	or al, 30h
	mov [res], ax

	mov edx, 2
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, lend
	mov ecx, endl
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

_exit:
	mov eax, SYS_EXIT
	int 0x80
