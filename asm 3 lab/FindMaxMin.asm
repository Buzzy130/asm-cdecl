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
    mov al, [edi]        ; ������ ������
    mov LARGE, al
    mov SMALL, al
    inc edi              ; ������� � ���������� �������

    loop_start:
        mov al, [edi]    ; ������� ������
        cmp LARGE, al ; ��������� � maxChar
        jg for_min
        mov LARGE, al ; ���������� maxChar
    for_min:
        cmp SMALL, al ; ��������� � minChar
        jl next_char
        mov SMALL, al
        mov SMALL, al ; ���������� minChar
    next_char:
        inc edi           ; ������� � ���������� �������
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

    mov edi, [ebp + 8]   ; ��������� �� str
    mov ecx, [ebp + 12]  ; ��������� �� len str
    mov al, [edi]        ; ������ ������
    mov LARGE, al
    mov SMALL, al
    inc edi              ; ������� � ���������� �������

    loop_start:
        mov al, [edi]    ; ������� ������
        cmp LARGE, al ; ��������� � maxChar
        jg for_min
        mov LARGE, al ; ���������� maxChar
    for_min:
        cmp SMALL, al ; ��������� � minChar
        jl next_char
        mov SMALL, al
        mov SMALL, al ; ���������� minChar
    next_char:
        inc edi           ; ������� � ���������� �������
        loop loop_start

    pop esi
    pop edi
    pop ebp
    mov al, SMALL
    ret
FindMin ENDP
END