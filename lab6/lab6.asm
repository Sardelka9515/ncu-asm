TITLE lab6

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
    result byte 64 DUP(?)  ; Reserve 64 bytes of uninitialized space for result array.

.code
main PROC
    mov eax, 01            ; Initialize EAX to 1 ( store the result of multiplication)
    mov ebx, 01            ; Initialize EBX to 1 (multiplier)
    mov ecx, 08            ; Set ECX to 8 ( loop 8 times)
    mov esi, OFFSET result ; Point ESI to the start of the result array (for storing results)

L2:                         ; Outer loop label
L1:                         ; Inner loop label
    mul ebx                 ; Multiply EAX by EBX (EAX = EAX * EBX)
    mov [esi], eax          ; Store the result 
    div ebx                 ; Divide EAX by EBX 
    inc esi                 ; esi++
    inc ebx                 ; ebx++
    Loop L1                 ; Decrement ECX and jump to L1 if ECX is not zero

    mov ebx, 01             ; Reset EBX to 1 for the outer loop
    mov ecx, 08             ; Set ECX to 8 for the next set of operations
    inc eax                 ; Increment EAX to try the next number
    cmp eax, ecx            ; Compare EAX with ECX
    jbe L2                  ; Jump to L2 if EAX <= ECX

    exit
main ENDP
END main