function rk2Func(h)

f = @(x,y) (-50*(y-cos(x)));
N = 1/h;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    k1 = h*f(x(n),y(n));
    k2 = h*f(x(n)+(h/2),y(n)+(k1/2));
    y(n+1) = y(n) + k2;
end
plot(x,y)
hold on