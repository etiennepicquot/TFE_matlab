function [ Pout PW WF ] = combustor_func( W,Tin,Pin,Tout,CP,FHV )

Pout = Pin; % to modify : no pressure loss
DT = Tout - Tin;
PW = W*CP*DT;
WF = PW/FHV;

end

