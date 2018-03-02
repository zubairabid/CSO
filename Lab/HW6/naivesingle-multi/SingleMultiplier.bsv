package SingleMultiplier; 

// Multiplier IFC

typedef Bit#(16) Tin;
typedef Bit#(32) Tout;

interface Multiplier_IFC;
    method Tout  multiply(Tin m1, Tin m2);
endinterface
        
endpackage
