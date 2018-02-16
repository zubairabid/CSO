.globl _start;                                  
_start:

# Put your own code here
	lui x5, %hi(1024)
	add x5, x5, %lo(1024)
	add x6, x0, x0

	loop:
		addi x7, x0, 12
		add x6, x6, x7
	
		addi x5, x5, -1
		bne x5, x0, loop
_exit:
