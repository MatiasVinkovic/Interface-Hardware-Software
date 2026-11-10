	.cpu cortex-m0
	.arch armv6s-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"rb\000"
	.align	2
.LC2:
	.ascii	"%2s %d %d %d\000"
	.text
	.align	1
	.global	load_ppm
	.syntax unified
	.code	16
	.thumb_func
	.type	load_ppm, %function
load_ppm:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #8
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, .L3
	ldr	r3, [r7]
	movs	r1, r2
	movs	r0, r3
	bl	fopen
	movs	r3, r0
	str	r3, [r7, #28]
	movs	r5, #12
	adds	r4, r7, r5
	movs	r3, #24
	adds	r2, r7, r3
	ldr	r1, .L3+4
	ldr	r0, [r7, #28]
	movs	r3, #8
	adds	r3, r7, r3
	str	r3, [sp, #4]
	adds	r3, r7, r5
	adds	r3, r3, #4
	str	r3, [sp]
	movs	r3, r4
	bl	fscanf
	ldr	r3, [r7, #28]
	movs	r0, r3
	bl	fgetc
	movs	r4, r5
	adds	r3, r7, r4
	ldr	r2, [r3]
	adds	r3, r7, r4
	ldr	r3, [r3, #4]
	muls	r3, r2
	movs	r2, r3
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	movs	r2, r3
	adds	r3, r7, r4
	str	r2, [r3, #8]
	adds	r3, r7, r4
	ldr	r0, [r3, #8]
	adds	r3, r7, r4
	ldr	r2, [r3]
	adds	r3, r7, r4
	ldr	r3, [r3, #4]
	muls	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #28]
	movs	r1, #3
	bl	fread
	ldr	r3, [r7, #28]
	movs	r0, r3
	bl	fclose
	ldr	r3, [r7, #4]
	adds	r2, r7, r4
	ldmia	r2!, {r0, r1, r4}
	stmia	r3!, {r0, r1, r4}
	ldr	r0, [r7, #4]
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r7, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	.LC2
	.size	load_ppm, .-load_ppm
	.align	1
	.global	free_image
	.syntax unified
	.code	16
	.thumb_func
	.type	free_image, %function
free_image:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r0, r3
	bl	free
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.size	free_image, .-free_image
	.align	1
	.global	to_grayscale_float
	.syntax unified
	.code	16
	.thumb_func
	.type	to_grayscale_float, %function
to_grayscale_float:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L7
.L8:
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	ldrb	r3, [r3]
	movs	r0, r3
	bl	__aeabi_i2f
	adds	r3, r0, #0
	ldr	r1, .L9
	adds	r0, r3, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r4, r3, #0
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	__aeabi_i2f
	adds	r3, r0, #0
	ldr	r1, .L9+4
	adds	r0, r3, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r1, r3, #0
	adds	r0, r4, #0
	bl	__aeabi_fadd
	adds	r3, r0, #0
	adds	r4, r3, #0
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	__aeabi_i2f
	adds	r3, r0, #0
	ldr	r1, .L9+8
	adds	r0, r3, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r1, r3, #0
	adds	r0, r4, #0
	bl	__aeabi_fadd
	adds	r3, r0, #0
	str	r3, [r7, #16]
	movs	r5, #15
	adds	r4, r7, r5
	ldr	r0, [r7, #16]
	bl	__aeabi_f2uiz
	movs	r3, r0
	strb	r3, [r4]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	movs	r0, r5
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3, #1]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3, #2]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L7:
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	muls	r3, r2
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L8
	nop
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r7, pc}
.L10:
	.align	2
.L9:
	.word	1050220167
	.word	1058424226
	.word	1038710997
	.size	to_grayscale_float, .-to_grayscale_float
	.align	1
	.global	to_grayscale_fixed
	.syntax unified
	.code	16
	.thumb_func
	.type	to_grayscale_fixed, %function
to_grayscale_fixed:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L12
.L13:
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, .L14
	muls	r3, r2
	movs	r1, r3
	ldr	r3, [r7, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r0, r3
	ldrb	r3, [r3, #1]
	movs	r2, r3
	ldr	r3, .L14+4
	muls	r3, r2
	adds	r1, r1, r3
	ldr	r3, [r7, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r0, r3
	ldrb	r3, [r3, #2]
	movs	r2, r3
	movs	r3, r2
	lsls	r3, r3, #4
	subs	r3, r3, r2
	lsls	r3, r3, #4
	adds	r3, r3, r2
	lsls	r2, r3, #5
	subs	r3, r2, r3
	adds	r3, r1, r3
	lsrs	r3, r3, #16
	str	r3, [r7, #16]
	movs	r0, #15
	adds	r3, r7, r0
	ldr	r2, [r7, #16]
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3, #1]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #20]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	adds	r3, r1, r3
	adds	r2, r7, r0
	ldrb	r2, [r2]
	strb	r2, [r3, #2]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L12:
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	muls	r3, r2
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L13
	nop
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	19595
	.word	38470
	.size	to_grayscale_fixed, .-to_grayscale_fixed
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Usage: %s <image.ppm>\012\000"
	.align	2
.LC7:
	.ascii	"erreur echec du chargement de l'image.\012\000"
	.align	2
.LC9:
	.ascii	"image chargee : %d x %d pixels\012\000"
	.align	2
.LC11:
	.ascii	"Erreur : allocation memoire impossible.\012\000"
	.align	2
.LC13:
	.ascii	"Temps moyen virgule flottante         : %.6f ms\012"
	.ascii	"\000"
	.align	2
.LC15:
	.ascii	"Temps moyen virgule fixe : %.6f ms\012\000"
	.align	2
.LC17:
	.ascii	"Memoire liberee avec succes.\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.code	16
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #92
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #2
	beq	.L17
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r0, [r3, #12]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, .L26+4
	movs	r1, r3
	bl	fprintf
	movs	r3, #1
	b	.L25
.L17:
	ldr	r3, [r7]
	adds	r3, r3, #4
	ldr	r2, [r3]
	movs	r4, #44
	adds	r3, r7, r4
	movs	r1, r2
	movs	r0, r3
	bl	load_ppm
	adds	r3, r7, r4
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L19
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r0, .L26+8
	movs	r2, #39
	movs	r1, #1
	bl	fwrite
	movs	r3, #1
	b	.L25
.L19:
	movs	r4, #44
	adds	r3, r7, r4
	ldr	r1, [r3]
	adds	r3, r7, r4
	ldr	r2, [r3, #4]
	ldr	r3, .L26+12
	movs	r0, r3
	bl	printf
	movs	r3, #100
	str	r3, [r7, #76]
	adds	r3, r7, r4
	ldr	r3, [r3]
	movs	r2, r3
	adds	r3, r7, r4
	ldr	r3, [r3, #4]
	muls	r3, r2
	str	r3, [r7, #72]
	ldr	r2, [r7, #72]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	str	r3, [r7, #68]
	ldr	r3, [r7, #68]
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #64]
	ldr	r3, [r7, #64]
	cmp	r3, #0
	bne	.L20
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r0, .L26+16
	movs	r2, #40
	movs	r1, #1
	bl	fwrite
	adds	r3, r7, r4
	movs	r0, r3
	bl	free_image
	movs	r3, #1
	b	.L25
.L20:
	movs	r3, #44
	adds	r3, r7, r3
	ldr	r1, [r3, #8]
	ldr	r2, [r7, #68]
	ldr	r3, [r7, #64]
	movs	r0, r3
	bl	memcpy
	movs	r3, #24
	adds	r3, r7, r3
	movs	r1, r3
	movs	r0, #1
	bl	clock_gettime
	movs	r3, #0
	str	r3, [r7, #84]
	b	.L21
.L22:
	movs	r3, #44
	adds	r3, r7, r3
	movs	r0, r3
	bl	to_grayscale_float
	ldr	r3, [r7, #84]
	adds	r3, r3, #1
	str	r3, [r7, #84]
.L21:
	ldr	r2, [r7, #84]
	ldr	r3, [r7, #76]
	cmp	r2, r3
	blt	.L22
	movs	r6, #8
	adds	r3, r7, r6
	movs	r1, r3
	movs	r0, #1
	bl	clock_gettime
	adds	r3, r7, r6
	ldr	r0, [r3]
	ldr	r1, [r3, #4]
	movs	r3, #24
	adds	r3, r7, r3
	ldmia	r3, {r2, r3}
	subs	r0, r0, r2
	sbcs	r1, r1, r3
	movs	r2, r0
	movs	r3, r1
	movs	r0, r2
	movs	r1, r3
	bl	__aeabi_l2d
	movs	r2, #0
	ldr	r3, .L26+20
	bl	__aeabi_dmul
	movs	r2, r0
	movs	r3, r1
	movs	r4, r2
	movs	r5, r3
	adds	r3, r7, r6
	ldr	r2, [r3, #8]
	movs	r6, #24
	adds	r3, r7, r6
	ldr	r3, [r3, #8]
	subs	r3, r2, r3
	movs	r0, r3
	bl	__aeabi_i2d
	movs	r2, #0
	ldr	r3, .L26+24
	bl	__aeabi_ddiv
	movs	r2, r0
	movs	r3, r1
	movs	r0, r4
	movs	r1, r5
	bl	__aeabi_dadd
	movs	r2, r0
	movs	r3, r1
	str	r2, [r7, #56]
	str	r3, [r7, #60]
	ldr	r0, [r7, #76]
	bl	__aeabi_i2d
	movs	r2, r0
	movs	r3, r1
	ldr	r0, [r7, #56]
	ldr	r1, [r7, #60]
	bl	__aeabi_ddiv
	movs	r2, r0
	movs	r3, r1
	ldr	r1, .L26+28
	movs	r0, r1
	bl	printf
	movs	r3, #44
	adds	r3, r7, r3
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #68]
	ldr	r1, [r7, #64]
	movs	r0, r3
	bl	memcpy
	adds	r3, r7, r6
	movs	r1, r3
	movs	r0, #1
	bl	clock_gettime
	movs	r3, #0
	str	r3, [r7, #80]
	b	.L23
.L24:
	movs	r3, #44
	adds	r3, r7, r3
	movs	r0, r3
	bl	to_grayscale_fixed
	ldr	r3, [r7, #80]
	adds	r3, r3, #1
	str	r3, [r7, #80]
.L23:
	ldr	r2, [r7, #80]
	ldr	r3, [r7, #76]
	cmp	r2, r3
	blt	.L24
	movs	r6, #8
	adds	r3, r7, r6
	movs	r1, r3
	movs	r0, #1
	bl	clock_gettime
	adds	r3, r7, r6
	ldr	r0, [r3]
	ldr	r1, [r3, #4]
	movs	r3, #24
	adds	r3, r7, r3
	ldmia	r3, {r2, r3}
	subs	r0, r0, r2
	sbcs	r1, r1, r3
	movs	r2, r0
	movs	r3, r1
	movs	r0, r2
	movs	r1, r3
	bl	__aeabi_l2d
	movs	r2, #0
	ldr	r3, .L26+20
	bl	__aeabi_dmul
	movs	r2, r0
	movs	r3, r1
	movs	r4, r2
	movs	r5, r3
	adds	r3, r7, r6
	ldr	r2, [r3, #8]
	movs	r3, #24
	adds	r3, r7, r3
	ldr	r3, [r3, #8]
	subs	r3, r2, r3
	movs	r0, r3
	bl	__aeabi_i2d
	movs	r2, #0
	ldr	r3, .L26+24
	bl	__aeabi_ddiv
	movs	r2, r0
	movs	r3, r1
	movs	r0, r4
	movs	r1, r5
	bl	__aeabi_dadd
	movs	r2, r0
	movs	r3, r1
	str	r2, [r7, #56]
	str	r3, [r7, #60]
	ldr	r0, [r7, #76]
	bl	__aeabi_i2d
	movs	r2, r0
	movs	r3, r1
	ldr	r0, [r7, #56]
	ldr	r1, [r7, #60]
	bl	__aeabi_ddiv
	movs	r2, r0
	movs	r3, r1
	ldr	r1, .L26+32
	movs	r0, r1
	bl	printf
	ldr	r3, [r7, #64]
	movs	r0, r3
	bl	free
	movs	r3, #44
	adds	r3, r7, r3
	movs	r0, r3
	bl	free_image
	ldr	r3, .L26+36
	movs	r0, r3
	bl	puts
	movs	r3, #0
.L25:
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L27:
	.align	2
.L26:
	.word	_impure_ptr
	.word	.LC5
	.word	.LC7
	.word	.LC9
	.word	.LC11
	.word	1083129856
	.word	1093567616
	.word	.LC13
	.word	.LC15
	.word	.LC17
	.size	main, .-main
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_l2d
	.global	__aeabi_f2uiz
	.global	__aeabi_fadd
	.global	__aeabi_fmul
	.global	__aeabi_i2f
	.ident	"GCC: (Fedora 15.2.0-4.fc44) 15.2.0"
