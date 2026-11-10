	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"%2s %d %d %d"
	.text
	.globl	load_ppm
	.type	load_ppm, @function
load_ppm:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdx, .LC0[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	lea	rdi, -44[rbp]
	lea	rax, -32[rbp]
	lea	r8, 4[rax]
	lea	rcx, -32[rbp]
	lea	rdx, -11[rbp]
	lea	rsi, .LC1[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r9, rdi
	mov	rdi, rax
	mov	eax, 0
	call	__isoc23_fscanf@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	edx, DWORD PTR -32[rbp]
	mov	eax, DWORD PTR -28[rbp]
	imul	eax, edx
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	edx, DWORD PTR -32[rbp]
	mov	eax, DWORD PTR -28[rbp]
	imul	eax, edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	esi, 3
	mov	rdi, rax
	call	fread@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR -8[rbp]
	sub	rcx, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	load_ppm, .-load_ppm
	.globl	free_image
	.type	free_image, @function
free_image:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	free_image, .-free_image
	.globl	to_grayscale_float
	.type	to_grayscale_float, @function
to_grayscale_float:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	pxor	xmm1, xmm1
	cvtsi2ss	xmm1, eax
	movss	xmm0, DWORD PTR .LC2[rip]
	mulss	xmm1, xmm0
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rcx
	movzx	eax, BYTE PTR 1[rax]
	movzx	eax, al
	pxor	xmm2, xmm2
	cvtsi2ss	xmm2, eax
	movss	xmm0, DWORD PTR .LC3[rip]
	mulss	xmm0, xmm2
	addss	xmm1, xmm0
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rcx
	movzx	eax, BYTE PTR 2[rax]
	movzx	eax, al
	pxor	xmm2, xmm2
	cvtsi2ss	xmm2, eax
	movss	xmm0, DWORD PTR .LC4[rip]
	mulss	xmm0, xmm2
	addss	xmm0, xmm1
	movss	DWORD PTR -4[rbp], xmm0
	cvttss2si	eax, DWORD PTR -4[rbp]
	mov	BYTE PTR -9[rbp], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR 1[rdx], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR 2[rdx], al
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 4[rax]
	imul	eax, edx
	cmp	DWORD PTR -8[rbp], eax
	jl	.L7
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	to_grayscale_float, .-to_grayscale_float
	.globl	to_grayscale_fixed
	.type	to_grayscale_fixed, @function
to_grayscale_fixed:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	imul	ecx, eax, 19595
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rsi
	movzx	eax, BYTE PTR 1[rax]
	movzx	eax, al
	imul	eax, eax, 38470
	lea	esi, [rcx+rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	add	rax, rcx
	movzx	eax, BYTE PTR 2[rax]
	movzx	eax, al
	imul	eax, eax, 7471
	add	eax, esi
	shr	eax, 16
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	mov	BYTE PTR -9[rbp], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR 1[rdx], al
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, QWORD PTR 8[rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -9[rbp]
	mov	BYTE PTR 2[rdx], al
	add	DWORD PTR -8[rbp], 1
.L9:
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 4[rax]
	imul	eax, edx
	cmp	DWORD PTR -8[rbp], eax
	jl	.L10
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	to_grayscale_fixed, .-to_grayscale_fixed
	.section	.rodata
.LC5:
	.string	"Usage: %s <image.ppm>\n"
	.align 8
.LC6:
	.string	"erreur echec du chargement de l'image.\n"
	.align 8
.LC7:
	.string	"image chargee : %d x %d pixels\n"
	.align 8
.LC8:
	.string	"Erreur : allocation memoire impossible.\n"
	.align 8
.LC11:
	.string	"Temps moyen virgule flottante         : %.6f ms\n"
	.align 8
.LC12:
	.string	"Temps moyen virgule fixe : %.6f ms\n"
.LC13:
	.string	"Memoire liberee avec succes."
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -116[rbp], 2
	je	.L12
	mov	rax, QWORD PTR -128[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L20
.L12:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	load_ppm
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -56[rbp]
	test	rax, rax
	jne	.L14
	mov	rax, QWORD PTR stderr[rip]
	lea	rdi, .LC6[rip]
	mov	rcx, rax
	mov	edx, 39
	mov	esi, 1
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L20
.L14:
	mov	edx, DWORD PTR -60[rbp]
	mov	eax, DWORD PTR -64[rbp]
	lea	rcx, .LC7[rip]
	mov	esi, eax
	mov	rdi, rcx
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -100[rbp], 100
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	imul	rax, rdx
	mov	QWORD PTR -96[rbp], rax
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, rdx
	add	rax, rax
	add	rax, rdx
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -80[rbp], rax
	cmp	QWORD PTR -80[rbp], 0
	jne	.L15
	mov	rax, QWORD PTR stderr[rip]
	lea	rdi, .LC8[rip]
	mov	rcx, rax
	mov	edx, 40
	mov	esi, 1
	call	fwrite@PLT
	lea	rax, -64[rbp]
	mov	rdi, rax
	call	free_image
	mov	eax, 1
	jmp	.L20
.L15:
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	lea	rax, -48[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -108[rbp], 0
	jmp	.L16
.L17:
	lea	rax, -64[rbp]
	mov	rdi, rax
	call	to_grayscale_float
	add	DWORD PTR -108[rbp], 1
.L16:
	mov	eax, DWORD PTR -108[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L17
	lea	rax, -32[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -48[rbp]
	sub	rdx, rax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rdx
	movsd	xmm0, QWORD PTR .LC9[rip]
	mulsd	xmm1, xmm0
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	sub	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	movsd	xmm2, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -72[rbp], xmm0
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -100[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	lea	rdx, .LC11[rip]
	movq	xmm0, rax
	mov	rdi, rdx
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rcx, QWORD PTR -80[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	memcpy@PLT
	lea	rax, -48[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	DWORD PTR -104[rbp], 0
	jmp	.L18
.L19:
	lea	rax, -64[rbp]
	mov	rdi, rax
	call	to_grayscale_fixed
	add	DWORD PTR -104[rbp], 1
.L18:
	mov	eax, DWORD PTR -104[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L19
	lea	rax, -32[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -48[rbp]
	sub	rdx, rax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rdx
	movsd	xmm0, QWORD PTR .LC9[rip]
	mulsd	xmm1, xmm0
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	sub	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	movsd	xmm2, QWORD PTR .LC10[rip]
	divsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR -72[rbp], xmm0
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -100[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	lea	rdx, .LC12[rip]
	movq	xmm0, rax
	mov	rdi, rdx
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -80[rbp]
	mov	rdi, rax
	call	free@PLT
	lea	rax, -64[rbp]
	mov	rdi, rax
	call	free_image
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
.L20:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1050220167
	.align 4
.LC3:
	.long	1058424226
	.align 4
.LC4:
	.long	1038710997
	.align 8
.LC9:
	.long	0
	.long	1083129856
	.align 8
.LC10:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
