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
	mov ecx,LENGTHOF Result ; Set ecx as loop count
	mov edi,OFFSET Result	; Set edi as address of result
	xor ax,ax				; set ax to 0
	
L1:
	add ax,9	; add 9 to ax
	
	mov [edi],ax	; Store multiplied result in destination
	inc edi			; Increase address to point to next destination
	loop L1			; next loop iteration

	
	INVOKE ExitProcess,0
main ENDP
END main