	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	subq	$32, %rsp
Ltmp2:
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1, -24(%rbp)
	jmp	LBB1_4
LBB1_1:
	movq	-16(%rbp), %rax
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	leaq	L_.str(%rip), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_fopen
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	cmpq	$0, %rax
	jne	LBB1_3
	movq	-16(%rbp), %rax
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, %rdi
	callq	_perror
	movl	$1, %eax
	movl	%eax, %edi
	callq	_exit
LBB1_3:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	callq	_do_wc_l
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	callq	_fclose
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
LBB1_4:
	movl	-24(%rbp), %eax
	movl	-4(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	LBB1_1
	movl	$0, %eax
	movl	%eax, %edi
	callq	_exit
Leh_func_end1:

	.align	4, 0x90
_do_wc_l:
Leh_func_begin2:
	pushq	%rbp
Ltmp3:
	movq	%rsp, %rbp
Ltmp4:
	subq	$32, %rsp
Ltmp5:
	movq	%rdi, -8(%rbp)
	movl	$10, -28(%rbp)
	movq	$0, -24(%rbp)
	jmp	LBB2_4
LBB2_1:
	movl	-12(%rbp), %eax
	cmpl	$10, %eax
	jne	LBB2_3
	movq	-24(%rbp), %rax
	movabsq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
LBB2_3:
	movl	-12(%rbp), %eax
	movl	%eax, -28(%rbp)
LBB2_4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_fgetc
	movl	%eax, %ecx
	movl	%ecx, -12(%rbp)
	movl	-12(%rbp), %ecx
	cmpl	$-1, %ecx
	jne	LBB2_1
	movl	-28(%rbp), %eax
	cmpl	$10, %eax
	je	LBB2_7
	movq	-24(%rbp), %rax
	movabsq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
LBB2_7:
	movq	-24(%rbp), %rax
	xorb	%cl, %cl
	leaq	L_.str1(%rip), %rdx
	movq	%rdx, %rdi
	movq	%rax, %rsi
	movb	%cl, %al
	callq	_printf
	addq	$32, %rsp
	popq	%rbp
	ret
Leh_func_end2:

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "r"

L_.str1:
	.asciz	 "%lu\n"

	.section	__TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame0:
Lsection_eh_frame:
Leh_frame_common:
Lset0 = Leh_frame_common_end-Leh_frame_common_begin
	.long	Lset0
Leh_frame_common_begin:
	.long	0
	.byte	1
	.asciz	 "zR"
	.byte	1
	.byte	120
	.byte	16
	.byte	1
	.byte	16
	.byte	12
	.byte	7
	.byte	8
	.byte	144
	.byte	1
	.align	3
Leh_frame_common_end:
	.globl	_main.eh
_main.eh:
Lset1 = Leh_frame_end1-Leh_frame_begin1
	.long	Lset1
Leh_frame_begin1:
Lset2 = Leh_frame_begin1-Leh_frame_common
	.long	Lset2
Ltmp6:
	.quad	Leh_func_begin1-Ltmp6
Lset3 = Leh_func_end1-Leh_func_begin1
	.quad	Lset3
	.byte	0
	.byte	4
Lset4 = Ltmp0-Leh_func_begin1
	.long	Lset4
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset5 = Ltmp1-Ltmp0
	.long	Lset5
	.byte	13
	.byte	6
	.align	3
Leh_frame_end1:

_do_wc_l.eh:
Lset6 = Leh_frame_end2-Leh_frame_begin2
	.long	Lset6
Leh_frame_begin2:
Lset7 = Leh_frame_begin2-Leh_frame_common
	.long	Lset7
Ltmp7:
	.quad	Leh_func_begin2-Ltmp7
Lset8 = Leh_func_end2-Leh_func_begin2
	.quad	Lset8
	.byte	0
	.byte	4
Lset9 = Ltmp3-Leh_func_begin2
	.long	Lset9
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset10 = Ltmp4-Ltmp3
	.long	Lset10
	.byte	13
	.byte	6
	.align	3
Leh_frame_end2:


.subsections_via_symbols
