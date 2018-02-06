import Vector::*;


function Bit#(32) multiplexer32(Bit#(1) sel, Bit#(32) a, Bit#(32) b);
	return (sel == 0)?a:b; 

endfunction

function Bit#(32) logicalBarrelShifter(Bit#(32) operand, Bit#(5) shamt);
	// fill your code here
	Bit#(32) num = operand;
	for(Integer i = 0; i < 5; i = i + 1)
	begin
		Integer shf = exp(2, i);
		// shifter
		Integer k = 0;
		for(Integer j = shf; j <= 31; j = j+1)
		begin
			num[k] = operand[j];
			k = k+1;
		end 		
		for(k = k; k<32; k = k+1)
		begin
			num[k] = 0;
		end
		operand = multiplexer32(shamt[i], operand, num);
	end
	
	return operand;
endfunction

function Bit#(32) arithmeticBarrelShifter(Bit#(32) operand, Bit#(5) shamt);
	// fill your code here
	Bit#(32) num = operand;
	Bit#(1) sbit = operand[31];
	for(Integer i = 0; i < 5; i = i + 1)
	begin
		Integer shf = exp(2, i);
		// shifter
		Integer k = 0;
		for(Integer j = shf; j <= 31; j = j+1)
		begin
			num[k] = operand[j];
			k = k+1;
		end 		
		for(k = k; k<32; k = k+1)
		begin
			num[k] = sbit;
		end
		operand = multiplexer32(shamt[i], operand, num);
	end
	
	return operand;
endfunction

function Bit#(32) logicalLeftRightBarrelShifter(Bit#(1) shiftLeft, Bit#(32) operand, Bit#(5) shamt);
	// fill your code here
	Bit#(32) sright = logicalBarrelShifter(operand, shamt);
	
	Bit#(32) sleftc;
	Bit#(32) sleft;
	
	for(Integer i = 0; i < 32; i = i + 1)
	begin
		sleftc[i] = operand[31-i];
	end
	sleftc = logicalBarrelShifter(sleftc, shamt);
	for(Integer i = 0; i < 32; i = i + 1)
	begin
		sleft[i] = sleftc[31-i];
	end	
	
	Bit#(32) answer = multiplexer32(shiftLeft, sright, sleft);
	
	return answer;
endfunction

