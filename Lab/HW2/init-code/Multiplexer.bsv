import BasicGates::*;

function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    return or1(and1(a,not1(sel)),and1(b, sel));
endfunction

function Bit#(4) multiplexer4(Bit#(1) sel, Bit#(4) a, Bit#(4) b);
    Bit#(4) result = 0;
    for(Integer i=0; i < 4; i = i+1)
    begin
    	result[i] = or1(and1(a[i],not1(sel)),and1(b[i], sel));
    end
    return result;
endfunction

function Bit#(n) multiplexer_n(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
    Bit#(n) result = 0;
    for(Integer i=0; i < valueOf(n); i = i+1)
    begin
    	result[i] = or1(and1(a[i],not1(sel)),and1(b[i], sel));
    end
    return result;
endfunction
