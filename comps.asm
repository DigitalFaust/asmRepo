SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
s1 db 'Please, type first line less than 20 symbols: '
lens1 equ $ - s1

s2 db 'Please, type second line less than 20 symbols: '
lens2 equ $ - s2

msgEq db 'They are equal', 0xa
lenEq equ $ - msgEq

msgNeq db 'They are not equal', 0xa
lenNeq equ $ - msgNeq

section .bss
	s3 resb 20
	s4 resb 20
	
section .text
	global _start

_start:
	mov edx, lens1
	mov ecx, s1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 20
	mov ecx, s3
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov edx, lens2
	mov ecx, s2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 20
	mov ecx, s4
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80
	
	mov esi, s3
	mov edi, s4
	mov ecx, 20
	cld
	repe cmpsb
	jecxz equal

	mov edx, lenNeq
	mov ecx, msgNeq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	jmp exit

equal:
	mov edx, lenEq
	mov ecx, msgEq
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
