SYS_WRITE equ 4
SYS_EXIT equ 1
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

section .data
firstMsg db 'Please, enter a number you want to multiply: '
firstLen equ $ - firstMsg
secondMsg db 'Please, enter a multiplicator: '
secondLen equ $ - secondMsg
thirdMsg db 'Result is: '
thirdLen equ $ - thirdMsg
fourthMsg db 'Please, enter a number you want to divide: '
fourthLen equ $ - fourthMsg
fifthMsg db 'Please, enter a number for addition: '
fifthLen equ $ - fifthMsg
sixthMsg db 'Please, enter a number for subtraction: '
sixthLen equ $ - sixthMsg

section .bss
	number resb 2
	mult resb 2
	res resb 1

section .text
	global _start

_start:
	mov edx, firstLen
	mov ecx, firstMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, number
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, secondLen
	mov ecx, secondMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, mult
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, thirdLen
	mov ecx, thirdMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov eax, [number]
	sub eax, '0'
	mov ebx, [mult]
	sub ebx, '0'
	mul ebx
	add eax, '0'
	mov [res], eax

	mov edx, 1
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
