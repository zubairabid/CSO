package SingleTbLFSR;

// testbench for Multi

import SingleMultiplier::*;
import NaiveSingle::*;
import LFSR::*;

Tin notestinputs=100;

(* synthesize *)
module mkSingleTbLFSR (Empty);

   LFSR#(Bit#(32)) lfsr1 <- mkLFSR_32;
   LFSR#(Bit#(32)) lfsr2 <- mkLFSR_32;

   Reg#(Tin) x    <- mkReg(1);
   Reg#(Tin) y    <- mkReg(0);
   Reg#(Bool) starting <- mkReg(True);

   
   // The dut
   Multiplier_IFC dut <- mkNaiveSingle;
   
   // RULES ----------------
   
   rule start (starting);
	   starting <= False;
	   lfsr1.seed('h11);
	   lfsr2.seed('h21);
   endrule

   rule rule_tb ((x < notestinputs) && !starting );
      Tin op1 = truncate(lfsr1.value());
      Tin op2 = truncate(lfsr2.value());
      Tout result, expected;
      $display ("    x = %d, y = %d", op1, op2);
      result = dut.multiply (op1, op2);
      expected = extend(op1)*extend(op2);
      $display("    Result = %d Expected = %d",result , expected);
      if (result != expected) $finish(0);
      lfsr1.next();
      lfsr2.next();
      x <= x + 1;
   endrule
   
   // TASK: Add a rule to invoke $finish(0) at the appropriate moment
   rule stop (x >= notestinputs);
       $finish(0);
   endrule
      
   
endmodule : mkSingleTbLFSR

endpackage : SingleTbLFSR
