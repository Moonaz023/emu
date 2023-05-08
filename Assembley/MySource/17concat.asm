.model small
.stack 100h

.data
arr1 db 'Hellow' 
arr2 db 'World'  
ans db 0 dup(?)  

.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea si, arr1   
    lea di, ans
    
    mov cx,6
    
    loop1:
    mov al,[si]    
    mov [di],al
    
    inc si
    inc di
    loop loop1
    
        
        
     mov cx,5   
     lea si, arr2
        
     loop2:
        mov al,[si]    
        mov [di],al
        
        inc si
        inc di
        loop loop2
        
        
    mov cx,11 
    lea di, ans
    
     loop3:
        mov dl,[di] 
        
        mov ah,2
        int 21h
        
        
        inc di
        loop loop3
        
    
    mov ah,4ch
    int 21h
    main endp
end main