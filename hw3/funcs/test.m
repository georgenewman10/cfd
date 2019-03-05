clc; clear all; close all;

f = @(x,y) (-50*(y-cos(x)));


method = {@fwd,@bwd,@mid,@trap,@ab2,@rk2,@rk4};

y0 = 0;
h = .01;
n = 1/h;

figure(1)
for j = 1:length(method)
    [y,t] = feval(method{j},f,y0,0,h,n);
    plot(t(1:n),y(1:n))
    hold on
end