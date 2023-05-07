

.data
arr1 db 'Hello'
arr2 db 'Hello'
cnt db 05h
str1 db 'String matches $'  
str2 db 'String does not matches $'


.code 
    main proc
mov ax,data
mov ds,ax
mov es,ax

mov cl,cnt
lea si,arr1
lea di,arr2

rep cmpsb
jnz l1
lea dx,str1
jmp l2

l1:
lea dx,str2
l2:

mov ah,09h
int 21h 


 mov ah,4ch
 int 21h
main endp
end main




