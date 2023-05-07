.model small
.stack 100h

.data
 
  slen db 0
  
.code
main proc 
    
    mov ax,@data
     mov ds,ax
     
          MOV AH,1       ; prepare to read
          INT 21H         ; character in AL
WHILE_:
          CMP AL,0DH   	;CR?
          JE  END_WHILE ; yes , exit
          INC slen        ; not  CR, increment count
          INT 21H       ; read a character 
          JMP WHILE_    ; loop back
END_WHILE:

      
      mov ah,2
      mov dl,10
      int 21h 
      
      mov ah,2
      mov dl,13
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
