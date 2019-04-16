function [mG,pG,G]=laxwendroff(x,s)

% lax wendroff

G = 1 - s^2 + s^2*cos(x) - 1i*s*sin(x);
Ge=exp(-1i*s*x);
mG=abs(G);
pG=angle(G)./angle(Ge);