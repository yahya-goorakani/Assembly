Data segment
    msg     db  0dh, 0ah, "Enter value for a: $"
    msg1    db  0dh, 0ah, "Enter value for b: $"
    result  db  0dh, 0ah, "The Result is: $"
Data ends

Code segment
    assume CS:Code, DS:Data

start:
    ; Initialize data segment
    mov ax, Data
    mov DS, ax

    ; Display message for value a
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; Read and store value a
    call readNumber
    mov bl, al           ; Store value a in bl

    ; Display message for value b
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Read and store value b
    call readNumber
    mov cl, al           ; Store value b in cl

    ; Compute (a - 2b)
    add cl, cl           ; 2b = b * 2
    sub bl, cl           ; a - 2b

    ; Display the result message in a new line
    mov dx, offset result
    mov ah, 09h
    int 21h

    ; Convert and display the result
    call DecimalConv
    mov si, offset buffer ; SI points to the beginning of the buffer
printLoop:
    lodsb                ; Load the byte at SI into AL and increment SI
    or al, al            ; Check if AL is zero (end of string)
    jz endPrint          ; If zero, end the loop
    mov ah, 02h          ; Print character function
    int 21h              ; Print the character
    jmp printLoop        ; Continue printing characters
endPrint:

    ; Terminate the program
    mov ah, 4ch
    int 21h

readNumber:
    ; Read a single digit and convert it to binary
    mov ah, 01h
    int 21h
    sub al, '0'
    ret

DecimalConv proc
    ; Convert result to decimal string
    mov bx, 10           ; Base
    mov cx, 0            ; Initialize counter
    mov di, 10           ; Index in buffer
    mov si, offset buffer ; Start of buffer

convertLoop:
    xor dx, dx           ; Clear DX for division
    div bx               ; Divide AX by BX
    add dl, '0'          ; Convert remainder to ASCII
    stosb                ; Store ASCII character in buffer
    inc cx               ; Increment counter
    test ax, ax          ; Check if quotient is zero
    jnz convertLoop      ; If not zero, continue conversion

    ; Reverse the string in buffer
    mov si, offset buffer ; Start of buffer
    mov di, cx           ; Length of string
    dec di               ; Adjust for zero-based index

reverseLoop:
    mov al, [si]         ; Load character from start of string
    ;mov ah, [al + di]    ; Load character from end of string
    mov [si], ah        ; Swap characters
    mov ah, al
    inc si               ; Move to next character
    dec di               ; Decrement index
    test di, di          ; Check if we've reached the middle of the string
    jnz reverseLoop      ; If not, continue swapping

    mov byte ptr [si], '$' ; Terminate string with '$'
    ret
DecimalConv endp



buffer db 10 dup(?)     ; Buffer to store decimal string

Code ends
end start
