.globl _start;                                  
_start:

# Put your own code here
	lui x5, %hi(256)
	add x5, x5, %lo(256)

	lui x6, %hi(2048)
	add x6, x6, %lo(2048)

	

_exit:
