SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
msg1 db 'Please, enter first number: '
len1 equ $ - msg1

msg2 db 'Please, enter second number: '
len2 equ $ - msg2

msg3 db 'The sum  is: '
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
	mov ecx, num1
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

	mov eax, [num1]
	sub eax, '0'
	mov ebx, [num2]
	sub ebx, '0'

	call sum

	mov [res], eax

	mov edx, len3
	mov ecx, msg3
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

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

	jmp exit

sum:
	add eax, ebx
	add eax, '0'
	ret

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
