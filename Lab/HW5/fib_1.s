.globl _start;                                  
_start:

# Put your own code here
	addi x5, x0, 1
	addi x6, x0, 0
	addi x7, x0, 1

	loop:
		add x28, x6, x7
		add x6, x0, x7
		add x7, x0, x28
	
		addi x5, x5, -1
		bne x5, x0, loop

_exit:
