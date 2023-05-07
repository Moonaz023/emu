 ;program to reverse a string
 .model small
 .stack 100h
 .data
  s db 100 dup(?)
  strlen db 0
 
 
 .code
 main proc
   
   mov ax,@data
   mov ds,ax 
   
        mov si,offset s
     L:
        mov ah,1
        int 21h 
        mov [si],al
        cmp [si],13 ;ascii code of enter
        je enter
        inc si
        inc strlen
        loop L 
       enter: 
       
       mov ah,2
      mov dl,10
      int 21h 
      
      mov ah,2
      mov dl,13
      int 21h
   
   mov si,offset s 
    
   mov cx,10
   
   l1:                  
   mov bx,[si]          
   push bx
   inc si          
   loop l1    
   
   
   mov cx,10
   
   l2:
    pop dx
    mov ah,2
    int 21h
   loop l2
   
    
 mov ah,4ch
 int 21h
 main endp
 end main