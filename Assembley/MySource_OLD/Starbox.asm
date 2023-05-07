.model small
.stack 100h
.data

.code
 main proc 
       mov cx,4
       l1:
       mov ah,2
        mov dl,'*'
        int 21h
        int 21h
        int 21h
        int 21h
       
      
       ;mov cx,4
      ;loop l1       
              
      mov ah,2
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      loop l1
      
      
    
     exit:
     mov ah,4ch
     int 21h
    main endp
    end main