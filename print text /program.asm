.model small
.stack 100h
.data
Massage DB 'Hello, my name is GOOYA' ,13,10,'$'
.code
Hello Proc
mov ax, @data
mov ds, ax
mov dx, OFFSET Massage
mov ah,9h
int 21h
mov al,0
mov ah, 04ch
int 21h
Hello ENDP
END Hello
