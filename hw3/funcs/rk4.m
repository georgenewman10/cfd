function [yn,tn] = rk4(fh,y0,t0,h,n)
yn = zeros(n);
tn = zeros(n);
yn(1)=y0;
tn(1)=t0;

for i = 1:n
    k1 = feval(fh,tn(i),yn(i));
    k2 = feval(fh,tn(i)+(h/2),yn(i)+(h*k1/2));
    k3 = feval(fh,tn(i)+(h/2),yn(i)+(h*k2/2));
    k4 = feval(fh,tn(i)+h,yn(i)+h*k3);
    yn(i+1) = yn(i)+h*((1/6)*k1+(1/3)*k2+(1/3)*k3+(1/6)*k4);
    tn(i+1) = tn(i) + h;
end
end


