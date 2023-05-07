.model small
.stack 100h
.data
str1 db 100 dup('$')   
strlen db ?                 
str2 db "Enter a string:$" 
str3 db "Palendrome$" 
str4 db "Not Palendrome$" 
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
        
        j2:
        inc si
        inc al
        cmp str1[si-1],'$'  
        jne j2
        
        dec al
        mov strlen,al
        
        
       mov cx,0
       mov cl,strlen
       mov si,0
       l1:
       mov ax,0
       mov al,str1[si] 
       push ax
       inc si
       loop l1
       
       mov cx,0 
       mov cl,strlen
       mov si,0
       
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h 
       
       l2:
       pop ax
       mov ah,2
       mov dl,al
       int 21h
       inc si
       loop l2
      
       

       
      



End_Programe:
mov ah,04ch
int 21h
main endp
end main