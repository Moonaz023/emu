.model small
.stack 100h  

.data
a db 10,13 ,"*****$"

.code
main proc           
    
    mov ax,@data
    mov ds,ax;
    
    mov cx,5
    
      
    mov ah,9 
    lea dx,a 
    
    
    for:
    
    int 21h
    
    
    
    Loop for:
    
   
    
     
     exit:
    mov ah, 4ch  
    int 21h
    main endp
end main
