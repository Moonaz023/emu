 .model small
.stack 100h
.data
 a db 'Upper case letter: $'
 b db 'Lower case letter: $'
 
 .code
       main proc
    mov ax,@data
    mov ds,ax
     
    mov ah,9
    lea dx,a
    int 21h
    
    
    mov ah,1 ;for taking input
    int 21h
    mov bl,al
    
   
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
             
             
       mov ah,9
    lea dx,b
    int 21h
 
 
    
    mov ah,2; for display 2
    Add bl,32   ;difference between lower case & upper case letter is 32
    mov dl,bl
    int 21h
     
    exit: 
    mov ah,4ch 
    int 21h
    main endp  
    end main