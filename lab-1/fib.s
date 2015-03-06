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
	push {r3, r4, r5, lr}

	subs  r4, r0, #0
	it    lt
	movlt r0, #0
	beq   .FINISH

	cmp   r4, #1
	beq   .FINISH 

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
	sub r0, r4, #1
	bl fibonacci

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
	mov r5, r0
	sub r0, r4, #2
	bl fibonacci

	@ R0 = R5 + R0 (update flags)
	adds r0, r5, r0

.FINISH:
	pop {r3, r4, r5, pc}		@EPILOG
	
	.size fibonacci, .-fibonacci
	.end
