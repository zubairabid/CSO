.extern main

.data 

	.word
vara:	.word 0xffff0000
varb:	.word 0x0000eeee
varc:	.word 0x0

.text

main:
	la	$t0, vara
	lw 	$t1, ($t0)
	la	$t2, varb
	lw 	$t3, ($t2)
	add $t4, $t1, $t3
	la  $t5, varc
	sw	$t4, ($t5)


exit:
	li $v0, 10
	syscall

