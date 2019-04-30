clc; clear all; close all;
f = @(x,y) (-50*(y-cos(x)));
h = 0.01;
N = 1/h;
figure


%%% Exact %%%
xspan = [0 1];
y0 = 0;
[x,y] = ode45(@(x,y) f(x,y), xspan, y0);
plot(x,y,'k','LineWidth',1.5)

hold on
%%%%%%%%%%%%%


%%% Explicit Euler %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    y(n+1) = y(n) + h*f(x(n),y(n));
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%%%%%%%%%%%


%%% Implicit Euler %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    ynew = y(n) + h*f(x(n),y(n));
    y(n+1) = y(n) + h*f(x(n+1),ynew);
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%%%%%%%%%%%


%%% Midpoint %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    ynew = y(n) + (h/2)*f(x(n),y(n));
    y(n+1) = y(n) + h*f(x(n)+(h/2),ynew);
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%%%%%


%%% Trapeziodal %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    ynew = y(n) + (h/2)*f(x(n),y(n));
    y(n+1) = y(n) + (h/2)*( f(x(n),y(n)) + f(x(n+1),ynew) );
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%%%%%%%%


%%% AB2 %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    f_value = f(x(n),y(n));
    f_old = f_value;
    y(n+1) = y(n) + h*(3*f_value - f_old)/2;
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%


%%% RK2 %%%
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    k1 = h*f(x(n),y(n));
    k2 = h*f(x(n)+(h/2),y(n)+(k1/2));
    y(n+1) = y(n) + k2;
end
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%


%%% RK4 %%%
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
plot(x,y,'LineWidth',.75)
hold on
%%%%%%%%%%%%

legend({'Exact','Explicit Euler', 'Implicit Euler', 'Midpoint', ... 
    'Trapeziodal', 'AB2', 'RK2', 'RK4'}, 'Location','southeast', ...
    'numColumns',2)
title('Various Methods vs. Exact Solution (ode45)')
xlabel('x')
ylabel('y')












