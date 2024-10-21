TITLE hw2

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.


INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
 
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
MyID   DWORD 0

.code

fact PROC

	; if ebx <= 1, jump to function end and set ebx = eax (exit condition)
	cmp ebx, 1
	jle L1

	; otherwise, push ebx = n to stack
	push ebx

	; decrement ebx, call fact(n-1), so that eax becomes n-1!
	dec ebx
	call fact

	; restore n from stack to ebx, so that ebx = n
	pop ebx

	; eax = (n-1)! * n
	mul ebx
	
	ret
L1:
	mov eax, ebx
	ret

fact ENDP

main PROC		
	mov ebx, MyID
	call fact
	INVOKE ExitProcess,0
main ENDP
END main