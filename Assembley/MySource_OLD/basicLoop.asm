.model small
.stack 100h
.data
  a db 'Loop concept $'

.code
    main proc 
        mov ax,@data
        mov ds,ax
        
         mov ah,9
         lea dx,a
         int 21h 
         
         
         mov ah,2
         mov dl,10 
         int 21h
         mov dl,13
         int 21h
         
         
         mov cx,26  ;loop concept works within cx register,total alphabhet 26
         mov ah,2
         mov dl,'A'
         
         
         level1:
                 int 21h ;int 21h within loop meansexecution of just previous stored value in cx
                 inc dl
         
         loop level1   ;loop level1 means the loop will run until level1 is completed
         
         
         exit:
         
   
        
        
      mov ah,4ch
      int 21h  
      main endp
    end main