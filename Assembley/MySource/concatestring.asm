.model small
.stack 100h
.data
s1 db "abcd$"
s2 db "efgh$"
s3 db "show first string : $"
s4 db "show second string : $"
s5 db "concated string : $"
s6 db 9 dup(?) 
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea dx,s3
    mov ah,9h
    int 21h 
    
    lea dx,s1
    mov ah,9h
    int 21h
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,s4
    mov ah,9h
    int 21h 
    
    lea dx,s2
    mov ah,9h
    int 21h  
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h 
    
    lea dx,s5
    mov ah,9h
    int 21h 
    
    lea si,s1
    lea di,s6
       
    cld
    
    mov cx,0
    mov cx,4
    rep movsb 
    
    lea si,s2
    
    cld
    
    mov cx,0
    mov cx,4
    rep movsb 
      
    mov [di], '$' ;have to add this line 
    
    lea dx,s6
    mov ah,9h
    int 21h
     
    exit:
    mov ah,4ch
    int 21h
    main endp
end main