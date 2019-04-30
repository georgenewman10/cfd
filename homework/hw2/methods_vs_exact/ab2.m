clc; clear all; close all;
f = @(x,y) (-50*(y-cos(x)));
h = 0.01;
N = 1/h;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    f_value = f(x(n),y(n));
    f_old = f_value;
    y(n+1) = y(n) + h*(3*f_value - f_old)/2;
end
figure
plot(x,y,'r','LineWidth',1.5)
hold on

xspan = [0 1];
y0 = 0;
h = 0.01;
N = 1/h;
[x,y] = ode45(@(x,y) f(x,y), xspan, y0);
plot(x,y,'--k')
legend('AB2', 'Exact Solution')
title('AB2')
xlabel('x')
ylabel('y')