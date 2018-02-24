.globl _start;                                  
_start:

# Put your own code here
	lui x5, %hi(3)
	add x5, x5, %lo(3)

	lui x6, %hi(5)
	add x6, x6, %lo(5)
	
	blt x6, x5, swap
	
	loop:
		sub x6, x6, x5
		blt x6, x5, swap
		beq x5, x0, done
		
	swap:
		lui x7, %hi(x5)
		add x7, x7, %lo(x5)

		lui x5, %hi(x6)
		add x5, x5, %lo(x6)

		lui x6, %hi(x7)
		add x6, x6, %lo(x7)

		beq x0, x0, loop

	done:
		lui x7, %hi(x6)
		add x7, x7, %lo(x6)

_exit:
