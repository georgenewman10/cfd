clear all; close all; clc;

c=1;        % advective speed
L=2*pi;     % computational domain [0,L]
T=2*2*pi;   % end time
M=0;        % intermediate solutions
fig=1; 
%fexact='exact.dat';
%exact = zeros(52,2);

sigma = [.25, .5, .75];            % Courant number
n=[25, 50, 100, 200, 400];       % number of interior points
methods = {'forward-upwind', 'lax-wendroff'};

u0 = @(x) sin(x-T);   % initial condition

for s = 1:length(sigma)
    for i = 1:length(methods)
        for j = 1:length(n)
            out=wave_solve(c,L,n(j),sigma(s),T,M,u0,methods{i});
            %figure(fig)
            %plot(out.x,out.U(:,2));
            %axis([0,L,-1.1,1.1]);
            %hold 
            exact_U = u0(out.x-out.TT(end));
            
            N = n(j)+2;
            e(j) = (1/N) * norm(out.U'-exact_U);
            E{s,i} = e;
            H(j) = out.h;
        end
        %xlabel('x');
        %ylabel('u(x) and numerical solution');
        %title(sprintf('Time is %f. Sigma=%f. Method is %s',out.TT(end),...
            %sigma(s),methods{i}));
        %legend('n','n','n','n','n');
        %hold off
        %fig = fig+1;
        %figure
        %loglog(out.x,E{s,i})
        %hold on
        if i==1
            spec = '--o';
        end
        if i==2
            spec = '-s';
        end
        loglog((1./H),E{s,i},spec)
        
        hold on
        title('Error vs 1/h')
        xlabel('1/h')
        ylabel('error')
        
        axis([-10 60 10^-6 10^0])
        
    end
end

lgd = legend({'\sigma=0.25','\sigma=0.25','\sigma=0.50','\sigma=0.50',...
    '\sigma=0.75','\sigma=0.75'},'Location', 'southwest', 'NumColumns',2,...
    'Orientation','horizontal',...
    'FontSize',10);
title(lgd,'First-Order Upwind  Lax Wendroff')







