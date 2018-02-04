/*
int rutina(v[20], limite) {
    int i, resultado;
    i = 1;
    resultado = 0;
    
    while (i < limite) {
        if (v[i] != 5) {
            calle(&resultado);
        }
        ++i;
    }
    return resultado;
} 
*/

rutina:

    pushl   %ebp
    movl    %esp, %ebp
    subl    $8, %esp
    pushl   %ebx
    pushl   %esi

    movl    $1, %ecx        # i = 1 (i --> %ecx)
    movl    $0, -4(%ebp)        # resultado = 0 (resultado --> %eax)
    movl    8(%ebp), %ebx   # (@V --> %ebx)
    
while:
    cmpl     12(%ebp), %ecx
    jge     fiwhile
        
    movl    (%ebx, %ecx, 4), %edx   # (v[i] --> %edx)

    cmpl     $5, %edx
    je      end
    leal    -4(%ebp), %esi
    pushl   %esi
    call    calle
    addl    $4, %esp
    
end:
    incl    %ecx
    jmp     while
    
fiwhile:
    movl    -4(%ebp), %eax
    popl    %esi
    popl    %ebx
    movl    %ebp, %esp
    popl    %ebp
    ret
    
    
    
