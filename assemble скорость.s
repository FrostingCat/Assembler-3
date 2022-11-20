	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4
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
.LC12:
	.string	"%lf"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"a = %d, b = %d\nintegral [%d; %d]\nresult = %lf"
	.section	.rodata.str1.1
.LC14:
	.string	"result = %lf"
	.text
	.p2align 4
	.globl	count
	.type	count, @function
count:
	pushq	%r15
	pushq	%r14
	movq	%rsi, %r14
	pushq	%r13
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	movl	%edx, %ebx
	subq	$24, %rsp
	call	clock@PLT
	movl	4(%r14), %esi
	movl	(%r14), %ecx
	pxor	%xmm5, %xmm5
	movq	%rax, %rbp
	movl	4(%r13), %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	%esi, %eax
	movl	%ecx, %edx
	pxor	%xmm8, %xmm8
	subl	%ecx, %eax
	imull	%ecx, %edx
	cvtsi2sdl	%eax, %xmm5
	movl	%esi, %eax
	imull	%esi, %eax
	imull	%edi, %edx
	cvtsi2sdl	%ecx, %xmm8
	imull	%edi, %eax
	leaq	.LC6(%rip), %rdi
	movsd	%xmm5, 8(%rsp)
	imull	%ecx, %edx
	addl	0(%r13), %edx
	cvtsi2sdl	%edx, %xmm0
	imull	%esi, %eax
	addl	0(%r13), %eax
	leaq	.LC5(%rip), %rsi
	movsd	%xmm8, (%rsp)
	cvtsi2sdl	%eax, %xmm1
	addsd	%xmm1, %xmm0
	mulsd	.LC4(%rip), %xmm0
	movq	%xmm0, %r15
	call	fopen@PLT
	movsd	8(%rsp), %xmm5
	pxor	%xmm10, %xmm10
	movsd	(%rsp), %xmm8
	cvtsi2sdl	4(%r13), %xmm10
	pxor	%xmm9, %xmm9
	pxor	%xmm3, %xmm3
	movq	.LC9(%rip), %xmm6
	movapd	%xmm5, %xmm0
	divsd	.LC7(%rip), %xmm0
	cvtsi2sdl	0(%r13), %xmm9
	movq	%rax, %r12
	mulsd	.LC8(%rip), %xmm0
	movsd	.LC10(%rip), %xmm7
	movapd	%xmm0, %xmm1
	movapd	%xmm10, %xmm0
	addsd	%xmm8, %xmm1
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	movapd	%xmm3, %xmm1
	addsd	%xmm9, %xmm0
	subsd	%xmm0, %xmm1
	andpd	%xmm6, %xmm1
	comisd	%xmm7, %xmm1
	jbe	.L20
	movsd	.LC2(%rip), %xmm1
	movsd	.LC3(%rip), %xmm4
	.p2align 4,,10
	.p2align 3
.L10:
	comisd	%xmm4, %xmm1
	movapd	%xmm5, %xmm11
	movl	$1, %eax
	divsd	%xmm1, %xmm11
	movapd	%xmm4, %xmm0
	jbe	.L21
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$1, %eax
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L9
	mulsd	%xmm11, %xmm2
	movapd	%xmm10, %xmm0
	addsd	%xmm8, %xmm2
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	mulsd	%xmm0, %xmm2
	addsd	%xmm9, %xmm2
.L7:
	movapd	%xmm2, %xmm0
	addsd	%xmm1, %xmm1
	subsd	%xmm3, %xmm0
	andpd	%xmm6, %xmm0
	comisd	%xmm7, %xmm0
	jbe	.L5
	movapd	%xmm2, %xmm3
	jmp	.L10
