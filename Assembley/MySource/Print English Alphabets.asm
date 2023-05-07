.model small
.stack 100h
.code
main proc 
    
    mov cx,26
    
      
    mov ah,2 
    mov dl,'A' 
    
    
    for:
    
    int 21h
    
    inc dl
    
    Loop for:
    
   
    
     
     exit:
    mov ah, 4ch  
    int 21h
    main endp
end main
