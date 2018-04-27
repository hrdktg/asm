data segment
    arr db 10h,5h,3h
    len equ $-arr
data ends

code segment
    assume cs:code, ds:data

    start:
    mov ax,data
    mov ds,ax
    mov ch,len-1

    l1:
    mov cl,ch
    lea si,arr

    l2:
    mov al,[si]
    inc si
    cmp al,[si]
    jbe l3
    xchg al,[si]
    mov [si-1],al

    l3:
    dec cl
    jnz l2
    dec ch
    jnz l1

    int 3
code ends
end start




