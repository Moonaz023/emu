.model small
.stack 100h
.data
msg db 3
reply db ?

.code
main proc
      mov ax, @data
      mov ds,ax
      
      mov ah,2
      add msg,48
      mov dl,msg
      int 21h
      
      mov ah,2
      mov dl,10
      int 21h
      
      mov ah,1
      int 21h
      mov reply,al 
      
       mov ah,2
      mov dl,10
      int 21h
      
      mov ah,2
      mov dl,reply
      int 21h
      
     exit:
     mov ah,4ch
     int 21h
     main endp
end main