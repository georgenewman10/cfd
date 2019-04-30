clc; clear all; close all;
f = @(x,y) (-50*(y-cos(x)));
h = 0.01;
N = 1/h;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    k1 = f(x(n),y(n));
    k2 = f(x(n)+(h/2),y(n)+(h*k1/2));
    k3 = f(x(n)+(h/2),y(n)+(h*k2/2));
    k4 = f(x(n)+h, y(n) + h*k3);
    y(n+1) = y(n) + h*((1/6)*k1 + (1/3)*k2 + (1/3)*k3 + (1/6)*k4);
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
legend('RK4', 'Exact Solution')
title('RK4')
xlabel('x')
ylabel('y')