MOV    DX, 0       ; DX count characters 
MOV    AH, 1       ; prepare to read
INT    21H         ; character in AL
WHILE_:
CMP    AL,0DH   	;CR?
JE     END_WHILE    	; yes , exit
INC     DX                     ; not  CR, increment count
INT     21H                   ; read a character 
JMP    WHILE_           	 ; loop back 

END_WHILE:
