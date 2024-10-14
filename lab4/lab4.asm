TITLE lab4

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

myId BYTE "112403011"	; student id of group leader
myId2 BYTE "112403520"	; student id of group memeber 
.code

Convert PROC USES ax
l1:
	mov al,[esi]			; move the char to convert into al
	add al,17				; convert number to alphabet
	mov BYTE PTR [esi],al	; store the result
	inc esi					; increment esi to point to the next char
	loop l1					; repeat unitl cx is 0
	ret
Convert ENDP

Convert2 PROC
	push ax
l1:
	mov al,[esi]		   ; move the char to convert into al
	add al,17			   ; convert number to alphabet
	mov BYTE PTR [esi],al  ; store the result
	inc esi				   ; increment esi to point to the next char
	loop l1				   ; repeat unitl cx is 0
	
	pop ax
	ret
Convert2 ENDP


main PROC

	; Set initial value
	mov eax,9999h
	mov ebx,9999h
	mov ecx,9999h
	mov edx,9999h

	mov esi, OFFSET myId	; Set source address
	mov cx, LENGTHOF myId	; Set source size
	call Convert			; Call Convert procedure
	
	mov esi, OFFSET myId2	; Set source address
	mov cx, LENGTHOF myId2	; Set source size
	call Convert2			; Call Convert2 procedure

	INVOKE ExitProcess,0
main ENDP
END main