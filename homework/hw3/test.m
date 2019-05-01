clc; clear all; close all;

f = @(t,y) (-10*y);
y0 = 1;
t0 = 0;
%h = .2;
%n = 2/h;
%n=round(n);

method = {@fwd,@bwd,@mid,@trap,@ab2,@rk2,@rk4};
%{
%%% fwd euler
h = [.04 .08 .25 .4];
n = 2./h;
n = round(n);
figure(1)
for i = 1:length(h)
    [t,y] = feval(method{1},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Forward Euler - Stable and Unstable')
legend('h = .04','h = .08','h = .4','h = .5','Exact', 'Location', 'southwest');
hold off
print('fwd_stable_and_unstable', '-dpng');

h = [.15 .18];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{1},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Forward Euler - Barely Stable')
legend('h = .15','h = .18','Exact', 'Location', 'southwest');
hold off
print('fwd_barely_stable', '-dpng')


h = [.21 .23];
n = 2./h;
n = round(n);
figure(3)
for i = 1:length(h)
    [t,y] = feval(method{1},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Forward Euler - Barely Unstable')
legend('h = .21','h = .23','Exact', 'Location', 'southwest');
hold off
print('fwd_barely_unstable', '-dpng')
%}
%{
%%% bwd euler
h = [.05 .1 .2 .3];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{2},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Backward Euler with varying h')
legend('h = .05', 'h = .1','h = .2','h = .3','Exact', 'Location', 'southwest');
hold off
print('bwd_vs_exact', '-dpng')
%}
%{
%%% midpoint
h = [.05 .1 .2 .3];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{3},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Midpoint with varying h')
legend('h = .05', 'h = .1','h = .2','h = .3','Exact', 'Location', 'southwest');
hold off
print('mid_vs_exact', '-dpng')
%}
%{
%%% AB2
h = [.02 .05 .15 .25];
n = 2./h;
n = round(n);
figure(1)
for i = 1:length(h)
    [t,y] = feval(method{5},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('AB2 - Stable and Unstable')
legend('h = .02','h = .05','h = .15','h = .25','Exact', 'Location', 'southwest');
hold off
print('ab2_stable_and_unstable', '-dpng');

h = [.08 .09];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{5},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('AB2 - Barely Stable')
legend('h = .08','h = .09','Exact', 'Location', 'southwest');
hold off
print('ab2_barely_stable', '-dpng')


h = [.11 .12];
n = 2./h;
n = round(n);
figure(3)
for i = 1:length(h)
    [t,y] = feval(method{5},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('Forward Euler - Barely Unstable')
legend('h = .11','h = .12','Exact', 'Location', 'southwest');
hold off
print('ab2_barely_unstable', '-dpng')
%}
%{
%%% rk2
h = [.04 .08 .3 .4];
n = 2./h;
n = round(n);
figure(1)
for i = 1:length(h)
    [t,y] = feval(method{6},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK2 - Stable and Unstable')
legend('h = .04','h = .08','h = .3','h = .4','Exact', 'Location', 'southwest');
hold off
print('rk2_stable_and_unstable', '-dpng');

h = [.18 .19];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{6},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK2 - Barely Stable')
legend('h = .18','h = .19','Exact', 'Location', 'southwest');
hold off
print('rk2_barely_stable', '-dpng')


h = [.21 .22];
n = 2./h;
n = round(n);
figure(3)
for i = 1:length(h)
    [t,y] = feval(method{6},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK2 - Barely Unstable')
legend('h = .21','h = .22','Exact', 'Location', 'southwest');
hold off
print('rk2_barely_unstable', '-dpng')
%}
%{
%%% rk4
h = [.1 .2 .3 .4];
n = 2./h;
n = round(n);
figure(1)
for i = 1:length(h)
    [t,y] = feval(method{7},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK4 - Stable and Unstable')
legend('h = .1','h = .2','h = .3','h = .4','Exact', 'Location', 'southwest');
hold off
print('rk4_stable_and_unstable', '-dpng');

h = [.27 .26];
n = 2./h;
n = round(n);
figure(2)
for i = 1:length(h)
    [t,y] = feval(method{7},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK4 - Barely Stable')
legend('h = .27','h = .26','Exact', 'Location', 'southwest');
hold off
print('rk4_barely_stable', '-dpng')


h = [.28 .29];
n = 2./h;
n = round(n);
figure(3)
for i = 1:length(h)
    [t,y] = feval(method{7},f,y0,t0,h(i),n);
    semilogy(t(1:n),abs(y(1:n)))
    hold on
end
[to,yo] = ode45(f,[0 1.5],y0);
semilogy(to,yo,'k')
xlim([0 1.5])
xlabel('Time, t')
ylabel('|y|')
title('RK4 - Barely Unstable')
legend('h = .28','h = .29','Exact', 'Location', 'southwest');
hold off
print('rk4_barely_unstable', '-dpng')
%}