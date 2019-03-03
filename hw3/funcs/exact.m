clc; clear all; close all;
f = @(x,y) (-50*(y-cos(x)));

xspan = [0 1];
y0 = 0;
h = 0.01;
N = 1/h;
[x,y] = ode45(@(x,y) f(x,y), xspan, y0);
plot(x,y)

