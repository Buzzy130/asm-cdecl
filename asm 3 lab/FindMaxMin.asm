.386
.MODEL FLAT
.DATA
LARGE DB ?
SMALL DB ?
mass DB 2 dup (?)
.CODE
FindMax PROC C
    push ebp
    mov ebp, esp
    push edi
    push esi

    mov edi, [ebp + 8]   ; str
    mov ecx, [ebp + 12]  ; len
    mov al, [edi]        ; первый символ
    mov LARGE, al
    mov SMALL, al
    inc edi              ; переход к следующему символу

    loop_start:
        mov al, [edi]    ; текущий символ
        cmp LARGE, al ; сравнение с maxChar
        jg for_min
        mov LARGE, al ; обновление maxChar
    for_min:
        cmp SMALL, al ; сравнение с minChar
        jl next_char
        mov SMALL, al
        mov SMALL, al ; обновление minChar
    next_char:
        inc edi           ; переход к следующему символу
        loop loop_start

    pop esi
    pop edi
    pop ebp
    mov al, LARGE
    ret
FindMax ENDP

FindMin PROC C
push ebp
    mov ebp, esp
    push edi
    push esi

    mov edi, [ebp + 8]   ; указатель на str
    mov ecx, [ebp + 12]  ; указатель на len str
    mov al, [edi]        ; первый символ
    mov LARGE, al
    mov SMALL, al
    inc edi              ; переход к следующему символу

    loop_start:
        mov al, [edi]    ; текущий символ
        cmp LARGE, al ; сравнение с maxChar
        jg for_min
        mov LARGE, al ; обновление maxChar
    for_min:
        cmp SMALL, al ; сравнение с minChar
        jl next_char
        mov SMALL, al
        mov SMALL, al ; обновление minChar
    next_char:
        inc edi           ; переход к следующему символу
        loop loop_start

    pop esi
    pop edi
    pop ebp
    mov al, SMALL
    ret
FindMin ENDP
END