.L20:
	movapd	%xmm3, %xmm2
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	%xmm2, (%rsp)
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC12(%rip), %rsi
	subl	%ebp, %eax
	cvtsi2sdl	%eax, %xmm0
	movl	$1, %eax
	divsd	.LC11(%rip), %xmm0
	call	__printf_chk@PLT
	testl	%ebx, %ebx
	movsd	(%rsp), %xmm2
	je	.L11
	movl	4(%r14), %eax
	subq	$8, %rsp
	movl	(%r14), %r9d
	movapd	%xmm2, %xmm0
	movl	4(%r13), %r8d
	movl	0(%r13), %ecx
	movl	$1, %esi
	movq	%r12, %rdi
	pushq	%rax
	leaq	.LC13(%rip), %rdx
	movl	$1, %eax
	call	__fprintf_chk@PLT
	popq	%rax
	popq	%rdx
.L12:
	addq	$24, %rsp
	movq	%r12, %rdi
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	jmp	fclose@PLT
	.p2align 4,,10
	.p2align 3
.L21:
	movq	%r15, %xmm2
	jmp	.L7
.L11:
	movapd	%xmm2, %xmm0
	movl	$1, %esi
	movq	%r12, %rdi
	movl	$1, %eax
	leaq	.LC14(%rip), %rdx
	call	__fprintf_chk@PLT
	jmp	.L12
	.size	count, .-count
	.p2align 4
	.globl	generate
	.type	generate, @function
generate:
	pushq	%rbp
	movq	%rdi, %rbp
	xorl	%edi, %edi
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	call	rand@PLT
	movl	%eax, %edx
	cltq
	imulq	$1717986919, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$34, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, 0(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	cltq
	imulq	$1717986919, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$34, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, 4(%rbp)
	call	rand@PLT
	movl	%eax, %edx
	cltq
	imulq	$1717986919, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$33, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %edx
	movl	%edx, (%rbx)
	call	rand@PLT
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1717986919, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$35, %rdx
	subl	%ecx, %edx
	leal	(%rdx,%rdx,4), %edx
	sall	$2, %edx
	subl	%edx, %eax
	addl	$5, %eax
	movl	%eax, 4(%rbx)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.size	generate, .-generate
	.section	.rodata.str1.1
.LC15:
	.string	"file"
.LC16:
	.string	"r"
.LC17:
	.string	"file.txt"
.LC18:
	.string	"Error opening file"
.LC19:
	.string	"gen"
.LC20:
	.string	"error"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%r13
	pushq	%r12
	movl	%edi, %r12d
	movl	$8, %edi
	pushq	%rbp
	pushq	%rbx
	movq	%rsi, %rbx
	subq	$8, %rsp
	call	malloc@PLT
	movl	$8, %edi
	movq	%rax, %r13
	call	malloc@PLT
	cmpl	$1, %r12d
	je	.L26
	movq	%rax, %rbp
	movq	8(%rbx), %rax
	movl	$5, %ecx
	leaq	.LC15(%rip), %rdi
	movq	%rax, %rsi
	repz cmpsb
	seta	%r12b
	sbbb	$0, %r12b
	movsbl	%r12b, %r12d
	testl	%r12d, %r12d
	je	.L35
	movq	%rax, %rsi
	movl	$4, %ecx
	leaq	.LC19(%rip), %rdi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L26
	movq	%rbp, %rsi
	movq	%r13, %rdi
	movl	$1, %r12d
	call	generate@PLT
.L30:
	movl	%r12d, %edx
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	count@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbp, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L25:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L35:
	leaq	.LC16(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	fopen@PLT
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.L36
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	get@PLT
	jmp	.L30
.L26:
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	orl	$-1, %eax
	jmp	.L25
.L36:
	leaq	.LC18(%rip), %rdi
	call	perror@PLT
	orl	$-1, %eax
	jmp	.L25
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1077149696
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.align 8
.LC7:
	.long	0
	.long	1076101120
	.align 8
.LC8:
	.long	0
	.long	1075970048
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC9:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	-350469331
	.long	1058682594
	.align 8
.LC11:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
