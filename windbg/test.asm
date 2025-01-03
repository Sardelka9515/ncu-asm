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
Result BYTE 9 DUP(?)

.code
main PROC
	mov ecx,LENGTHOF Result
	lea eax,Result
	xor ebx,ebx
	mul ax,bx

	
	INVOKE ExitProcess,0
main ENDP
END main