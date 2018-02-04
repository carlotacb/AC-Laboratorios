 .text
	.align 4
	.globl Ordenar
	.type Ordenar,@function
Ordenar:
        # Aqui viene vuestro codigo
        
        pushl %ebp
        movl %esp, %ebp
        subl $8, %esp
        pushl %ebx
        pushl %esi
        
        movl $0, %eax           # %eax = i
for1:   leal 8(%esp), %ecx      # %ecx = @v[]
        imull $12, %eax, %edx   # desplaçament de i
        addl %ecx, %edx
        movl 4(%edx), %edx      # %edx = v[i].k
        cmpl $0x80000000, %edx
        je fifor1
        movl $1, %ebx
        addl %eax, %ebx         # %ebx = j
for2:   imull $12, %ebx, %esi   # desplaçament de j
        addl %ecx, %esi
        movl 4(%esi), %esi      # %esi = v[j].k
        cmpl $0x80000000, %esi
        je fifor2
        cmpl %edx, %esi
        jge noif
        
        pushl %ebx  # tenim j
        pushl %eax  # tenim i
        pushl %ecx  # tenim v[]
        call Intercambiar
        addl $12, %esp        
       
noif:           
        inc %ebx
        jmp for2
fifor2: inc %eax
        jmp for1
fifor1:
        
        movl %ebp, %esp
        popl %ebp
        ret
        
