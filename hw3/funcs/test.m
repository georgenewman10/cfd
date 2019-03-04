clc; clear all; close all;
%fun = @(x) sin(x);

fun = @(x,y) (-50*(y-cos(x)));


method = {@eulerfwd, @midpoint};

x0 = 0;
h = .01;
n = 100;

figure(1)
for j = 1:length(method)
    [y,t] = feval(method{j},fun,x0,0,h,n);
    plot(t,y)
    hold on
end