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
	push {r3, r4, r5, r6, lr}

	mov r3, #-1	@ r3 is previous
	mov r4, #1	@ r4 is result
	mov r5, #0	@ r5 is idx
	mov r6, #0	@ r6 is sum
	add r0, #1
.LOOP:
	cmp r5, r0
	beq .FINISH

	add r6, r4, r3	@ sum = result + previous
	mov r3, r4	@ previous = result
	mov r4, r6	@ result = sum
	add r5, #1	@ idx++
	b   .LOOP

.FINISH:
	mov r0, r4

	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
