function [ Tout Pout PW ] = turbine_func( W,Tin,Pin,ETA,CP,GAM,PW )

%Verify with the PWin and PWout
DT = PW/(W*CP);
Tout = Tin - DT;
PW = W*CP*(Tin-Tout);
DTis = DT/ETA;
Toutis = Tin-DTis;
Pout = Pin * ( (Toutis/Tin)^(GAM/(GAM-1)) );

end

