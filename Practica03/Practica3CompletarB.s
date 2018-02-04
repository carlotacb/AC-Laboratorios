.text
	.align 4
	.globl OperaMat
	.type	OperaMat, @function
OperaMat:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
# Aqui has de introducir el codigo
    movl $0,-4(%ebp) # res = 0
    movl $0,-8(%ebp) #i = 0
    
for1:
    cmpl $3,-8(%ebp)
    jge fifor1
    movl $0,-12(%ebp) # j =0
for2:
     cmpl $3,-12(%ebp)
     jge fifor2
     movl 8(%ebp),%ebx #ebx = @mat
     imul $3,-8(%ebp),%esi #i*3
     addl -12(%ebp),%esi #(i*3)+j
     movl (%ebx,%esi,4),%esi #(@mat+(i*3)+j)*4
     addl %esi,-4(%ebp) #res += (@mat+(i*3)+j)*
     movl 12(%ebp),%edi # edi = salto
     addl %edi,-12(%ebp) #increment
     jmp for2
fifor2:
        movl 12(%ebp),%edi # edi = salto
        addl %edi,-8(%ebp) #increment
        jmp for1
fifor1:
     


    

# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax
	popl	%edi
	popl	%esi
	popl	%ebx	
	movl %ebp,%esp
	popl %ebp
	ret
