%{
figure
sigma = .25;
colors = {'ko-','go-','co-','mo-'};
for k = 1:4
    clear out
    out=wave_solve(c,L,n,sigma,T,M,u0,method{k});         
   
    plot(out.x,out.U(:,2),colors{k});
    hold on            
    axis([0,L,-1.1,1.1]);
    xlabel('x');
    ylabel('u(x) and numerical solutions');
    title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
end
plot(xx,u0(xx-out.TT(2)),'r-');
legend('Forward Upwind','Implicit Central','Beam Warming',...
    'Lax Wendroff','Exact')


figure
sigma = .5;
colors = {'ko-','go-','co-','mo-'};
for k = 1:4
    clear out
    out=wave_solve(c,L,n,sigma,T,M,u0,method{k});         
   
    plot(out.x,out.U(:,2),colors{k});
    hold on            
    axis([0,L,-1.1,1.1]);
    xlabel('x');
    ylabel('u(x) and numerical solutions');
    title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
end
plot(xx,u0(xx-out.TT(2)),'r-');
legend('Forward Upwind','Implicit Central','Beam Warming',...
    'Lax Wendroff','Exact')


figure
sigma = .75;
colors = {'ko-','go-','co-','mo-'};
for k = 1:4
    clear out
    out=wave_solve(c,L,n,sigma,T,M,u0,method{k});         
   
    plot(out.x,out.U(:,2),colors{k});
    hold on            
    axis([0,L,-1.1,1.1]);
    xlabel('x');
    ylabel('u(x) and numerical solutions');
    title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
end
plot(xx,u0(xx-out.TT(2)),'r-');
legend('Forward Upwind','Implicit Central','Beam Warming',...
    'Lax Wendroff','Exact')


figure
sigma = 1.25;
colors = {'ko-','go-','co-','mo-'};
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
%}