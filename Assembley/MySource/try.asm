.model small
.stack 100h
.data
	str1 db 100 DUP('$')
	lengthOfString db ?
	str2 db "Enter String: $"
	str3 db "Not Palindrome$"
	str4 db "Palindrome$"
.code
main proc
	mov ax,@data
	mov ds,ax
	
	LEA dx, str2
	mov ah,09h
	int 21h
	
	mov bx,0
	J1:
		mov ah,01h
		int 21h
		
		CMP al,13
		JE Check_if_palindrome:
		
		mov str1[bx], al
		INC bx
	JNE J1

	
		 
			
			
		Check_if_palindrome:
			mov si,0
			mov al,0
			J4:
				INC si
				INC al
				CMP str1[si - 1], '$'
			JNE J4
			
			DEC al
			mov lengthOfString,al
			
			mov cx,0
			mov cl,lengthOfString
			mov si,0
			L1:
				mov ax,0
				mov al,str1[si]
				PUSH ax
				INC si
			LOOP L1
			
			
			mov al,lengthOfString

			
			mov cx,0
			mov cl,al
			mov si,0
			L2:
				POP ax
				CMP al,str1[si]
				JNE Not_Palindrome
				INC si
			LOOP L2
			
			JMP Palindrome
			
			Not_Palindrome:
			 mov ah,2
             mov dl,10
             int 21h
             mov dl,13
             int 21h 
             
				LEA dx,str3
				mov ah,09h
				int 21h
				JMP End_Programe
				
			Palindrome:  
			
			 mov ah,2
             mov dl,10
             int 21h
             mov dl,13
             int 21h
              
				LEA dx,str4
				mov ah,09h
				int 21h
			
	End_Programe:
	mov ah,04ch
	int 21h
main endp
end main