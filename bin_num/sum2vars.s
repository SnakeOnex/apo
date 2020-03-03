	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sum %d + %d -> %d\n"
.LC1:
	.string	"sum 0x%x + 0x%x -> 0x%x\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	var_a(%rip), %esi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	movl	var_b(%rip), %edx
	leal	(%rsi,%rdx), %ecx
	movl	%ecx, var_c(%rip)
	call	printf@PLT
	movl	var_b(%rip), %edx
	xorl	%eax, %eax
	movl	var_c(%rip), %ecx
	movl	var_a(%rip), %esi
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	xorl	%eax, %eax
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	var_c
	.data
	.align 4
	.type	var_c, @object
	.size	var_c, 4
var_c:
	.long	13107
	.globl	var_b
	.align 4
	.type	var_b, @object
	.size	var_b, 4
var_b:
	.long	8738
	.globl	var_a
	.align 4
	.type	var_a, @object
	.size	var_a, 4
var_a:
	.long	4660
	.ident	"GCC: (Debian 9.2.1-28) 9.2.1 20200203"
	.section	.note.GNU-stack,"",@progbits
