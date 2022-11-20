	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	get
	.type	get, @function
get:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -8(%rbp)
.L2:
	cmpl	$1, -8(%rbp)
	jle	.L3
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	addl	$1, -4(%rbp)
.L4:
	cmpl	$1, -4(%rbp)
	jle	.L5
	nop
	nop
	leave
	ret
	.size	get, .-get
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"output.txt"
.LC9:
	.string	"%lf"
	.align 8
.LC10:
	.string	"a = %d, b = %d\nintegral [%d; %d]\nresult = %lf"
.LC11:
	.string	"result = %lf"
	.text
	.globl	count
	.type	count, @function
count:
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movl	%edx, -116(%rbp)
	call	clock@PLT
	movl	%eax, -80(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-112(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -76(%rbp)
	movq	-112(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	subl	-76(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-104(%rbp), %rax
	movl	(%rax), %edx
	movq	-104(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	imull	-76(%rbp), %eax
	imull	-76(%rbp), %eax
	imull	-76(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -32(%rbp)
	movq	-104(%rbp), %rax
	movl	(%rax), %edx
	movq	-104(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	imull	-72(%rbp), %eax
	imull	-72(%rbp), %eax
	imull	-72(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -24(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-76(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-32(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	$1, -88(%rbp)
	jmp	.L7
.L8:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-76(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-88(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	-104(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	addl	$1, -88(%rbp)
.L7:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-88(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L8
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-64(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	jmp	.L9
.L12:
	movsd	-48(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-72(%rbp), %eax
	subl	-76(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	-64(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-32(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-76(%rbp), %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movl	$1, -84(%rbp)
	jmp	.L10
.L11:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-76(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-84(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	-104(%rbp), %rax
	movl	(%rax), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	-104(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	addl	$1, -84(%rbp)
.L10:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-84(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L11
	movsd	-64(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
.L9:
	movsd	-48(%rbp), %xmm0
	subsd	-56(%rbp), %xmm0
	movq	.LC6(%rip), %xmm1
	andpd	%xmm1, %xmm0
	comisd	.LC7(%rip), %xmm0
	ja	.L12
	call	clock@PLT
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	subl	-80(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC8(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC9(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	cmpl	$0, -116(%rbp)
	je	.L13
	movq	-112(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %r8d
	movq	-112(%rbp), %rax
	movl	(%rax), %edi
	movq	-104(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %ecx
	movq	-104(%rbp), %rax
	movl	(%rax), %edx
	movq	-48(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rsi, %xmm0
	movl	%r8d, %r9d
	movl	%edi, %r8d
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	jmp	.L14
.L13:
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
.L14:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	ret
	.size	count, .-count
	.globl	generate
	.type	generate, @function
generate:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movl	%eax, %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%ecx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	call	rand@PLT
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	leaq	4(%rax), %rsi
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%ecx, %edi
	sarl	$31, %edi
	subl	%edi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, (%rsi)
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	%eax
	movl	%edx, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %ecx
	sall	$2, %ecx
	addl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movq	-16(%rbp), %rdx
	movl	%eax, (%rdx)
	call	rand@PLT
	movl	%eax, %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$3, %eax
	movl	%edx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	sall	$2, %eax
	subl	%eax, %edx
	movl	%edx, %ecx
	movq	-16(%rbp), %rax
	addq	$4, %rax
	leal	5(%rcx), %edx
	movl	%edx, (%rax)
	nop
	leave
	ret
	.size	generate, .-generate
	.section	.rodata
.LC12:
	.string	"file"
.LC13:
	.string	"r"
.LC14:
	.string	"file.txt"
.LC15:
	.string	"Error opening file"
.LC16:
	.string	"gen"
.LC17:
	.string	"error"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	cmpl	$1, -36(%rbp)
	je	.L17
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	leaq	.LC13(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L19
	leaq	.LC15(%rip), %rdi
	call	perror@PLT
	movl	$-1, %eax
	jmp	.L20
.L19:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	get@PLT
	jmp	.L21
.L18:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L22
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	generate@PLT
	movl	$1, -28(%rbp)
	jmp	.L21
.L22:
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L20
.L17:
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L20
.L21:
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	count@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L20:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1076101120
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC7:
	.long	-350469331
	.long	1058682594
	.align 8
.LC8:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
