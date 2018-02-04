/*
void procesar(unsigned char *mata, unsigned char *matb, int n)
   int i, j;
   for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            matb[i*n+j] = (mata[i*n+j]*16);
        }
    }
}
*/


// EXERCICI 3 PREVI

        pushl %ebp
        movl %esp, %ebp
        subl $4, %ebp
        pushl %esi
        pushl %edi
        pushl %ebx

        movl $0, %ecx       # i
        movl 8(%ebp), %eax  # mata
        movl 12(%ebp), %esi # matb
        movl 16(%ebp), %edx # n
        imull %edx, %edx    # n*n

for:    cmpl %edx, %ecx
        jge fifor

        movb (%eax, %ecx), %bl
        shlb $4, %bl
        movb %bl, (%esi, %ecx)

        incl %ecx
        jmp for
fifor:


// EXERCICI 5 PREVI

        pushl %ebp
        movl %esp, %ebp
        subl $4, %ebp
        pushl %esi
        pushl %edi
        pushl %ebx

        movl $0, %ecx       # i
        movl 8(%ebp), %eax  # mata
        movl 12(%ebp), %esi # matb
        movl 16(%ebp), %edx # n
        imull %edx, %edx    # n*n

for:    cmpl %edx, %ecx
        jge fifor



        incl %ecx
        jmp for
fifor: