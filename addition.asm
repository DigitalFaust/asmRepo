SYS_WRITE equ 4
SYS_EXIT equ 1
SYS_READ equ 3
STDIN equ 0
STDOUT equ 1

section .data
firstMsg db 'Enter first number: '
firstLen equ $ - firstMsg
secondMsg db 'Enter second number: '
secondLen equ $ - secondMsg
thirdMsg db 'The sum of entered numbers is: '
thirdLen equ $ - thirdMsg

section .bss
	firstNum resb 2
	secondNum resb 2
	sum resb 1

section .text
	global _start

_start:
	mov edx, firstLen
	mov ecx, firstMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, secondLen
	mov ecx, secondMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, thirdLen
	mov ecx, thirdMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov eax, [firstNum]
	sub eax, '0'
	mov ebx, [secondNum]
	sub ebx, '0'

	add eax, ebx
	add eax, '0'
	mov [sum], eax

	mov edx, 1
	mov ecx, sum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
