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

	mov r3, #-1	@ r3 is previous
	mov r4, #1	@ r4 is result
.LOOP:
	add r3, r4, r3	@ sum = result + previous
			@ previous = result

	eor r3, r4	@ swap r3 and r4
	eor r4, r3
	eor r3, r4

	subs r0, #1
	blt  .FINISH
	b   .LOOP

.FINISH:
	mov r0, r4

	pop {r3, r4, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
