clc; clear all; close all;
true = exactFunc();
N = [50 60 70 80 90 100 110 120 130 140];
e = [];
M = [];





[M(1),e(1)] = expEulerFunc(50);
[M(2),e(2)] = expEulerFunc(60);
[M(3),e(2)] = expEulerFunc(60);

[M(2),e] = impEulerFunc(100);
[M(3),e] = midpointFunc(100);
[M(4),e] = trapFunc(100);
[M(5),e] = ab2Func(100);
[M(6),e] = rk2Func(100);
[M(7),e] = rk4Func(100);


%{
%%% exp E
e = zeros(1,10);
[~,e(1)] = abs(expEulerFunc(50) - true);
e(2) = abs(expEulerFunc(60) - true);
e(3) = abs(expEulerFunc(70) - true);
e(4) = abs(expEulerFunc(80) - true);
e(5) = abs(expEulerFunc(90) - true);
e(6) = abs(expEulerFunc(100) - true);
e(7) = abs(expEulerFunc(110) - true);
e(8) = abs(expEulerFunc(120) - true);
e(9) = abs(expEulerFunc(130) - true);
e(10) = abs(expEulerFunc(140) - true);
plot(N,e)
hold on


%%% imp Euler
e = zeros(1,10);
e(1) = abs(impEulerFunc(50) - true);
e(2) = abs(impEulerFunc(60) - true);
e(3) = abs(impEulerFunc(70) - true);
e(4) = abs(impEulerFunc(80) - true);
e(5) = abs(impEulerFunc(90) - true);
e(6) = abs(impEulerFunc(100) - true);
e(7) = abs(impEulerFunc(110) - true);
e(8) = abs(impEulerFunc(120) - true);
e(9) = abs(impEulerFunc(130) - true);
e(10) = abs(impEulerFunc(140) - true);
%plot(N,e)
hold on


%%% mid
e = zeros(1,10);
e(1) = abs(midpointFunc(50) - true);
e(2) = abs(midpointFunc(60) - true);
e(3) = abs(midpointFunc(70) - true);
e(4) = abs(midpointFunc(80) - true);
e(5) = abs(midpointFunc(90) - true);
e(6) = abs(midpointFunc(100) - true);
e(7) = abs(midpointFunc(110) - true);
e(8) = abs(midpointFunc(120) - true);
e(9) = abs(midpointFunc(130) - true);
e(10) = abs(midpointFunc(140) - true);
plot(N,e)
hold on

%%% trap
e = zeros(1,10);
e(1) = abs(trapFunc(50) - true);
e(2) = abs(trapFunc(60) - true);
e(3) = abs(trapFunc(70) - true);
e(4) = abs(trapFunc(80) - true);
e(5) = abs(trapFunc(90) - true);
e(6) = abs(trapFunc(100) - true);
e(7) = abs(trapFunc(110) - true);
e(8) = abs(trapFunc(120) - true);
e(9) = abs(trapFunc(130) - true);
e(10) = abs(trapFunc(140) - true);
plot(N,e)
hold on

%%% ab2
e = zeros(1,10);
e(1) = abs(ab2Func(50) - true);
e(2) = abs(ab2Func(60) - true);
e(3) = abs(ab2Func(70) - true);
e(4) = abs(ab2Func(80) - true);
e(5) = abs(ab2Func(90) - true);
e(6) = abs(ab2Func(100) - true);
e(7) = abs(ab2Func(110) - true);
e(8) = abs(ab2Func(120) - true);
e(9) = abs(ab2Func(130) - true);
e(10) = abs(ab2Func(140) - true);
plot(N,e)
hold on

%%% rk2
e = zeros(1,10);
e(1) = abs(rk2Func(50) - true);
e(2) = abs(rk2Func(60) - true);
e(3) = abs(rk2Func(70) - true);
e(4) = abs(rk2Func(80) - true);
e(5) = abs(rk2Func(90) - true);
e(6) = abs(rk2Func(100) - true);
e(7) = abs(rk2Func(110) - true);
e(8) = abs(rk2Func(120) - true);
e(9) = abs(rk2Func(130) - true);
e(10) = abs(rk2Func(140) - true);
plot(N,e)
hold on


%%% rk4
e = zeros(1,10);
e(1) = abs(rk4Func(50) - true);
e(2) = abs(rk4Func(60) - true);
e(3) = abs(rk4Func(70) - true);
e(4) = abs(rk4Func(80) - true);
e(5) = abs(rk4Func(90) - true);
e(6) = abs(rk4Func(100) - true);
e(7) = abs(rk4Func(110) - true);
e(8) = abs(rk4Func(120) - true);
e(9) = abs(rk4Func(130) - true);
e(10) = abs(rk4Func(140) - true);
plot(N,e)
hold on
legend({'Explicit Euler','Implicit Euler','Midpoint','Trapezoidal',...
    'AB2','RK2','RK4'}, 'Location','southeast')
title('Global Error vs Inverse Stepsize')
xlabel('1/h')
ylabel('Global Error')

%}
