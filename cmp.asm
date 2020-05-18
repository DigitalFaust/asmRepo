SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDIN equ 0
STDOUT equ 1

section .data
invMsg db 'Hello user, please enter numbers to compare them', 0xa
invLen equ $ - invMsg
firstReq db 'Enter first number: '
firstLen equ $ - firstReq
secondReq db 'Enter second number: '
secondLen equ $ - secondReq
thirdReq db 'Enter third number: '
thirdLen equ $ - thirdReq
grtMsg db 'The greatest number is: '
grtLen equ $ - grtMsg
endlMsg db 0xa
endlLen equ $ - endlMsg

section .bss
	firstNum resb 2
	secondNum resb 2
	thirdNum resb 2
	largest resb 2

section .text
	global _start

_start:
	mov edx, invLen
	mov ecx, invMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, firstLen
	mov ecx, firstReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, secondLen
	mov ecx, secondReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

;	mov edx, thirdLen
;	mov ecx, thirdReq
;	mov eax, SYS_WRITE
;	mov ebx, STDOUT
;	int 0x80
;
;	mov edx, 2
;	mov ecx, thirdNum
;	mov eax, SYS_READ
;	mov ebx, STDIN
;	int 0x80

	mov eax, [firstNum]
	cmp eax, [secondNum]
;	jg checkThird
	jg output
	mov eax, [secondNum]

output:
	mov [largest], eax

	mov edx, grtLen
	mov ecx, grtMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 2
	mov ecx, largest
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, endlLen
	mov ecx, endlMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

exit:
	mov eax, SYS_EXIT
	int 0x80

checkThird:
	cmp eax, [thirdNum]
	jg output
	mov eax, [thirdNum]
	jmp output
