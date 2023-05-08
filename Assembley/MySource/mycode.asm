.model small
.stack 100h
.data
str1 db 100 dup('$')   
strlen db ?
strlen2 db ?                 
str2 db "Enter a string:$" 
str3 db "Palendrome$" 
str4 db "Not Palendrome$" 
str5 db 100 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,str2
    mov ah,9
    int 21h 
    
    mov bx,0 
    j1:
    mov ah,1
    int 21h
    cmp al,13
    je plndrmCK 
    mov str1[bx],al
    inc bx 
    jne j1
    
    
    plndrmCK:
    
        mov si,0
        mov al,0
        mov di,0
        
        j2:
        inc si
        inc al
        inc di
        ;cmp str1[si-1],'$'
        ;je End_Programe2
        cmp str1[si-1],' '
        je word
        mov ah,str1[si-1]
        mov str5[di-1],ah  
        jne j2
        
       
        
       
       word:
        dec al
        mov strlen,al
        
        
        
      wpc:
        
       mov cx,0
       mov cl,strlen
       mov si,0
       l1:
       mov ax,0
       mov al,str5[si] 
       push ax
       inc si
       loop l1
       
       mov cx,0 
       mov cl,strlen
       mov si,0
       l2:
       pop ax
       cmp al,str5[si]
       jne no
       inc si
       loop l2
       jmp yes
       
       no:
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
       
       lea dx,str4
       mov ah,9
       int 21h
       
       mov str5,'$'
       mov al,strlen
       inc al
       inc al
       
       mov si,ax
       mov ah,2
       mov dx,si
       int 21h
       mov al,0
       mov di,0
       jmp j2
       ;jmp End_Programe
       
       yes:
        
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
        lea dx,str5
        mov ah,9
        int 21h
        
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       lea dx,str3
       mov ah,9
       int 21h 
       jmp End_Programe

End_Programe2:
 mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       lea dx,str4
       mov ah,9
       int 21h
       
       
       jmp End_Programe

End_Programe:
mov ah,04ch
int 21h
main endp
end main 

