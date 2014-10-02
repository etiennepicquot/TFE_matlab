%% TurboJet

%% Data Input

% 1 : general : AMB

T1 = 288; % Total Temp [K]
P1 = 1.01*10^5; % Total Press [Pa]

% 2-3 : Compressor

W2 = 82; % mass flow [kg/s]
P3Q2 = 25; % Press ratio
GAM2 = 1.4; % 
ETA2 = 0.85; % Eff 
CP23 = 1050; % Cp [J/kg.K]

% 3-4 : Combustor

CP34 = 1180; % Cp [J/kg.K]
FHV = 43.1*10^6; % Fuel Heating Value [J/kg]
T4 = 1600; % Temp inlet turb [K]

% 4-5 : Turbine

ETA4 = 0.88; % Eff 
CP45 = 1250; % Cp [J/kg.K]
GAM4 = 1.29; % 

% 5-8 : Nozzle(conv)

CP79 = 1220; % Cp [J/kg.K]
GAM5 = 1.31; % 

%% Computation

% 2-3 : Compressor

T2 = T1;
P2 = P1;% voir RR inlet

%W2 = W1;

[T3 P3 PW2]=compressor_func(W2,T2,P2,P3Q2,ETA2,CP23,GAM2);

% 3-4 : Combustor

W3 = W2;

[P4 PW3 WF] = combustor_func(W3,T3,P3,T4,CP34,FHV);

% 4-5 : Turbine

W4 = W3;

[ T5 P5 PW4 ] = turbine_func( W4,T4,P4,ETA4,CP45,GAM4,PW2);

% 5-8 : Nozzle(conv)
W5 = W4;

PS9 = P2;
exitXM =  sqrt ( (2/(GAM5-1))  * (  ( PS9/P5  )^((1-GAM5)/GAM5)   -1  ));
TS9 = T5 / (   1  +  ((GAM5-1)/2)*(exitXM^2)); 
R9 = CP79*((GAM5-1)/GAM5); 
VS9 = sqrt(GAM5*R9*TS9); 
VJET = exitXM*VS9; 
FN = (W5*VJET); 
PW5 = (T5-TS9)*CP79*W5; 

%% OUTPUT

ETACYCLE = PW5/PW3 % Cycle Eff
SFC = (1000*WF)/(FN/1000) % [g/(kN.s)]
