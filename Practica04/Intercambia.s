 .text
	.align 4
	.globl Intercambiar
	.type Intercambiar,@function
Intercambiar:
        # Aqui viene vuestro codigo
        
        pushl %ebp
        movl %esp, %ebp
        subl $12, %esp      # per pujar el esp a 
        
        
        #### PREGUNTARLI AL PROFE ESP!!! 
        
        pushl %ebx
        
        leal 8(%ebp), %eax  # %eax = @ v[]
        
        #s      = v[i].c;
        #v[i].c = v[j].c;
        #v[j].c = s;
        
        imull $12, 20(%ebp), %ecx  # desplaçament de i        
        addl %eax, %ecx  #tenim v[i]
        movb (%ecx), %bl  # %ecx = @v[i].c // %bl = valor de s
        movb %bl, -1(%ebp)  # s = v[i].c 
        
        imull $12, 24(%ebp), %edx  #desplaçament de j
        addl %eax, %edx    # tenim v[j]
        movb (%edx), %dl  # %dl = v[j].c
        movb %dl, (%ecx)  # v[i].c = v[j].c
        
        movb %bl, (%edx)  # v[j].c = s
        
        #tmp    = v[i].k;
        #v[i].k = v[j].k;
        #v[j].k = tmp;
        
        imull $12, 20(%ebp), %ecx # desplaçament de i
        addl %eax, %ecx
        movl 4(%ecx), %ebx  # %ecx = @v[i].k // %ebx = valor de tmp
        movl %ebx, -12(%ebp)  # tmp = v[i].k
        
        imull $12, 24(%ebp), %edx  #desplaçament de j
        addl %eax, %edx    # tenim v[j]
        movl 4(%edx), %edx  # %edx = v[j].k
        movl %edx, (%ecx)  # v[i].k = v[j].k
        
        movl %ebx, (%edx)  # v[j].k = tmp
        
        #aux    = v[i].m;
        #v[i].m = v[j].m;
        #v[j].m = aux;
        
        imull $12, 20(%ebp), %ecx # desplaçament de i
        addl %eax, %ecx
        movl 8(%ecx), %ebx  # %ecx = @v[i].k // %ebx = valor de tmp
        movl %ebx, -8(%ebp)  # tmp = v[i].k
        
        imull $12, 24(%ebp), %edx  #desplaçament de j
        addl %eax, %edx    # tenim v[j]
        movl 8(%edx), %edx  # %edx = v[j].k
        movl %edx, (%ecx)  # v[i].k = v[j].k
        
        movl %ebx, (%edx)  # v[j].k = tmp
        
        popl %ebx
        movl %ebp, %esp
        popl %ebp
        ret
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
