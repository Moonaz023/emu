.model small
.stack 100h
.data
  s1 db  '* * * * *$'
  s2 db  ' * * * *$'
  s3 db  '  * * *$'
  s4 db  '   * *$'
  s5 db  '    *$'
  
.code
    main proc
     mov ax,@data
     mov ds,ax
     
     mov ah,9  
     lea dx,s1
     int 21h
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9  
     lea dx,s2
     int 21h
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9  
     lea dx,s3
     int 21h
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     
     mov ah,9  
     lea dx,s4
     int 21h
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     
     
     mov ah,9  
     lea dx,s5
     int 21h
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
        
        
    exit:
    mov ah,4ch
    int 21
    main endp
    end main