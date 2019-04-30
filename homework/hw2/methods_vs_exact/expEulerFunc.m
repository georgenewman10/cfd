function expEulerFunc(h)

f = @(x,y) (-50*(y-cos(x)));
N = 1/h;
x = linspace(0,1,N+1);
y = zeros(1,N+1);
y(1) = 0;
for n = 1:N
    y(n+1) = y(n) + h*f(x(n),y(n));
end
plot(x,y)
hold on
