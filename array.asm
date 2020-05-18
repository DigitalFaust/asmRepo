SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDOUT equ 1
STDIN equ 0

section .data
inv db 'Please enter number less than 10: '
lenInv equ $ - inv
msg db 'The sum is: '
len equ  $ - msg
array times 4 db 2
sum db 0
endl db 0xa
lend equ $ - endl

section .bss
	num resb 1

section .text
	global _start

_start:

	mov eax, 4
	mov ebx, 0
	mov ecx, array

enter:
	mov edx, lenInv
	mov ecx, inv
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80
	
	mov edx, 1
	mov ecx, num
	mov eax, SYS_READ
	mov ebx, STDIN
	int 0x80

	mov eax, [
	
	add ecx, 1
	dec eax
	jnz enter

	mov eax, 4
	mov ecx, array

repeat:
	add ebx, [ecx]
	add ecx, 1
	dec eax
	jnz repeat
	
done:
	add ebx, '0'
	mov [sum], ebx

display:
	
	mov edx, len
	mov ecx, msg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	int 0x80

	mov edx, 1
	mov ecx, sum
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
