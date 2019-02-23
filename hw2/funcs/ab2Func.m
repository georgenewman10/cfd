function [work,final] = ab2Func(N)
work = 0;
f = @(x,y) (-50*(y-cos(x)));
%N = 1/h;
h = 1/N;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    f_value = f(x(n),y(n));
    work = work + 1;
    f_old = f_value;
    y(n+1) = y(n) + h*(3*f_value - f_old)/2;
end
%plot(x,y)
%hold on
final = y(N);


