clear all; close all; clc;

c=1;        % advective speed
L=2*pi;     % computational domain [0,L]
T=2*2*pi;   % end time
M=0;        % intermediate solutions

fexact='exact.dat';

sigma= 0.25; % Courant number
%sigma = {.25,.5,.75,1.25};
n=25;       % number of interior points

%method='forward-upwind';
%method='implicit-central';
%method='beam-warming';
%method='lax-wendroff';
method = {'forward-upwind','implicit-central','beam-warming', ...
    'lax-wendroff'};


% initial conditions
u0 = @(x) sin(x);  % anonymous function

% solve
%out=wave_solve(c,L,n,sigma,T,M,u0,method);

% plot
xx=linspace(0,L,1000);



figure
sigma = 1;
colors = {'ko:','go:','co:','mo:'};
for k = 1:4
    clear out
    out=wave_solve(c,L,n,sigma,T,M,u0,method{k});         
   
    plot(out.x,out.U(:,2),colors{k});
    hold on            
    axis([0,L,-1.5,1.5]);
    xlabel('x');
    ylabel('u(x) and numerical solutions');
    title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
end
plot(xx,u0(xx-out.TT(2)),'r-');
legend('Forward Upwind','Implicit Central','Beam Warming',...
    'Lax Wendroff','Exact')




%dump
%fout=sprintf('%s_n%g_sigma%f.dat',method,n,sigma);
%dlmwrite(fout,[out.x',out.U],'delimiter',' ','precision','%e');
%dlmwrite(fexact,[xx',exact],'delimiter',' ','precision','%e');
