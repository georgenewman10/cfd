function [work,final] = rk2Func(N)
work = 0;
f = @(x,y) (-50*(y-cos(x)));
%N = 1/h;
h = 1/N;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    k1 = h*f(x(n),y(n));
    work = work + 1;
    k2 = h*f(x(n)+(h/2),y(n)+(k1/2));
    work = work + 1;
    y(n+1) = y(n) + k2;
end
%plot(x,y)
%hold on
final = y(N);



