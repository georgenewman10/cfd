clear all
close all
clc

%uh=@step; uL=2; uR=1; L=2; N=50; T=2/3; name='step';
uh=@hump; uL=1; uR=1; L=2; N=50; T=1/pi-1e-5; name='hump';

fh=@burgers; % exact flux function f=f(u)

method='first-order-upwind';
%method='lax-wendroff';
%method='richtmyer';
%method='maccormack';

sigma=0.75;

[xm,U]=advanceconservative(uh,fh,uL,uR,L,sigma,N,T,method);
x_=linspace(-L,L,10000); [xi,ui]=burgersanalytical(x_,uh,T);

plot(xm,U,'ro',xi,ui,'k-',xi,feval(uh,xi),'b-');
title( sprintf('time is %e',T) );
xlabel('x'); ylabel('u(x), U^n_i');
legend('numerical','analytical');
%axis([-0.5,L,0,2.5]);

% analytical at time t = T
dlmwrite(sprintf('%s_exact_T%e.dat',name,T),[xi',ui'],'precision','%e','delimiter',' ');

% numerical at time t = T
dlmwrite(sprintf('%s_%s_N%d_T%e.dat',name,method,N,T),[xm,U],'precision','%e','delimiter',' ');


