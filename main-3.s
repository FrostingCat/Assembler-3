	.section	.rodata
.LC10:
	.string	"file"
.LC11:
	.string	"r"
.LC12:
	.string	"file.txt"
.LC13:
	.string	"Error opening file"
.LC14:
	.string	"gen"
.LC15:
	.string	"error"
	.text
	.globl	main
	.type	main, @function
main:
    pushq   %r15
    pushq   %r14
    pushq   %r13
    pushq   %r12
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp        	# пролог и выравниваем стека
	movq	%rdi, %r15	        # перемещаем argc в регистр
	movq	%rsi, %r14	        # перемещаем argv в регистр
	movl	$8, %edi
	call	malloc@PLT	        # выделяем память под ab
	movq	%rax, %r13
	movl	$8, %edi
	call	malloc@PLT	        # выделяем память под pred
	movq	%rax, %r12
	movl	$0, -28(%rbp)	    # gen = 0
	cmpq	$1, %r15	        # argc сравниваем с 1
	je	.L17
	movq	%r14, %rax
	addq	$8, %rax	        # argv[1]
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT	        # сравниваем argv[1] с file
	testl	%eax, %eax
	jne	.L18                	# если не равны, прыгаем по метке
	leaq	.LC11(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	fopen@PLT	        # открываем файл
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)	    # File сравниваем с 0
	jne	.L19	                # если не 0
	leaq	.LC13(%rip), %rdi
	call	perror@PLT	        # выводим ошибку
	movl	$-1, %eax	        # возвращаем -1
	jmp	.L20
.L19:
	movq	-8(%rbp), %rdx
	movq	%r12, %rcx
	movq	%r13, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	get@PLT	            # вызываем функцию get
	jmp	.L21
.L18:
	movq	%r14, %rax
	addq	$8, %rax	        # argv[1]
	movq	(%rax), %rax
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT	        # сравниваем argv[1] с file
	testl	%eax, %eax
	jne	.L22
	movq	%r12, %rdx
	movq	%r13, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	generate@PLT	    # вызываем функцию generate
	movl	$1, -28(%rbp)	    # gen = 1
	jmp	.L21
.L22:
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT	        # выводим ошибку
	movl	$-1, %eax	        # return(-1)
	jmp	.L20
.L17:
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT	        # выводим ошибку
	movl	$-1, %eax           # return(-1)
	jmp	.L20
.L21:
	movl	-28(%rbp), %edx
	movq	%r12, %rcx
	movq	%r13, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	count@PLT	        # вызываем функцию count
	movq	%r13, %rax
	movq	%rax, %rdi
	call	free@PLT	        # освобождаем память массива ab
	movq	%r12, %rax
	movq	%rax, %rdi
	call	free@PLT	        # освобождаем память массива pred
	movl	$0, %eax	        # return 0
.L20:
	leave	
    popq %r12
    popq %r13
    popq %r14
    popq %r15
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
