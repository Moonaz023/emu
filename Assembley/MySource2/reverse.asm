include 'emu8086.inc'
ORG 100h

  PRINTN 'Enter length of string'
  mov  ah,1
  int  21h                  
  sub  al, '0'
  mov  dl, al
                 
  printn

  print "Enter String here: "
  mov  bx, OFFSET Buffer
  mov  cx, dx
p1:  
  mov  ah, 01h
  int  21h
  mov  [bx], al
  inc  bx                   ; "post-increment"
  loop p1
  printn

  PRINT 'reversed string : '
  mov  cx, dx
p2:
  dec  bx                   ; "pre-decrement"
  mov  dl, [bx]
  mov  ah, 02h
  int  21h    
  loop p2
  printn

  mov ax, 4C00h
  int 21h

Buffer db 10 dup(0)