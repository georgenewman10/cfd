clc; clear all; close all;

f = @(t,y) (-10*y);
y0 = 1;
t0 = 0;
h = .5;
n = 1/h;

method = {@fwd,@bwd,@mid,@trap,@ab2,@rk2,@rk4};
styles = {'k.-','rs-','go-','b*-','ko-','',''};
leg = {'Forward','Backward','Midpoint','Trapeziodal',...
    'AB2','RK2','RK4',};   % for plots



figure(1)
for j = 1
    [y,t] = feval(method{j},f,y0,t0,h,n);
    plot(t(1:n),y(1:n),styles{j})
    hold on
end
legend(leg);
