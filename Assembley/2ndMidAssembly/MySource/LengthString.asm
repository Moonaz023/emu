.model small
.stack 100h
.data
  a db 10,13,'Enter a string: $'
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
        cmp [si],13
        je enter
        inc si
        inc slen
        
      
      loop L  
      
      enter:
      mov dx,offset slength
      mov ah,9
      int 21h
      
       mov ah,0
       mov al,slen
      
MOV DX,0 ;DX = 0
MOV BX,10 ;BX = 10
MOV CX,0 ;CX = 0 => COUNTER REGISTER
L1:
DIV BX ;DIVIDE => AX = AX / BX
;IN CASE OF 8 BIT REGISTER => AL = QUOTIENT, AH = REMAINDER
;IN CASE OF 16 BIT REGISTER => AX = QUOTIENT, DX = REMAINDER
;AX = 2 , DX = 5
PUSH DX ;5 SAVE IN STACK
MOV DX,0 ;DX = 0
MOV AH,0 ;AX AH = 00000000, AL = QUOTIENT
INC CX ;CX = CX + 1
CMP AX,0 ;(2 == 0)
JNE L1 ;JUMP NOT EQUAL => AX != 0
MOV AH,2 ;OUTPUT/PRINT A SINGLE CHARACTER
L2:
POP DX ;FIRST TIME POP 2 AND SECOND TIME POP 5 = 25
ADD DX,48
INT 21H
LOOP L2
;OUTPUT CODE ENDS HERE
      
      
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
  end main