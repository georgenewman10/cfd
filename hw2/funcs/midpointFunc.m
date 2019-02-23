function [work,final] = midpointFunc(N)
work = 0;
f = @(x,y) (-50*(y-cos(x)));
%N = 1/h;
h = 1/N;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    ynew = y(n) + (h/2)*f(x(n),y(n));
    work = work + 1;
    y(n+1) = y(n) + h*f(x(n)+(h/2),ynew);
    work = work + 1;
end
%plot(x,y)
%hold on
final = y(N);




