function [mG,pG,G]=fou(x,s)

% first order upwind

G = (1 - s + s*cos(x)) - 1i*s*sin(x);
Ge=exp(-1i*s*x);
mG=abs(G);
pG=angle(G)./angle(Ge);

