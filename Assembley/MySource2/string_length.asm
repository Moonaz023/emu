ORG 100h
.model small
.stack 100h

.data
str db 'Enter a String: $'
len db 0

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,str
    int 21h
    
    level1:
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,13
    je enter
    inc len
    loop level1
    
    enter:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,len 
    add dl,'0'
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main