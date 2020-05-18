SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .text
msg1 db 'Please, enter first number: '
len1 equ $ - msg1
msg2 db 'Please, enter second number: '
len2 equ $ - msg2
msg3 db 'The result is: '
len3 equ $ - msg3
msgA db 'Operation of addition', 0xa
lenA equ $ - msgA
msgS db 'Operation of subtraction', 0xa
lenS equ $ - msgS
msgM db 'Operation of multiplication', 0xa
lenM equ $ - msgM
msgD db 'Operation of division', 0xa
lenD equ $ - msgD
endl db 0xa
lend equ $ - endl

section .bss
	num1 resb 6
	num2 resb 6
	res resb 6

section .text
	global _start

_start:
	mov edx, lenA
	mov ecx, msgA
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

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

	mov edx, len3
	mov ecx, msg3
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov esi, 4
	mov ecx, 5
	clc

loopAdd:
	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa
	pushf
	or al, 30h
	popf

	mov [res + esi], al
	dec esi
	loop loopAdd

	mov edx, 5
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, lend
	mov ecx, endl
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
