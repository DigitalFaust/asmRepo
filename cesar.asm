SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
s1 db 'Please, type word less than 10 chars: '
len equ $ - s1

section .bss
	s2 resb 10
	s3 resb 10

section .text
	global _start

_start:
	mov edx, len
	mov ecx, s1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 10
	mov ecx, s3
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80
	
	mov ecx, len
	mov esi, s3
	mov edi, s2

loop_here:
	lodsb
	add al, 02
	stosb
	loop loop_here
	cld
	rep movsb

	mov edx, 10
	mov ecx, s2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80
