.text
	.align 4
	.globl OperaVec
	.type	OperaVec, @function
OperaVec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
# Aqui has de introducir el codigo
	movl $1, -8(%ebp) #i = 1
	movl -8(%ebp),%edx # guardem i a edx
for: 	
	cmpl 12(%ebp),%edx
	jge fifor
if:
	movl 8(%ebp), %eax 
	movl 8(%eax,%edx,4),%ebx #edx*4+ebpposicio del v[i]
	cmpl -4(%ebp),%ebx
	jle fi_if
	movl %ebx,-4(%ebp) # res = v[i]
fi_if:	
	incl %edx
	jmp for
fifor:
# El final de la rutina ya esta programado
	movl	-4(%ebp), %eax 
	popl	%edi
	popl	%esi
	popl	%ebx
	movl %ebp,%esp
	popl %ebp
	ret

	
	
    
    #movl 8(%ecx,%ebx,4),%edx 
