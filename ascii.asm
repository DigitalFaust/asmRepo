SYS_WRITE equ 4
SYS_EXIT equ 1
STDOUT equ 1

section .data
achar db '0'

section .text
	global _start

_start:
	call display
	call exit

exit:
	mov eax, SYS_EXIT
	int 0x80

display:
	mov ecx, 256

next:
	push ecx
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, achar
	mov edx, STDOUT
	int 0x80

	pop ecx
	mov dx, [achar]
	cmp byte [achar], 0dh
	inc byte [achar]
	loop next
	ret
