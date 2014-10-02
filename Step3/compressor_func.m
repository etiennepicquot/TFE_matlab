function [ Tout Pout PW ] = compressor_func( W,Tin,Pin,PQ,ETA,CP,GAM )

Pout=Pin*PQ;
Toutis = Tin*( (PQ)^((GAM-1)/GAM) );
DTis = Toutis - Tin;
DT = DTis/ETA;
Tout = Tin + DT;
PW = W*CP*DT;

end

