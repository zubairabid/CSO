package MultiTbLFSR;

// testbench for Multi

import Multiplier::*;
import Multi::*;
import LFSR::*;

Tin notestinputs=100;

(* synthesize *)
module mkMultiTbLFSR (Empty);

   LFSR#(Bit#(32)) lfsr <- mkLFSR_32;

   Reg#(Tin) x    <- mkReg(1);
   Reg#(Tin) y    <- mkReg(0);
   Reg#(Bit#(32)) num_bubbles <- mkReg(0);
   Reg#(Bool) starting <- mkReg(True);

   Reg#(Bit#(32)) free_count <- mkReg (0);
   Reg#(Bit#(32)) last_result_free_count <- mkReg (0);
   
   // The dut
   Multiplier_IFC dut <- mkMulti;
   
   // RULES ----------------
   
   rule start (starting);
	   starting <= False;
	   lfsr.seed('h11);
	endrule

   rule rule_tb_1 ((x < notestinputs) && !starting );
      Tin op2 = truncate(lfsr.value());
      $display ("    x = %d, y = %d", x, op2);
      dut.start (x, op2);
      y <= op2;

      lfsr.next();
   endrule
   
   rule rule_tb_2 (x < notestinputs);
      let z = dut.result();
	  Tout expected = extend (x) * extend (y);
      x <= x + 1;
      dut.acknowledge();

	  last_result_free_count <= free_count;
	  num_bubbles <= num_bubbles + (free_count - last_result_free_count - 1);

      $display("    Result = %d Expected = %d", z, expected);
	  if (z != expected) $finish(0);
   endrule

   // To look for bubbles
   rule free_counter (!starting);
	   free_count <= free_count+1;
   endrule

   // TASK: Add a rule to invoke $finish(0) at the appropriate moment
   rule stop (x >= notestinputs);
       $finish(0);
   endrule
      
   
endmodule : mkMultiTbLFSR

endpackage : MultiTbLFSR
