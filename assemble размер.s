	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	get
	.type	get, @function
get:
	pushq	%r12
	xorl	%eax, %eax
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rdx, %rbp
	movq	%rdi, %rdx
	pushq	%rbx
	movq	%rbp, %rdi
	movq	%rsi, %rbx
	leaq	.LC0(%rip), %rsi
	call	__isoc99_fscanf@PLT
	leaq	4(%r12), %rdx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	call	__isoc99_fscanf@PLT
	movq	%rbx, %rdx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	call	__isoc99_fscanf@PLT
	leaq	4(%rbx), %rdx
	movq	%rbp, %rdi
	popq	%rbx
	leaq	.LC0(%rip), %rsi
	popq	%rbp
	xorl	%eax, %eax
	popq	%r12
	jmp	__isoc99_fscanf@PLT
	.size	get, .-get
	.section	.rodata.str1.1
.LC5:
	.string	"w"
.LC6:
	.string	"output.txt"
.LC10:
	.string	"%lf"
.LC11:
	.string	"a = %d, b = %d\nintegral [%d; %d]\nresult = %lf"
.LC12:
	.string	"result = %lf"
	.text
	.globl	count
	.type	count, @function
count:
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	pushq	%r12
	movl	%edx, %r12d
	pushq	%rbp
	pushq	%rbx
	movq	%rdi, %rbx
	subq	$32, %rsp
	call	clock@PLT
	movl	4(%r14), %esi
	movl	(%r14), %ecx
	movq	%rax, %r13
	movl	4(%rbx), %r8d
	movl	(%rbx), %edi
	movl	%esi, %eax
	cvtsi2sdl	%ecx, %xmm3
	movl	%ecx, %edx
	subl	%ecx, %eax
	imull	%ecx, %edx
	cvtsi2sdl	%eax, %xmm4
	movl	%esi, %eax
	imull	%esi, %eax
	imull	%r8d, %edx
	movsd	%xmm3, 16(%rsp)
	imull	%r8d, %eax
	movaps	%xmm4, %xmm7
	movsd	%xmm4, 24(%rsp)
	divsd	.LC3(%rip), %xmm7
	imull	%ecx, %edx
	movsd	%xmm7, (%rsp)
	imull	%esi, %eax
	leaq	.LC5(%rip), %rsi
	addl	%edi, %edx
	cvtsi2sdl	%edx, %xmm2
	addl	%edi, %eax
	leaq	.LC6(%rip), %rdi
	cvtsi2sdl	%eax, %xmm0
	addsd	%xmm0, %xmm2
	mulsd	.LC4(%rip), %xmm2
	movsd	%xmm2, 8(%rsp)
	call	fopen@PLT
	movsd	8(%rsp), %xmm2
	movsd	16(%rsp), %xmm3
	movsd	24(%rsp), %xmm4
	movq	%rax, %rbp
	movl	$1, %eax
	movaps	%xmm2, %xmm0
.L4:
	cvtsi2sdl	%eax, %xmm1
	cmpl	$10, %eax
	je	.L14
	mulsd	(%rsp), %xmm1
	cvtsi2sdl	4(%rbx), %xmm0
	incl	%eax
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	cvtsi2sdl	(%rbx), %xmm1
	addsd	%xmm1, %xmm0
	jmp	.L4
.L14:
	movsd	.LC2(%rip), %xmm6
	movsd	.LC8(%rip), %xmm7
	xorps	%xmm5, %xmm5
	movq	.LC7(%rip), %xmm8
.L6:
	movaps	%xmm5, %xmm1
	subsd	%xmm0, %xmm1
	andps	%xmm8, %xmm1
	comisd	%xmm7, %xmm1
	jbe	.L15
	movaps	%xmm4, %xmm9
	movaps	%xmm2, %xmm1
	movl	$1, %eax
	divsd	%xmm6, %xmm9
.L7:
	cvtsi2sdl	%eax, %xmm0
	comisd	%xmm0, %xmm6
	jbe	.L16
	mulsd	%xmm9, %xmm0
	cvtsi2sdl	4(%rbx), %xmm1
	incl	%eax
	addsd	%xmm3, %xmm0
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sdl	(%rbx), %xmm0
	addsd	%xmm0, %xmm1
	jmp	.L7
.L16:
	movaps	%xmm5, %xmm0
	addsd	%xmm6, %xmm6
	movaps	%xmm1, %xmm5
	jmp	.L6
.L15:
	movsd	%xmm5, (%rsp)
	call	clock@PLT
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	subl	%r13d, %eax
	cvtsi2sdl	%eax, %xmm0
	movb	$1, %al
	divsd	.LC9(%rip), %xmm0
	call	__printf_chk@PLT
	testl	%r12d, %r12d
	movsd	(%rsp), %xmm5
	je	.L10
	pushq	%rax
	movl	4(%r14), %eax
	leaq	.LC11(%rip), %rdx
	movaps	%xmm5, %xmm0
	movl	(%rbx), %ecx
	movl	(%r14), %r9d
	movl	$1, %esi
	movq	%rbp, %rdi
	pushq	%rax
	movl	4(%rbx), %r8d
	movb	$1, %al
	call	__fprintf_chk@PLT
	popq	%rdx
	popq	%rcx
	jmp	.L11
.L10:
	movaps	%xmm5, %xmm0
	leaq	.LC12(%rip), %rdx
	movq	%rbp, %rdi
	movb	$1, %al
	movl	$1, %esi
	call	__fprintf_chk@PLT
.L11:
	addq	$32, %rsp
	movq	%rbp, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	jmp	fclose@PLT
	.size	count, .-count
	.globl	generate
	.type	generate, @function
generate:
	pushq	%r12
	movl	$10, %r12d
	pushq	%rbp
	movq	%rdi, %rbp
	xorl	%edi, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	call	rand@PLT
	cltd
	idivl	%r12d
	movl	%edx, 0(%rbp)
	call	rand@PLT
	cltd
	idivl	%r12d
	movl	%edx, 4(%rbp)
	call	rand@PLT
	movl	$5, %ecx
	cltd
	idivl	%ecx
	movl	%edx, (%rbx)
	call	rand@PLT
	movl	$20, %ecx
	cltd
	idivl	%ecx
	addl	$5, %edx
	movl	%edx, 4(%rbx)
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.size	generate, .-generate
	.section	.rodata.str1.1
.LC13:
	.string	"file"
.LC14:
	.string	"r"
.LC15:
	.string	"file.txt"
.LC16:
	.string	"Error opening file"
.LC17:
	.string	"gen"
.LC18:
	.string	"error"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	pushq	%r14
	pushq	%r13
	movq	%rsi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edi, %ebx
	movl	$8, %edi
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, %r12
	call	malloc@PLT
	decl	%ebx
	je	.L20
	movq	8(%r13), %r14
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rbp
	movq	%r14, %rdi
	call	strcmp@PLT
	movl	%eax, %r13d
	testl	%eax, %eax
	jne	.L21
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.L22
	leaq	.LC16(%rip), %rdi
	call	perror@PLT
	jmp	.L29
.L22:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	get@PLT
	jmp	.L24
.L21:
	leaq	.LC17(%rip), %rsi
	movq	%r14, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L20
	movq	%rbp, %rsi
	movq	%r12, %rdi
	movl	$1, %r13d
	call	generate@PLT
	jmp	.L24
.L20:
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L29:
	orl	$-1, %eax
	jmp	.L19
.L24:
	movl	%r13d, %edx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	count@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L19:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1077149696
	.align 8
.LC3:
	.long	0
	.long	1076101120
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	-350469331
	.long	1058682594
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
