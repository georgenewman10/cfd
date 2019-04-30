function trapFunc(h)

f = @(x,y) (-50*(y-cos(x)));
N = 1/h;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    ynew = y(n) + (h/2)*f(x(n),y(n));
    y(n+1) = y(n) + (h/2)*( f(x(n),y(n)) + f(x(n+1),ynew) );
end
plot(x,y)
hold on