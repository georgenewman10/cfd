clc; clear all; close all;

n = 10;
h = 1/(n+1);
tri = full(gallery('tridiag',n,1,-2,1));
tri(1,1) = -2/3;
tri(1,2) = 2/3;

func = @(x) (4*pi)^2*cos(4*pi*x)*h^2;
f = [];
x = [];

for i=1:n
    x(i) = h*i;
    f(i) = func(x(i));
end
f(1) = f(1) + (20/3)*h;
f(n) = f(n) - 2;

x = [0 x 1];

answer = tri\f';
u0 = -(20/3)*h+(4/3)*answer(1)-(1/3)*answer(2);

answer = [u0;answer;2];

plot(x,answer)