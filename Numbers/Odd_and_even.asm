.model small
.stack 100h

.data

msg1 db "Enter a number between(0-9): $"
msg2 db "Odd$"
msg3 db "Even$"

d db 2

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48 
    
    div d
    
    cmp ah,0
    jz even
    
    odd:
        call new_line
        mov ah,9
        lea dx,msg2
        int 21h
        
        jmp exit
    
    even:
        call new_line
        mov ah,9
        lea dx,msg3
        int 21h
        
    exit:
        mov ah,4ch
        int 21h
        
main endp

new_line proc
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ret
new_line endp
    
     