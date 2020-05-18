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
msg3 db 'The sum is: '
len3 equ $ - msg3
;num1 db '12345'
;num2 db '54331'
;sum db '     '
endl db 0xa
lend equ $ - endl

section .bss
	num1 resb 6
	num2 resb 6
	sum resb 6

section .text
	global _start

_start:
	mov edx, len1
	mov ecx, msg1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 6
	mov ecx, num1
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, len2
	mov ecx, msg2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 6
	mov ecx, num2
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov esi, 4
	mov ecx, 5
	clc

addLoop:
	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa
	pushf
	or al, 30h
	popf

	mov [sum + esi], al
	dec esi
	loop addLoop

	mov edx, len3
	mov ecx, msg3
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 5
	mov ecx, sum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	jmp endLine

exit:
	mov eax, SYS_EXIT
	int 0x80

endLine:
	mov edx, lend
	mov ecx, endl
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	jmp exit
