TITLE lab5

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

myId BYTE "12403011"	; student id of group leader
myId2 BYTE "12403520"	; student id of group memeber
Result BYTE 9 DUP(?)
size_ID = 8
.code


main PROC
	mov esi,0
	mov ecx,size_ID

L:
	mov al,myID[esi]
	mov bl,myId2[esi]

	cmp al,bl   ; Compare the values in AL and BL (myID[esi] and myId2[esi])
	je L1       ; If AL == BL, jump to label L1
	jb L2       ; If AL < BL, jump to label L2
	ja L3       ; If AL > BL, jump to label L3

L1:
	mov Result[esi],'A'; If AL == BL, store 'A' in the Result array at index ESI
	jmp L4             ; Jump to L4

L2:
	mov Result[esi],'C'; If AL < BL, store 'C' in the Result array at index ESI
	jmp L4             ; Jump to L4

L3:
	mov Result[esi],'B'; If AL > BL, store 'B' in the Result array at index ESI
	jmp L4             ; Jump to L4

L4:
	inc esi            ; esi+=1
	loop L             ; Decrement ECX and loop to label L if ECX != 0

	lea edi,Result		; Load result address onto edi register so we can view the result data in memory
	exit
main ENDP
END main