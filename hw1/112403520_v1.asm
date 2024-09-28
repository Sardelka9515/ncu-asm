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
MyID   DWORD ?
Digit0 BYTE 3
Digit1 BYTE 5
Digit2 BYTE 2
Digit3 BYTE 0

.code
main PROC		
	movzx eax,Digit3	; move the last digit into eax register
	
	movzx ebx,Digit2	; move and zero-extend third digit into ebx register
	shl ebx,8*1			; we need to move this digit up by 1 byte (8 bits)
	or eax,ebx			; OR eax with the result
	
	movzx ebx,Digit1	; move and zero-extend second digit into ebx register
	shl ebx,8*2			; we need to move this digit up by 2 byte (16 bits)
	or eax,ebx          ; OR eax with the result
	
	movzx ebx,Digit0	; move and zero-extend first digit into ebx register
	shl ebx,8*3         ; we need to move this digit up by 3 byte (24 bits)
	or eax,ebx          ; OR eax with the result
	
	mov MyID,eax		; finally, store the result in MyID
	call WriteHex		; write result to console
	
	INVOKE ExitProcess,0
main ENDP
END main