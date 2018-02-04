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
    
    movl 8(%ebp), %eax #@MATRIZ
    subl $4,%eax
for1:
    cmpl $3,-8(%ebp)
    jge fifor1
    movl $0,-12(%ebp) # j =0
    movl 12(%ebp), %esi # salto
    imull $4,%esi
    addl %esi,%eax #@MATRIZ + salto
    movl %eax, %edi
    addl %edi, -4(%ebp)
    incl -8(%ebp)
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
