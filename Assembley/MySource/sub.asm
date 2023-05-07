.model small
.stack 100h 

.data
a db ?
b db ?

.code
main proc  
           
    mov ax,@data 
    mov ds,ax
          
    mov ah,1
    int 21h
    sub al,48
    mov a,al 
    
    mov ah,2    ;
    mov dl,' '  ; print space
    int 21h     ;
    
    mov ah,1
    int 21h 
    sub al,48
    
    sub a,al  ;al=al+a
   aam 
   mov al,a 
    
       mov bx,ax
       
      mov ah,2
      mov dl,10 
      int 21h
      mov dl,13
      int 21h
       
    mov ah,2 
    mov dl,bh
    add dl,48
    int 21h  
    
    mov ah,2
    mov dl,bl
    add dl,48 
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main

