.model small
.stack 100h
.data
txt db 'Loop concept $'


.code
main proc
      mov ax, @data
      mov ds,ax
       
      mov ah,9
      lea dx,txt
      int 21h
      
      
      
       mov ah,2
      mov dl,10
      int 21h 
      
      mov ah,2
      mov dl,13
      int 21h
       ;------LOOP
      mov cx,26
      mov ah,2
      mov dl,'a'
      
      level1:
      int 21h
      inc dl
      loop level1
      
      ;-----------
      
     exit:
     mov ah,4ch
     int 21h
     main endp
end main