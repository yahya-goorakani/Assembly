data segment
    a db 9
    b db 3
    c db ?
    result_msg db 'The result is: $'   ; Message to display result
    newline db 0Dh, 0Ah, '$'            ; Newline characters for formatting
data ends

code segment
assume cs: code, ds:data
start:
    mov ax, data
    mov ds, ax
    
    mov al, a      ; Move the value of 'a' into AL register
    mov ah, b       ; Move the value of 'b' into Ah register
    add ah,ah       ; Multiply the value in AL by 2 (equivalent to 2*b)
    sub al, ah      ; Subtract the value of 'b' from AL
    mov cs:c, al   ; Move the result in AL to 'c'
    
    ; Display the result
    mov ah, 09h    ; DOS function to print string
    mov dx, offset result_msg  ; Load offset of message to DX
    int 21h        ; Call DOS interrupt
    
    mov dl, cs:c   ; Move the value of 'c' into DL
    add dl, '0'    ; Convert the numerical value in DL to ASCII
    mov ah, 02h    ; DOS function to print character
    int 21h        ; Call DOS interrupt
    
    ; Print newline characters for formatting
    mov ah, 09h    ; DOS function to print string
    mov dx, offset newline  ; Load offset of newline characters to DX
    int 21h        ; Call DOS interrupt
    
    ; Exit program
    mov ah, 4Ch    ; DOS function to exit program
    int 21h        ; Call DOS interrupt

code ends
end start
