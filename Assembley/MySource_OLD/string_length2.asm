.model small
.stack 100h
.data
  a db 'Enter a string: $'
  b db 100 dup('$')           ;100 is the size of the array 
  slength db 10,13,'Lenth: $' 
  slen db 0
  

.code
  main proc
     mov ax,@data
     mov ds,ax
     
     mov dx,offset a
     mov ah,9
     int 21h
     
     mov si,offset b
     L:
        mov ah,1
        int 21h 
        mov [si],al
        cmp [si],13 ;ascii code of enter
        je enter
        inc si
        inc slen
        
      
      loop L  
      
      enter:
      mov dx,offset slength
      mov ah,9
      int 21h
      
      
      mov dl,slen 
      add dl,48
      mov ah,2
      int 21h
      
      
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
  end main