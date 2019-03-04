clc; clear all; close all;

%fun = @(x) sin(x);

fun = @(x,y) (-50*(y-cos(x)));


method = {@trapFunc};

y0 = 0;
h = .01;
n = 1/h;

figure(1)
for j = 1:length(method)
    [y,t] = feval(method{j},fun,y0,0,h,n);
    plot(t,y)
    hold on
end