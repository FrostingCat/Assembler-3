	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	get
	.type	get, @function
get:
    pushq   %r15
    pushq   %r14
    pushq   %r13
    pushq   %r12 
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp    	# пролог + выравнивание стека
	movq	%rdi, %r15	    # a помещаем в регистр
	movq	%rsi, %r14	    # b помещаем в регистр
	movq	%rdx, %r13	    # file помещаем в регистр
	movq	$0, %r12	    # кладем 0 в i
	jmp	.L2	                # начинаем цикл
.L3:
	movq	%r12, %rax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	%r15, %rax
	addq	%rax, %rdx
	movq	%r13, %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT    # считываем значение из файла и записываем в a[i]
	addq	$1, %r12	    # прибавляем 1 к i
.L2:
	cmpq	$1, %r12	    # сравниваем i с 1
	jle	.L3	                # если меньше или равно, прыгаем в метку
	movl	$0, -4(%rbp)	# аналогично начинаем второй цикл
	jmp	.L4	#
.L5:
	movl	-4(%rbp), %eax	# i, tmp91
	cltq
	leaq	0(,%rax,4), %rdx	#, _5
	movq	%r14, %rax
	addq	%rax, %rdx
	movq	%r13, %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT	# записываем по адресу b[i]
	addl	$1, -4(%rbp)
.L4:
	cmpl	$1, -4(%rbp)
	jle	.L5
	nop	
	nop	
	leave	
    popq %r12
    popq %r13
    popq %r14
    popq %r15
	ret	
	.size	get, .-get
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"output.txt"
	.align 8
.LC8:
	.string	"a = %d, b = %d\nintegral [%d; %d]\nresult = %lf"
.LC9:
	.string	"result = %lf"
	.text
	.globl	count
	.type	count, @function
count:
    pushq   %r15
    pushq   %r14
    pushq   %r13
    pushq   %r12
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp	    # пролог и выравнивание стека
	movq	%rdi, %r15	    # адрес ab помещаем в регистр
	movq	%rsi, %r14	    # адрес pred помещаем в регистр
	movq	%rdx, %r13	    # значение gen помещаем в регистр
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)	# помещаем 10 в стек
	movq	%r14, %rax	
	movl	(%rax), %eax
	movq	%rax, %r12	    # помещаем значение pred[0] в регистр
	movq	%r14, %rax
	movl	4(%rax), %eax
	movl	%eax, -68(%rbp)	# помещаем значение pred[1] в регистр
	movl	-68(%rbp), %eax	
	subq	%r12, %rax	    # b - a
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	-64(%rbp), %xmm0	# (b - a) / n
	movsd	%xmm0, -40(%rbp)
	movq	%r15, %rax
	movl	(%rax), %edx	# записываем ab[0]
	movq	%r15, %rax
	addq	$4, %rax
	movl	(%rax), %eax	# записываем ab[1]
	imulq	%r12, %rax
	imulq	%r12, %rax
	imulq	%r12, %rax	    # a * a * a * ab[1]
	addl	%edx, %eax	    # ab[0] + ab[1] * a * a * a
	pxor	%xmm0, %xmm0	
	cvtsi2sdl	%eax, %xmm0	
	movsd	%xmm0, -32(%rbp)    # записываем результат
	movq	%r15, %rax
	movl	(%rax), %edx
	movq	%r15, %rax
	addq	$4, %rax
	movl	(%rax), %eax
	imull	-68(%rbp), %eax
	imull	-68(%rbp), %eax
	imull	-68(%rbp), %eax
	addl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -24(%rbp)	# записываем результат ab[0] + ab[1] * b * b * b
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%r12, %xmm0
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)	# значение a + step помещаем в стек
	movsd	-32(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0	# fb + fa
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)	# (fa + fb) / 2
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT	        # открываем "output.txt"
	movq	%rax, -8(%rbp)
	movl	$1, -80(%rbp)	    # записываем 1 в i
	jmp	.L7
.L8:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r12, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-80(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0	# i * step
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)	# результат a + i * step записываем в регистр
	movq	%r15, %rax
	movl	(%rax), %eax	# ab[0]
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	%r15, %rax
	addq	$4, %rax
	movl	(%rax), %eax	# ab[1]
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0	# ab[1] * x * x * x
	addsd	%xmm1, %xmm0	    # ab[0] + ab[1] * x * x * x
	movsd	%xmm0, -56(%rbp)
	addl	$1, -80(%rbp)	    # i + 1
.L7:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-80(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	comisd	%xmm1, %xmm0	# сравниваем i  с n
	ja	.L8
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)	# res2 = 0
	movsd	-64(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)	# n *= 2
	jmp	.L9
