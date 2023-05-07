section .data
sentence db 'A man a plan a canal Panama', 0
length equ $-sentence

section .text
global _start

_start:
    ; set up registers
    mov esi, sentence ; source address
    mov ecx, length ; loop counter
    xor edx, edx ; clear edx for string length
    mov ebx, 0 ; palindrome flag
    push ecx ; save loop counter for later

check_word:
    ; find end of current word
    mov al, byte [esi + edx] ; get next character
    cmp al, 0 ; check for end of string
    je end_check_word ; if end of string, skip to end of loop
    cmp al, ' ' ; check for space
    jne continue_word ; if not a space, continue current word
    cmp ebx, 0 ; check if current word was a palindrome
    je check_next_word ; if not a palindrome, move to next word
    ; if current word was a palindrome, print message and exit
    mov eax, 4 ; system call for write
    mov ebx, 1 ; file descriptor for stdout
    mov ecx, palindrome_msg ; address of message
    mov edx, palindrome_msg_len ; length of message
    int 0x80 ; make system call to write message
    jmp end_program ; end program

continue_word:
    ; check if current word is a palindrome
    mov al, byte [esi + edx] ; get next character
    cmp al, 'A' ; check for uppercase letter
    jl lowercase ; if not uppercase, check for lowercase
    cmp al, 'Z' ; check for end of uppercase letters
    jle check_palindrome ; if still uppercase, continue check
    add al, 32 ; convert to lowercase
    jmp check_palindrome

lowercase:
    cmp al, 'a' ; check for lowercase letter
    jl continue_word ; if not lowercase, continue current word
    cmp al, 'z' ; check for end of lowercase letters
    jle check_palindrome ; if still lowercase, continue check

check_palindrome:
    ; compare first and last characters of current word
    cmp al, byte [esi + edx - 1] ; compare with last character
    jne end_current_word ; if not a match, end current word
    ; if first and last characters match, check next pair
    inc edx ; increment string length
    mov al, byte [esi + edx] ; get next character
    cmp al, 0 ; check for end of string
    je end_current_word ; if end of string, end current word
    cmp al, ' ' ; check for space
    je end_current_word ; if space, end current word
    ; if not a space, compare with last character
    cmp al, byte [esi + edx - 2] ; compare with previous character
    jne end_current_word ; if not a match, end current word
    ; if first and last characters match, and current length is odd, palindrome is confirmed
    cmp edx, 1 ; check if string length is odd
    jne continue_word ; if even, continue check
    mov ebx, 1 ; set palindrome flag
    jmp continue_word ; continue check

end_current_word:
    ; reset string length and continue to next word
    xor edx, edx ; clear string length
    jmp check_next_word

check_next_word:
    ; find start of next word
    inc esi ; move
