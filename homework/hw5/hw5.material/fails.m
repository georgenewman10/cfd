%fails


%{
clear out
out=wave_solve(c,L,n,sigma,T,M,u0,method{1});         
%exact(:,i)=u0(xx-out.TT(i))';
plot(xx,u0(xx-out.TT(2)),'r-', out.x,out.U(:,2),'ko-');
hold on            
axis([0,L,-1.1,1.1]);
xlabel('x');
ylabel('u(x) and numerical solution');
title(sprintf('Time: 4pi. Sigma: %.2f',sigma));


clear out
out=wave_solve(c,L,n,sigma,T,M,u0,method{2});           
%exact(:,i)=u0(xx-out.TT(i))';
plot(out.x,out.U(:,2),'go-');
hold on            
axis([0,L,-1.1,1.1]);
xlabel('x');
ylabel('u(x) and numerical solution');
title(sprintf('Time: 4pi. Sigma: %.2f',sigma));

clear out
out=wave_solve(c,L,n,sigma,T,M,u0,method{3});           
%exact(:,i)=u0(xx-out.TT(i))';
plot(out.x,out.U(:,2),'co-');
hold on            
axis([0,L,-1.1,1.1]);
xlabel('x');
ylabel('u(x) and numerical solution');
title(sprintf('Time: 4pi. Sigma: %.2f',sigma));

clear out
out=wave_solve(c,L,n,sigma,T,M,u0,method{4});           
%exact(:,i)=u0(xx-out.TT(i))';
plot(out.x,out.U(:,2),'yo-');
hold on            
axis([0,L,-1.1,1.1]);
xlabel('x');
ylabel('u(x) and numerical solution');
title(sprintf('Time: 4pi. Sigma: %.2f',sigma));

legend('Forward Upwind','Exact','Implicit Central','Beam Warming',...
    'Lax Wendroff')
%}












%{
for k = 1:4         % loop through the different sigma values
    
    figure          % make a figure for each sigma value 
    
    for j = 1:4     % loop through the different methods
        
        % caluculate values with each sigma and each method
        clear out
        out=wave_solve(c,L,n,sigma{k},T,M,u0,method{j});
        
        
        for i=1:size(out.U,2)
  
            exact(:,i)=u0(xx-out.TT(i))';
            plot(out.x,out.U(:,i),'ko-',...
                xx,u0(xx-out.TT(i)),'r-');
            
            axis([0,L,-1.1,1.1]);
            xlabel('x');
            ylabel('u(x) and numerical solution');
            title(sprintf('Time: 4pi. Sigma: %.2f',sigma{k}));
            hold on
        end
       
        
    end
    
end
%}

%{
figure
sigma = .25;
for j = 1:4
    
    out=wave_solve(c,L,n,sigma,T,M,u0,method{j});        
    
    for i=1:size(out.U,2)
  
        exact(:,i)=u0(xx-out.TT(i))';
        plot(out.x,out.U(:,i),'ko-',...
            xx,u0(xx-out.TT(i)),'r-');
            
        axis([0,L,-1.1,1.1]);
        xlabel('x');
        ylabel('u(x) and numerical solution');
        title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
        
    end
    hold on
end
%}

%{
figure
sigma = .25;
clear out
out=wave_solve(c,L,n,sigma,T,M,u0,'forward-upwind');        
    
for i=1:size(out.U,2)
  
    %exact(:,i)=u0(xx-out.TT(i))';
	plot(out.x,out.U(:,i),'ko-',...
        xx,u0(xx-out.TT(i)),'r-');
            
	axis([0,L,-1.1,1.1]);
	xlabel('x');
	ylabel('u(x) and numerical solution');
	title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
    
end
hold on


clear out
out=wave_solve(c,L,n,sigma,T,M,u0,'implicit-central');        

for i=1:size(out.U,2)
  
    %exact(:,i)=u0(xx-out.TT(i))';
	plot(out.x,out.U(:,i),'ko-',...
        xx,u0(xx-out.TT(i)),'r-');
            
	axis([0,L,-1.1,1.1]);
	xlabel('x');
	ylabel('u(x) and numerical solution');
	title(sprintf('Time: 4pi. Sigma: %.2f',sigma));
	hold on
end
%}
























