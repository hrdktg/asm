data segment
    lst db 50 dup('$')
    rlst db 50 dup('$')
    msg1 db "Not Palin$"
    msg2 db "Palin$"
    len dw ?
data ends

code segment
    assume cs:code, ds:data

    start:
    mov ax,data
    mov ds,ax

;Input String
    mov dx,offset lst
    mov ah,3fh
    int 21h

;Get Length of Input
    mov len,ax
    mov dx,len

;Print String
    mov dx,offset lst
    mov ah,09h
    int 21h

;Reverse String
    lea si,lst
    lea di,rlst
    add si,len
    dec si
    mov cx,len

    reverse_str:
    mov al,[si]
    mov [di],al
    dec si
    inc di
    loop reverse_str

;Print the Reversed String
    lea dx,rlst
    mov ah,09h
    int 21h

;Compare the Original and reversed string
    mov cx,len
    lea si,lst
    lea di,rlst
    sub cx,2
    add di,2
    
    check_me:
    mov al,[si]

    mov al,[si]
    cmp al,[di]
    jne not_palin
    inc si
    inc di

    loop check_me
    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit

    not_palin:
    lea dx,msg1
    mov ah,09h
    int 21h
    jmp exit

;End Program
    exit:
    mov ah,4ch
    int 21h

code ends
end start

