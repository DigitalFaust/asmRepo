SYS_WRITE equ 4
SYS_EXIT equ 1
SYS_READ equ 3
STDOUT equ 1
STDIN equ 0

section .data
firstReq db 'Please, enter first digit: '
firstLen equ $ - firstReq
secondReq db 'Please, enter second digit: '
secondLen equ $ - secondReq
resMsg db 'Result is: '
resLen equ $ - resMsg
multMsg db 'Please, enter digits for multiplication', 0xa
multLen equ $ - multMsg
divMsg db 0xa, 'Please, enter digits for division', 0xa
divLen equ $ - divMsg
addMsg db 0xa, 'Please, enter digits for addition', 0xa
addLen equ $ - addMsg
subMsg db 0xa, 'Please, enter digit for subtraction', 0xa
subLen equ $ - subMsg
finMsg db 0xa
finLen equ $ - finMsg

section .bss
	firstNum resb 2
	secondNum resb 2
	res resb 8

section .text
	global _start

_start:
	;start of multiplication
	mov edx, multLen
	mov ecx, multMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;invitation to enter first digit
	mov edx, firstLen
	mov ecx, firstReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter first number
	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;invitation to enter second digit
	mov edx, secondLen
	mov ecx, secondReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter second number
	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;showing result text
	mov edx, resLen
	mov ecx, resMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;multiplication
	mov al, [firstNum]
	sub al, '0'
	mov bl, [secondNum]
	sub bl, '0'
	mul bl
	add eax, '0'
	mov [res], eax

	;output result of multiplication
	mov edx, 8
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;start of division
	mov edx, divLen
	mov ecx, divMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;invitation to enter first number
	mov edx, firstLen
	mov ecx, firstReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter first number
	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;invitation to enter second number
	mov edx, secondLen
	mov ecx, secondReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter second number
	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;showin result text
	mov edx, resLen
	mov ecx, resMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;division
	mov al, [firstNum]
	sub al, '0'
	mov bl, [secondNum]
	sub bl, '0'
	div bl
	add ax, '0'
	mov [res], ax

	;output the result of division
	mov edx, 8
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;start of addition
	mov edx, addLen
	mov ecx, addMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;invitation to enter first number
	mov edx, firstLen
	mov ecx, firstReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter first number
	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80
	
	;invitation to enter second number
	mov edx, secondLen
	mov ecx, secondReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter second number
	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;showing result text
	mov edx, resLen
	mov ecx, resMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;addition
	mov eax, [firstNum]
	sub eax, '0'
	mov ebx, [secondNum]
	sub ebx, '0'
	
	add eax, ebx
	add eax, '0'
	mov [res], eax

	;output the result of addition
	mov edx, 2
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;start of subtraction
	mov edx, subLen
	mov ecx, subMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;invitation to enter first number
	mov edx, firstLen
	mov ecx, firstReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter first number
	mov edx, 2
	mov ecx, firstNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;invitation to enter second number
	mov edx, secondLen
	mov ecx, secondReq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;enter second number
	mov edx, 2
	mov ecx, secondNum
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	;showing result line
	mov edx, resLen
	mov ecx, resMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	;subtraction
	mov eax, [firstNum]
	sub eax, '0'
	mov ebx, [secondNum]
	sub ebx, '0'

	sub eax, ebx
	add eax, '0'
	mov [res], eax

	;output the result of subtraction
	mov edx, 2
	mov ecx, res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, finLen
	mov ecx, finMsg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
