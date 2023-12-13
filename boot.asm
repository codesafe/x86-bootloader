; https://www.youtube.com/watch?v=Hc5EiQ2GsrI
; https://www.youtube.com/watch?v=48dFP4PBHII

; boot loader BIOS magic number
org 0x7c00
;bits 16

start:
    mov si, stringtest
    mov bx, 0

loop:    
    ;lodsb
    mov al, [si]
    cmp al, 0
    je done
    call printf
    inc si
    jmp loop
	
done:
    jmp $	; jump to current address = infinite loop

printf:
    mov ah, 0x0e
    int 0x10
    ret


stringtest: 
    db '---------- Welcome to C5-Os !! ----------', 0

times 510-($-$$) db 0     ; fill the rest of the sector ( 처음 510 바이트 ) with 0
dw 0xAA55                   ; boot signature

