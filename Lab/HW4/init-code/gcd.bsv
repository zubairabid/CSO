interface LGCD;
    method Action start(int a, int b);
    method int result();
    method Bool busy;
endinterface

module mkLGCD (LGCD);
    /*DO NOT change these registers, remove or add more registers*/
    Reg#(int) x <- mkReg(0);
    Reg#(int) y <- mkReg(0);
    Reg#(Bool) bz <- mkReg(False);

    /*feel FREE to add delete or change the name of the rules*/
    rule swapANDsub (x < y && x != 0/*fill condition here*/);
        // fill your code here
	y <= y - x;
    endrule
    rule subtract (x >= y && y != 0 /*fill condition here*/ );
	x <= x - y;
	// fill your code here
    endrule
    rule stop (x == 0 || y == 0/*fill condition here*/);
	// fill your code here
	bz <= False;
    endrule

    /*Do not change the signature of the method */
    method Action start(int a, int b); 
	// fill your code here
	if(a >= 1 && b >= 1)
		bz <= True;
		x <= a;
		y <= b;
	else
		$display("ERROR");
    endmethod
    method int result();
    	// fill your code here
    	if(x != 0 && y == 0)
    		return x;
    	else
    	
    		return y;
    endmethod
    method Bool busy;
    	return bz;
        // fill your code here
    endmethod

endmodule

