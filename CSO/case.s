# Objective: Convert lowercase letters to uppercase
#     Input: Requests a character string from the user.
#    Output: Prints the input string in uppercase.
################### Data segment #####################
.data
name_prompt:	.asciiz	"Please type your name: "
out_msg:	.asciiz	"Your name in capitals is: "
in_name:	.space 31	# space for input string
################### Code segment #####################
.text
.globl main
main:
      la    $a0,name_prompt	# print prompt string
      li    $v0,4
      syscall
	   la    $a0,in_name	# read the input string
      li    $a1,31	# at most 30 chars + 1 null char
      li    $v0,8
      syscall
      la    $a0,out_msg      # write output message
      li    $v0,4
      syscall
      la    $t0,in_name
loop:
      lb    $t1,($t0)
      beqz  $t1,exit_loop    # if NULL, we are done
      blt   $t1,'a',no_change
      bgt   $t1,'z',no_change
      addiu $t1,$t1,-32      # convert to uppercase: 'A'-'a'=-32       
      sb    $t1,($t0)
no_change:
      addiu $t0,$t0,1        # increment pointer 
      j     loop
exit_loop:
      la    $a0,in_name      # output converted string
      li    $v0,4
      syscall
      li    $v0,10           # exit
      syscall
