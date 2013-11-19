clear all

% Main

% Constants

global R deltah deltahpyr TactVol Bv epsilon boltzmann YO2inf YO2;

R = 8.3144621; % Gas constants

deltah = 32e6; % Heat value [j/kg]

deltahpyr = 42e4; % Heat needed for combustion [j/kg]

TactVol=8860; % Tact [K]

Bv= 37e4; % Bv

epsilon = 0.8; % emissivity of coal particle

boltzmann = 1.3806488e-23; % boltzmann constant [m2*kg /s^2 / K]

YO2inf = 0.21 * 0.032 / (0.21 * 0.032 + 0.79 * 0.028); % Concentration of O2

% Define Coal Particle

% Bituminous
wAsh= 0.10;
wVolatile = 0.10;
wCarbon = 0.80;

global w;
w=[wAsh,wVolatile,wCarbon]';

% Parameters

global mflowInitial mash d dens m mShare Vstar v1 B1 Tair Twall Sh D densAir dash;

d = 250e-6; % Diameter [m]

dens = 2000; % Density [kg / m^3]

m = dens * (pi*d^3/6); % Initial mass [kg]

mShare = m*w;% mshare [kg]

Vstar = mShare(2,1); % Vstar 

mash = mShare(1,1);

dash = ((6*mash)/ (dens * pi))^(1/3);

V=0; % V initial [kg]

T=300; % T initial [K]

YO2 = 1; % O2 Concentration

v1= 31.99/12.01; % stochiometry

B1 = 450; % B1 [m/s]

Tair = 1500; % T air or infinity [K]

Twall = 800; % T wall or surrounding [K]

Sh = 2; % Sherwood number, 
% equal to 2 when velocity of particlae is similar 
% to Velocity of air

D = 1.57e-4; % [m^2/s] Mass diffusity of CO2 in N2

densAir = 101325 * 0.03 ./ (R * T);


Pabs = 101325; 
densAir = 101325 * 0.03 ./ (R * T);
MWair = 0.03; % [kg/mol]
D = (T/393).^1.5 * 1.6e-5; % Mass diffusivity for CO2 in N2, corrected to T;

%mflowInitial= v1 * pi * d^2 * densAir * YO2inf * B1 * exp(-7980/T);

mflowInitial=2 * pi * d * densAir * D * log((1+YO2inf/v1)/(1+YO2/v1));