.L12:
	movsd	-48(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)	# res1 = res2
	movl	-68(%rbp), %eax
	subq	%r12, %rax	        # b - a
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	divsd	-64(%rbp), %xmm0	# (b - a) / n
	movsd	%xmm0, -40(%rbp)	# step = (b - a) / n
	movsd	-32(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0	# fa + fb
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm1, %xmm0	    # (fa + fb) / 2
	movsd	%xmm0, -48(%rbp)	# res2 = (fa + fb) / 2
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%r12, %xmm0	
	movsd	-40(%rbp), %xmm1
	addsd	%xmm1, %xmm0	    # a + step
	movsd	%xmm0, -16(%rbp)	# x = a + step
	movl	$1, -76(%rbp)	    # i = 1
	jmp	.L10
.L11:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r12, %xmm1	
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-76(%rbp), %xmm0
	mulsd	-40(%rbp), %xmm0	    # i * step;
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)	    # x = a + i * step
	movq	%r15, %rax
	movl	(%rax), %eax	    # ab[0]
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movq	%r15, %rax
	addq	$4, %rax	        # ab[1]
	movl	(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0
	mulsd	-16(%rbp), %xmm0	# ab[1] * x * x * x
	addsd	%xmm1, %xmm0	    # ab[0] + ab[1] * x * x * x
	movsd	%xmm0, -48(%rbp)
	addl	$1, -76(%rbp)	    # i + 1
.L10:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-76(%rbp), %xmm1
	movsd	-64(%rbp), %xmm0
	comisd	%xmm1, %xmm0	    # сравниваем i с n
	ja	.L11	#,
	movsd	-64(%rbp), %xmm0
	addsd	%xmm0, %xmm0	    
	movsd	%xmm0, -64(%rbp)    # n *= 2
.L9:
	movsd	-48(%rbp), %xmm0
	subsd	-56(%rbp), %xmm0	# res2 - res1
	movq	.LC6(%rip), %xmm1
	andpd	%xmm1, %xmm0	    # fabs(res2 - res1)
	comisd	.LC7(%rip), %xmm0	# сравниваем fabs(res2 - res1) с 0.0001
	ja	.L12
	cmpq	$0, %r13	        # gen = 0?
	je	.L13
	movq	%r14, %rax
	addq	$4, %rax	        # pred[1]
	movl	(%rax), %r8d
	movq	%r14, %rax
	movl	(%rax), %edi	    # pred[0]
	movq	%r15, %rax
	addq	$4, %rax	        # ab[1]
	movl	(%rax), %ecx
	movq	%r15, %rax	        # ab[0]
	movl	(%rax), %edx
	movq	-48(%rbp), %rsi	    # перемещаем res2
	movq	-8(%rbp), %rax	    # перемещаем output
	movq	%rsi, %xmm0
	movl	%r8d, %r9d
	movl	%edi, %r8d
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT	        # выводим результат
	jmp	.L14
.L13:
	movq	-48(%rbp), %rdx	    # перемещаем res2
	movq	-8(%rbp), %rax	    # перемещаем output
	movq	%rdx, %xmm0
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT	        # выводим результат
.L14:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT	        # закрываем файл
	nop	
	leave	
    popq %r12
    popq %r13
    popq %r14
    popq %r15
	ret	
	.size	count, .-count
	.globl	generate
	.type	generate, @function
generate:
    pushq   %r15
    pushq   %r14
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp	        # пролог и выравнивание стека
	movq	%rdi, %r15	        # адрес ab перемещаем в регистр
	movq	%rsi, %r14	        # адрес prod перемещаем в регистр
	movl	$0, %edi
	call	time@PLT	        # вызываем time(NULL)
	movl	%eax, %edi
	call	srand@PLT	        # вызываем srand
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
	movq	%r15, %rax
	movl	%edx, (%rax)	    # ab[0] = rand() % 10
	call	rand@PLT
	movl	%eax, %ecx
	movq	%r15, %rax
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
	movl	%edx, (%rsi)	# ab[1] = rand() % 10
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
	movq	%r14, %rdx
	movl	%eax, (%rdx)	# prod[0] = rand() % 5
	call	rand@PLT
	leal	5(%rax), %ecx
	movq	%r14, %rax
	leaq	4(%rax), %rsi
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$3, %eax
	movl	%ecx, %edi
	sarl	$31, %edi
	subl	%edi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, (%rsi)	    # prod[1] = (5 + rand()) % 20
	nop	
	leave	
    popq %r14
    popq %r15
	ret	
	.size	generate, .-generate