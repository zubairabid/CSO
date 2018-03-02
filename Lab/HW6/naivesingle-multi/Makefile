LABNAME = Design and analysis of single cycle, multi-cyle and pipelined multiplier circuits.
SHORTNAME = Mult 
SMOKENAME = Mult 

## Default simulator is iverilog
VSIM = -vsim iverilog

.PHONY: help
help:
	@echo "Lab: $(LABNAME)"
	@echo "Useful targets:"
	@echo "naivesingle -- Builds the single cycle circuit."
	@echo "multi -- Builds the multi cycle circuit."
	@echo "  clean          --  remove intermediate files"
	@echo "  help           --  display this message"

#.PHONY: single
naivesingle: SingleMultiplier.bsv NaiveSingle.bsv NaiveSingleTbLFSR.bsv
	@echo "Compiling into verilog files"
	bsc -verilog -u NaiveSingleTbLFSR.bsv	
	@echo "Generting the simulation object"
	bsc -verilog -e  mkSingleTbLFSR -o NaiveSingleTbLFSR.bsim

multi: Multiplier.bsv Multi.bsv MultiTbLFSR.bsv
	@echo "Compiling into verilog files"
	bsc -verilog -u MultiTbLFSR.bsv	
	@echo "Generting the simulation object"
	bsc -verilog -e mkMultiTbLFSR -o MultiTb.bsim

.PHONY: clean
clean:
	@rm -f *.bi *.bo *.ba mk*.c mk*.h mk*.o mk*.v *_c *_v *.vcd *~ *.fsdb *.log *.bsim
