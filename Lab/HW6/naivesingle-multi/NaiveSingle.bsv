package NaiveSingle; 


import SingleMultiplier::*;

(* synthesize *)
module mkNaiveSingle( Multiplier_IFC );

function Bit#(32) mul16(Bit#(16) a, Bit#(16) b);
  Bit#(32) product=0;
  Bit#(32) mcand = extend(b);
  Bit#(32) mplr = extend(a);

  for(Integer i=0; i < 16; i = i+1)
  begin
    if (mplr[i]==1) product = product + mcand;
    mcand = mcand << 1;
  end

  return product;
endfunction

method  Tout multiply(Tin m1, Tin m2);
	return mul16(m1, m2);
endmethod

endmodule : mkNaiveSingle
   
endpackage : NaiveSingle 
