	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, lr}

	subs  r3, r0, #0
	it    lt
	movlt r0, #0
	ble   .FINISH

	cmp r3, #1
	beq .FINISH

	@ R0 = R3 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
	sub r0, r3, #1
	bl fibonacci

	@ R4 = R0
	@ R0 = R3 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
	mov r4, r0
	sub r0, r3, #2
	bl fibonacci

	@ R0 = R4 + R0 (update flags)
	adds r0, r4, r0

.FINISH:
	pop {r3, r4, pc}		@EPILOG
	
	.size fibonacci, .-fibonacci
	.end
