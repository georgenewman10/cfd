clear all; close all; clc;

c=1;        % advective speed
L=2*pi;     % computational domain [0,L]
T=2*2*pi;   % end time
M=0;        % intermediate solutions

fexact='exact.dat';

sigma = [.25, .5, .75];            % Courant number
n=[25, 50, 100, 200, 400];       % number of interior points

%method='forward-upwind';
%method='implicit-central';
%method='beam-warming';
method='lax-wendroff';

for q = 1:3         % sigma    
    figure
    for j = 1:5     % n


        % initial conditions
        u0 = @(x) sin(x-T);  % anonymous function

        % solve
        out=wave_solve(c,L,n(j),sigma(q),T,M,u0,method);
        
        
        
        % plot
        xx=linspace(0,L,1000);
        for i=1:size(out.U,2)
          exact(:,i)=u0(out.x'-out.TT(i))';
          
          %plot(out.x,out.U(:,i),...
          %     xx,u0(xx-out.TT(i)),'r-');

          plot(out.x,out.U(:,i))


          axis([0,L,-1.1,1.1]);
          xlabel('x');
          ylabel('u(x) and numerical solution');
          title(sprintf('Time is %f. Sigma=0.75. Lax-Wendroff',out.TT(i)));

        end
        hold on
        
        
        e(q,j) = (1/n(j)+2) * norm(out.U-exact);
    

        % dump
        %fout=sprintf('%s_n%g_sigma%f.dat',method,n(j),sigma(q));
        %dlmwrite(fout,[out.x',out.U],'delimiter',' ','precision','%e');
        %dlmwrite(fexact,[xx',exact],'delimiter',' ','precision','%e');
    
    end
end



legend('N=25','N=50','N=100','N=200','N=400','Exact')
