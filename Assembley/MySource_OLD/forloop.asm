.model small
.stack 100h


.code
  main proc
     
     
     mov cx,10
     mov ah,2  
     mov dl,48 
     l:
     int 21h
     inc dl
     Loop l
      
      
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
  end main