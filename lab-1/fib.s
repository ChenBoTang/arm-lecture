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
<<<<<<< HEAD
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
=======
	push {r4, r5, lr}
        subs r4,r0,#0
        ITT LE
        MOVLE r0,#0
        POPLE {r4,r5,pc}
        cmp r4,#1
        ITT EQ
        MOVEQ r0,#1
        POPEQ {r4,r5,pc}
        sub r0,r4,#1
        bl fibonacci
        mov r5,r0
        sub r0,r4,#2
        bl fibonacci
        adds r0,r5,r0
        pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG
>>>>>>> b8e0860fbde4be318aee06ef56690c19b030d3a9

.FINISH:
	pop {r3, r4, pc}		@EPILOG
	
	.size fibonacci, .-fibonacci
	.end
