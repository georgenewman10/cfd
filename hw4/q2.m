clc; clear all; close all;

n = 10;
h = 1/(n+1);
tri = full(gallery('tridiag',n,1,-2,1));

func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;
f = [];
x = [];

for i=1:n
    x(i) = h*i;
    f(i) = func(x(i));
end
f(n) = f(n) - 2;

x = [0 x 1];

answer = tri\f';
answer = [0;answer;2];

plot(x,answer)