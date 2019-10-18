	.global _Z3addii
_Z3addii:
	@sum(int a, int b)
	@R0 = a
	@R1 = b
	@R2 = sum

	mov	r2, #0
.add:
	add	r2, r0
	add	r0, #1
	cmp	r0, r1
	ble	.add

	mov	r0, r2
	bx	lr

	.global _Z4facti
_Z4facti:
	@ int fact(n)
	@ r0 = N
	@ r1 = prod
	mov r1, #1
	cmp r0, #0
	ble .endfact
.loopfact:
	mul r1, r0
	sub r0, #1
	cmp r0, #0
	bgt .loopfact

	@ CPSR = "current program status register"
	@ holds info such as if an operation was 0,
	@ not equal, less than, etc.

.endfact:
	mov r0, r1
	bx lr

	.global _Z9factoriali
_Z9factoriali:
	push {lr}

	cmp r0, #2
	poplt {lr}
	bxlt lr

	mov r1, r0
	sub r0, #1
	push {r1}
	bl _Z9factoriali
	pop {r1}
	mul r0, r1

	pop {lr}
	bx lr
