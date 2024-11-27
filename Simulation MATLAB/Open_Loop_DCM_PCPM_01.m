clear all
clc
syms s
s=tf('s');
%%
NPS=32/5;
Vout=24;
Vinmin=240;
Vinmax=380;
Iout=5.5;
Rout=Vout/Iout;
ACS=3;
Ipeak=4.5;
RCS=1/Ipeak;
Dmin=0.3;
Dmax=0.4;
Lp=360e-6;
fsw=50e3;
tauL=(2*Lp*fsw)/(Rout*NPS*NPS);
M=(Vout*NPS)/Vinmin;
G0=((Rout*NPS)/(RCS*ACS))/((1-Dmax)^2 +(2*M) + 1);
%%
Cout=600e-6;
RESR=43e-3;
WESRz=1/(RESR*Cout);
fESRz=WESRz/(2*pi);
%%
WRHP=((Rout*(1-Dmax)^2)*NPS^2)/(Lp*Dmax);
fRHP=WRHP/(2*pi);
%%
WP1=((((1-Dmax)^3)/tauL) + 1 + Dmax)/(Rout*Cout);
WP2=pi*fsw;
fP2=WP2/(2*pi);
%%
Hopen=G0*((1+s/WESRz)/(1+s/WP1))*((1-s/WRHP)/(1 + (s/(WP2*1)) + (s*s)/(WP2*WP2)));



