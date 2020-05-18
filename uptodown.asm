SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
s1 db 'Please, type words using upper letters: '
len equ $ - s1
endl db 0xa
lend equ $ - endl

section .bss
	s2 resb 20
	s3 resb 20

section .text
	global _start

_start:
	mov edx, len
	mov ecx, s1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 20
	mov ecx, s3
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80
	
	mov ecx, len
	mov esi, s3
	mov edi, s2

loop_here:
	lodsb
	or al, 20h
	stosb
	loop loop_here
	cld
	rep movsb

	mov edx, 20
	mov ecx, s2
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
