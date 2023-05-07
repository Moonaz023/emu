.model small
.stack 100h

.data
 String1 DB ‘HELLO1$’
	String2 DB 5 dup (?)
  slen db 0
  
.code
main proc 
    

	MOV AX, @Data
	MOV DS, AX
	MOV ES, AX
	LEA SI, String1
	LEA DI, String2
	CLD
	MOVSB ;	String2		
	MOVSB ;	 String2
	

	mov ah,9   
	lea Dx,String2
	int 21h

    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
