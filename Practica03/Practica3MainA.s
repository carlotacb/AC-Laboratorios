	.file	"Practica3MainA.c"
	.globl	v
	.data
	.align 32
	.type	v, @object
	.size	v, 40
v:
	.long	1
	.long	2
	.long	3
	.long	4
	.long	-10
	.long	-11
	.long	-12
	.long	-13
	.long	201
	.long	-150
	.section	.rodata
.LC0:
	.string	"OperaVec BIEN programado."
.LC1:
	.string	"OperaVec MAL programado."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$0, 28(%esp)
	jmp	.L2
.L5:
	movl	$0, 24(%esp)
	jmp	.L3
.L4:
	movl	$9, 4(%esp)
	movl	$v, (%esp)
	call	OperaVec
	movl	%eax, 20(%esp)
	addl	$1, 24(%esp)
.L3:
	cmpl	$999, 24(%esp)
	jle	.L4
	addl	$1, 28(%esp)
.L2:
	cmpl	$999, 28(%esp)
	jle	.L5
	cmpl	$201, 20(%esp)
	jne	.L6
	movl	$.LC0, (%esp)
	call	puts
	jmp	.L8
.L6:
	movl	$.LC1, (%esp)
	call	puts
.L8:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
