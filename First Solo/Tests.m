%% Test itérations compresseur

R = 287.05; % (J/kg.K) for dry air
T2 = 288.15;
ETA2 = 0.85;
FAR = 0;
P3Q2 = 20;
W2 = 100;

Tmean = T2;
T3 = 1;
T3_corr = 2;

while abs((T3_corr-T3)/T3)>0.0001
    T3 = T3_corr;
    
    CP = CP_func(Tmean,FAR);
    gamma = gamma_func(CP,R);
    T3_corr = is_law_func( T2,ETA2,P3Q2,gamma )
    
    Tmean = (T2+T3_corr)/2;   
end

CP23 = CP;
T3 = T3_corr
PW2 = W2*CP23*(T3-T2)








