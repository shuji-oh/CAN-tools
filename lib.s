	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"lib.c"
	.text
	.align	2
	.global	asc2nibble
	.type	asc2nibble, %function
asc2nibble:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L2
	ldrb	r3, [fp, #-5]
	sub	r3, r3, #48
	uxtb	r3, r3
	b	.L3
.L2:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L4
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L4
	ldrb	r3, [fp, #-5]
	sub	r3, r3, #55
	uxtb	r3, r3
	b	.L3
.L4:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L5
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L5
	ldrb	r3, [fp, #-5]
	sub	r3, r3, #87
	uxtb	r3, r3
	b	.L3
.L5:
	mov	r3, #16
.L3:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	asc2nibble, .-asc2nibble
	.align	2
	.global	hexstring2candata
	.type	hexstring2candata, %function
hexstring2candata:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	bne	.L7
	ldr	r3, [fp, #-12]
	cmp	r3, #16
	ble	.L8
.L7:
	mov	r3, #1
	b	.L9
.L8:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L13:
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L11
	mov	r3, #1
	b	.L9
.L11:
	ldrb	r3, [fp, #-13]
	mov	r3, r3, asl #4
	uxtb	r2, r3
	ldr	r0, [fp, #-28]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L12
	mov	r3, #1
	b	.L9
.L12:
	ldr	r1, [fp, #-28]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r3, [fp, #-13]
	orr	r3, r2, r3
	uxtb	r2, r3
	ldr	r0, [fp, #-28]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-12]
	mov	r2, r3, lsr #31
	add	r3, r2, r3
	mov	r3, r3, asr #1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L13
	mov	r3, #0
.L9:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	hexstring2candata, .-hexstring2candata
	.align	2
	.global	parse_canframe
	.type	parse_canframe, %function
parse_canframe:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r0, [fp, #-32]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	mov	r2, r3
	mov	r3, #16
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	bgt	.L15
	mov	r3, #1
	b	.L16
.L15:
	ldr	r3, [fp, #-32]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #35
	bne	.L17
	mov	r3, #4
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L18
.L20:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L19
	mov	r3, #1
	b	.L16
.L19:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldrb	r1, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #2
	mov	r3, r3, asl #2
	mov	r3, r1, asl r3
	orr	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L20
	b	.L21
.L17:
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #35
	bne	.L22
	mov	r3, #9
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L23
.L25:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L24
	mov	r3, #1
	b	.L16
.L24:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldrb	r1, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #7
	mov	r3, r3, asl #2
	mov	r3, r1, asl r3
	orr	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L25
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	orr	r2, r3, #-2147483648
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	b	.L21
.L22:
	mov	r3, #1
	b	.L16
.L21:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #82
	beq	.L26
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L27
.L26:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	orr	r2, r3, #1073741824
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	mov	r3, #0
	b	.L16
.L27:
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L28
.L34:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L29
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L29:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L35
.L30:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	str	r2, [fp, #-12]
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L32
	mov	r3, #1
	b	.L16
.L32:
	ldrb	r3, [fp, #-21]
	mov	r3, r3, asl #4
	uxtb	r2, r3
	ldr	r0, [fp, #-36]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	str	r2, [fp, #-12]
	mov	r0, r3
	bl	asc2nibble
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L33
	mov	r3, #1
	b	.L16
.L33:
	ldr	r1, [fp, #-36]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r3, [fp, #-21]
	orr	r3, r2, r3
	uxtb	r2, r3
	ldr	r0, [fp, #-36]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L28:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L34
	b	.L31
.L35:
	mov	r0, r0	@ nop
.L31:
	ldr	r3, [fp, #-16]
	uxtb	r2, r3
	ldr	r3, [fp, #-36]
	strb	r2, [r3, #4]
	mov	r3, #0
.L16:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	parse_canframe, .-parse_canframe
	.align	2
	.global	fprint_canframe
	.type	fprint_canframe, %function
fprint_canframe:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	sub	r3, fp, #40
	mov	r0, r3
	ldr	r1, [fp, #-52]
	ldr	r2, [fp, #-60]
	bl	sprint_canframe
	sub	r3, fp, #40
	mov	r0, r3
	ldr	r1, [fp, #-48]
	bl	fputs
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L36
	ldr	r0, [fp, #-56]
	ldr	r1, [fp, #-48]
	bl	fputs
.L36:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	fprint_canframe, .-fprint_canframe
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%08X#\000"
	.align	2
.LC1:
	.ascii	"%03X#\000"
	.align	2
.LC2:
	.ascii	"R\000"
	.align	2
.LC3:
	.ascii	"%02X\000"
	.align	2
.LC4:
	.ascii	".\000"
	.text
	.align	2
	.global	sprint_canframe
	.type	sprint_canframe, %function
sprint_canframe:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #8
	bhi	.L39
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	b	.L40
.L39:
	mov	r3, #8
.L40:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	beq	.L41
	ldr	r2, .L49
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	bic	r3, r3, #-1073741824
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #9
	str	r3, [fp, #-12]
	b	.L42
.L41:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L43
	ldr	r2, .L49
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	bic	r3, r3, #-536870912
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #9
	str	r3, [fp, #-12]
	b	.L42
.L43:
	ldr	r2, .L49+4
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #21
	mov	r3, r3, lsr #21
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #4
	str	r3, [fp, #-12]
.L42:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	and	r3, r3, #1073741824
	cmp	r3, #0
	beq	.L44
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L49+8
	mov	r1, r2
	mov	r2, r3
	mov	r3, #2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	b	.L38
.L44:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L46
.L48:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	add	r1, r2, r3
	ldr	r2, .L49+12
	ldr	ip, [fp, #-28]
	mov	r3, #8
	ldr	r0, [fp, #-8]
	add	r0, ip, r0
	add	r3, r0, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L47
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L47
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, .L49+16
	mov	r1, r2
	mov	r2, r3
	mov	r3, #2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
.L47:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L46:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L48
.L38:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L50:
	.align	2
.L49:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	sprint_canframe, .-sprint_canframe
	.section	.rodata
	.align	2
.LC5:
	.ascii	"\012\011\000"
	.align	2
.LC6:
	.ascii	"\012\011%s\000"
	.text
	.align	2
	.global	fprint_long_canframe
	.type	fprint_long_canframe, %function
fprint_long_canframe:
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #272
	str	r0, [fp, #-264]
	str	r1, [fp, #-268]
	str	r2, [fp, #-272]
	str	r3, [fp, #-276]
	sub	r3, fp, #260
	mov	r0, r3
	ldr	r1, [fp, #-268]
	ldr	r2, [fp, #-276]
	bl	sprint_long_canframe
	sub	r3, fp, #260
	mov	r0, r3
	ldr	r1, [fp, #-264]
	bl	fputs
	ldr	r3, [fp, #-276]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L52
	ldr	r3, [fp, #-268]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	beq	.L52
	sub	r3, fp, #260
	mov	r0, r3
	mov	r1, #256
	ldr	r2, [fp, #-268]
	ldr	r3, .L54
	bl	snprintf_can_error_frame
	ldr	r2, .L54+4
	sub	r3, fp, #260
	ldr	r0, [fp, #-264]
	mov	r1, r2
	mov	r2, r3
	bl	fprintf
.L52:
	ldr	r3, [fp, #-272]
	cmp	r3, #0
	beq	.L51
	ldr	r0, [fp, #-272]
	ldr	r1, [fp, #-264]
	bl	fputs
.L51:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L55:
	.align	2
.L54:
	.word	.LC5
	.word	.LC6
	.size	fprint_long_canframe, .-fprint_long_canframe
	.section	.rodata
	.align	2
.LC7:
	.ascii	"%8X  \000"
	.align	2
.LC8:
	.ascii	"%3X  \000"
	.align	2
.LC9:
	.ascii	"[%d]\000"
	.align	2
.LC10:
	.ascii	" remote request\000"
	.align	2
.LC11:
	.ascii	"%c%02X\000"
	.align	2
.LC12:
	.ascii	" %02X\000"
	.align	2
.LC13:
	.ascii	"%*s\000"
	.align	2
.LC14:
	.ascii	"ERRORFRAME\000"
	.align	2
.LC15:
	.ascii	"`\000"
	.align	2
.LC16:
	.ascii	"'\000"
	.text
	.align	2
	.global	sprint_long_canframe
	.type	sprint_long_canframe, %function
sprint_long_canframe:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #8
	bhi	.L57
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	b	.L58
.L57:
	mov	r3, #8
.L58:
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	beq	.L59
	ldr	r2, .L99
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	bic	r3, r3, #-1073741824
	ldr	r0, [fp, #-32]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #10
	str	r3, [fp, #-20]
	b	.L60
.L59:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L61
	ldr	r2, .L99
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	bic	r3, r3, #-536870912
	ldr	r0, [fp, #-32]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #10
	str	r3, [fp, #-20]
	b	.L60
.L61:
	ldr	r2, .L99+4
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #21
	mov	r3, r3, lsr #21
	ldr	r0, [fp, #-32]
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	mov	r3, #5
	str	r3, [fp, #-20]
.L60:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+8
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	sprintf
	ldr	r3, [fp, #-20]
	add	r3, r3, #3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	and	r3, r3, #1073741824
	cmp	r3, #0
	beq	.L62
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+12
	mov	r1, r2
	mov	r2, r3
	mov	r3, #16
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	b	.L56
.L62:
	ldr	r3, [fp, #-40]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L64
	mov	r3, #9
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L66
.L73:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	sub	r1, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r1, r3
	bne	.L67
	mov	r3, #32
	b	.L68
.L67:
	mov	r3, #96
.L68:
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L69
.L72:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r0, [fp, #-36]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-12]
	mov	r3, r1, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L70
	mov	r3, #49
	b	.L71
.L70:
	mov	r3, #48
.L71:
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L69:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L72
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L66:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L73
	b	.L74
.L65:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L75
.L80:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L76
.L79:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r0, [fp, #-36]
	mov	r3, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, [fp, #-12]
	mov	r3, r1, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L77
	mov	r3, #49
	b	.L78
.L77:
	mov	r3, #48
.L78:
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L76:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L79
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L75:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L80
.L74:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #0]
	b	.L81
.L64:
	mov	r3, #3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L82
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L83
.L86:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r2, .L99+16
	ldr	r3, [fp, #-24]
	sub	r0, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r0, r3
	bne	.L84
	mov	r3, #32
	b	.L85
.L84:
	mov	r3, #96
.L85:
	ldr	lr, [fp, #-36]
	mov	r0, #8
	ldr	ip, [fp, #-8]
	add	ip, lr, ip
	add	r0, ip, r0
	ldrb	r0, [r0, #0]	@ zero_extendqisi2
	mov	ip, r0
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, ip
	bl	sprintf
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L83:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L86
	b	.L81
.L82:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L87
.L88:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r2, .L99+20
	ldr	ip, [fp, #-36]
	mov	r3, #8
	ldr	r0, [fp, #-8]
	add	r0, ip, r0
	add	r3, r0, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	sprintf
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L87:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L88
.L81:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	beq	.L89
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r2, .L99+24
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #8
	ldr	r0, [fp, #-16]
	mul	r3, r0, r3
	add	r3, r3, #13
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, .L99+28
	bl	sprintf
	b	.L56
.L89:
	ldr	r3, [fp, #-40]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #8
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	add	r3, r3, #4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L90
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+24
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-12]
	ldr	r3, .L99+32
	bl	sprintf
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L91
.L94:
	ldr	r1, [fp, #-36]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L92
	ldr	r1, [fp, #-36]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #126
	bhi	.L92
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r0, [fp, #-36]
	mov	r2, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L93
.L92:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #46
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L93:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L91:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L94
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+32
	mov	r1, r2
	mov	r2, r3
	mov	r3, #2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	b	.L56
.L90:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+24
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-12]
	ldr	r3, .L99+36
	bl	sprintf
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L95
.L98:
	ldr	r1, [fp, #-36]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L96
	ldr	r1, [fp, #-36]
	mov	r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #126
	bhi	.L96
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r0, [fp, #-36]
	mov	r2, #8
	ldr	r1, [fp, #-8]
	add	r1, r0, r1
	add	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L97
.L96:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, #46
	strb	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L97:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L95:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L98
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, .L99+36
	mov	r1, r2
	mov	r2, r3
	mov	r3, #2
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
.L56:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L100:
	.align	2
.L99:
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.size	sprint_long_canframe, .-sprint_long_canframe
	.section	.rodata
	.align	2
.LC17:
	.ascii	"tx-timeout\000"
	.align	2
.LC18:
	.ascii	"lost-arbitration\000"
	.align	2
.LC19:
	.ascii	"controller-problem\000"
	.align	2
.LC20:
	.ascii	"protocol-violation\000"
	.align	2
.LC21:
	.ascii	"transceiver-status\000"
	.align	2
.LC22:
	.ascii	"no-acknowledgement-on-tx\000"
	.align	2
.LC23:
	.ascii	"bus-off\000"
	.align	2
.LC24:
	.ascii	"bus-error\000"
	.align	2
.LC25:
	.ascii	"restarted-after-bus-off\000"
	.data
	.align	2
	.type	error_classes, %object
	.size	error_classes, 36
error_classes:
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.section	.rodata
	.align	2
.LC26:
	.ascii	"rx-overflow\000"
	.align	2
.LC27:
	.ascii	"tx-overflow\000"
	.align	2
.LC28:
	.ascii	"rx-error-warning\000"
	.align	2
.LC29:
	.ascii	"tx-error-warning\000"
	.align	2
.LC30:
	.ascii	"rx-error-passive\000"
	.align	2
.LC31:
	.ascii	"tx-error-passive\000"
	.data
	.align	2
	.type	controller_problems, %object
	.size	controller_problems, 24
controller_problems:
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.section	.rodata
	.align	2
.LC32:
	.ascii	"single-bit-error\000"
	.align	2
.LC33:
	.ascii	"frame-format-error\000"
	.align	2
.LC34:
	.ascii	"bit-stuffing-error\000"
	.align	2
.LC35:
	.ascii	"tx-dominant-bit-error\000"
	.align	2
.LC36:
	.ascii	"tx-recessive-bit-error\000"
	.align	2
.LC37:
	.ascii	"bus-overload\000"
	.align	2
.LC38:
	.ascii	"back-to-error-active\000"
	.align	2
.LC39:
	.ascii	"error-on-tx\000"
	.data
	.align	2
	.type	protocol_violation_types, %object
	.size	protocol_violation_types, 32
protocol_violation_types:
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.section	.rodata
	.align	2
.LC40:
	.ascii	"unspecified\000"
	.align	2
.LC41:
	.ascii	"id.28-to-id.28\000"
	.align	2
.LC42:
	.ascii	"start-of-frame\000"
	.align	2
.LC43:
	.ascii	"bit-srtr\000"
	.align	2
.LC44:
	.ascii	"bit-ide\000"
	.align	2
.LC45:
	.ascii	"id.20-to-id.18\000"
	.align	2
.LC46:
	.ascii	"id.17-to-id.13\000"
	.align	2
.LC47:
	.ascii	"crc-sequence\000"
	.align	2
.LC48:
	.ascii	"reserved-bit-0\000"
	.align	2
.LC49:
	.ascii	"data-field\000"
	.align	2
.LC50:
	.ascii	"data-length-code\000"
	.align	2
.LC51:
	.ascii	"bit-rtr\000"
	.align	2
.LC52:
	.ascii	"reserved-bit-1\000"
	.align	2
.LC53:
	.ascii	"id.4-to-id.0\000"
	.align	2
.LC54:
	.ascii	"id.12-to-id.5\000"
	.align	2
.LC55:
	.ascii	"active-error-flag\000"
	.align	2
.LC56:
	.ascii	"intermission\000"
	.align	2
.LC57:
	.ascii	"tolerate-dominant-bits\000"
	.align	2
.LC58:
	.ascii	"passive-error-flag\000"
	.align	2
.LC59:
	.ascii	"error-delimiter\000"
	.align	2
.LC60:
	.ascii	"crc-delimiter\000"
	.align	2
.LC61:
	.ascii	"acknowledge-slot\000"
	.align	2
.LC62:
	.ascii	"end-of-frame\000"
	.align	2
.LC63:
	.ascii	"acknowledge-delimiter\000"
	.align	2
.LC64:
	.ascii	"overload-flag\000"
	.data
	.align	2
	.type	protocol_violation_locations, %object
	.size	protocol_violation_locations, 128
protocol_violation_locations:
	.word	.LC40
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC40
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC40
	.word	.LC40
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC40
	.word	.LC40
	.word	.LC40
	.section	.rodata
	.align	2
.LC65:
	.ascii	",\000"
	.align	2
.LC66:
	.ascii	"%s\000"
	.text
	.align	2
	.type	snprintf_error_data, %function
snprintf_error_data:
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-29]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L102
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L103
.L102:
	mov	r3, #0
	b	.L104
.L103:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L105
.L108:
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L106
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L107
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	add	r1, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	rsb	r2, r3, r2
	ldr	r3, .L109
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L107:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	rsb	r1, r3, r2
	ldr	r2, .L109+4
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #2
	ldr	ip, [fp, #-36]
	add	r3, ip, r3
	ldr	r3, [r3, #0]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L106:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L105:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L108
	ldr	r3, [fp, #-12]
.L104:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L110:
	.align	2
.L109:
	.word	.LC65
	.word	.LC66
	.size	snprintf_error_data, .-snprintf_error_data
	.section	.rodata
	.align	2
.LC67:
	.ascii	"{at bit %d}\000"
	.text
	.align	2
	.type	snprintf_error_lostarb, %function
snprintf_error_lostarb:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L112
	mov	r3, #0
	b	.L113
.L112:
	ldr	r2, .L114
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-12]
	bl	snprintf
	mov	r3, r0
.L113:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L115:
	.align	2
.L114:
	.word	.LC67
	.size	snprintf_error_lostarb, .-snprintf_error_lostarb
	.section	.rodata
	.align	2
.LC68:
	.ascii	"{\000"
	.align	2
.LC69:
	.ascii	"}\000"
	.text
	.align	2
	.type	snprintf_error_ctrl, %function
snprintf_error_ctrl:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L117
	mov	r3, #0
	b	.L118
.L117:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, .L119
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r0, #6
	str	r0, [sp, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, .L119+4
	bl	snprintf_error_data
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, .L119+8
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
.L118:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L120:
	.align	2
.L119:
	.word	.LC68
	.word	controller_problems
	.word	.LC69
	.size	snprintf_error_ctrl, .-snprintf_error_ctrl
	.section	.rodata
	.align	2
.LC70:
	.ascii	"{{\000"
	.align	2
.LC71:
	.ascii	"}{\000"
	.align	2
.LC72:
	.ascii	"}}\000"
	.text
	.align	2
	.type	snprintf_error_prot, %function
snprintf_error_prot:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L122
	mov	r3, #0
	b	.L123
.L122:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, .L125
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	mov	r0, #8
	str	r0, [sp, #0]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, .L125+4
	bl	snprintf_error_data
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, .L125+8
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L124
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L124
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r0, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r1, r3, r2
	ldr	r2, .L125+12
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #11]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r3, .L125+16
	ldr	r3, [r3, ip, asl #2]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L124:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	rsb	r2, r3, r2
	ldr	r3, .L125+20
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
.L123:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L126:
	.align	2
.L125:
	.word	.LC70
	.word	protocol_violation_types
	.word	.LC71
	.word	.LC66
	.word	protocol_violation_locations
	.word	.LC72
	.size	snprintf_error_prot, .-snprintf_error_prot
	.section	.rodata
	.align	2
.LC73:
	.ascii	"Error class %#x is invalid\012\000"
	.align	2
.LC74:
	.ascii	"error-counter-tx-rx{{%d}{%d}}\000"
	.text
	.align	2
	.global	snprintf_can_error_frame
	.type	snprintf_can_error_frame, %function
snprintf_can_error_frame:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, .L141
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	and	r3, r3, #536870912
	cmp	r3, #0
	beq	.L140
.L128:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	bic	r3, r3, #-536870912
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #512
	bls	.L130
	ldr	r3, .L141+4
	ldr	r3, [r3, #0]
	mov	r2, r3
	ldr	r3, .L141+8
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	fprintf
	b	.L127
.L130:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L131
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-44]
.L131:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L132
.L138:
	mov	r2, #1
	ldr	r3, [fp, #-8]
	mov	r3, r2, asl r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	and	r3, r2, r3
	cmp	r3, #0
	beq	.L133
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L134
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]
	rsb	r2, r3, r2
	ldr	r3, .L141+12
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L134:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]
	rsb	r1, r3, r2
	ldr	r2, .L141+12
	ldr	r3, .L141+16
	ldr	ip, [fp, #-8]
	ldr	r3, [r3, ip, asl #2]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r3, #2
	bne	.L135
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-40]
	bl	snprintf_error_lostarb
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L135:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	bne	.L136
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-40]
	bl	snprintf_error_ctrl
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L136:
	ldr	r3, [fp, #-28]
	cmp	r3, #8
	bne	.L137
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	rsb	r3, r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-40]
	bl	snprintf_error_prot
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L137:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L133:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L132:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	bls	.L138
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #14]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L139
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L127
.L139:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]
	rsb	r2, r3, r2
	ldr	r3, .L141+12
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-44]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]
	rsb	r1, r3, r2
	ldr	r2, .L141+20
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #14]	@ zero_extendqisi2
	ldr	ip, [fp, #-40]
	ldrb	ip, [ip, #15]	@ zero_extendqisi2
	str	ip, [sp, #0]
	bl	snprintf
	mov	r3, r0
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L127
.L140:
	mov	r0, r0	@ nop
.L127:
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L142:
	.align	2
.L141:
	.word	.LC65
	.word	stderr
	.word	.LC73
	.word	.LC66
	.word	error_classes
	.word	.LC74
	.size	snprintf_can_error_frame, .-snprintf_can_error_frame
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
