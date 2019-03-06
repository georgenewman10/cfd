function [yn,tn] = ab2(fh,y0,t0,h,n)
yn = zeros(n);
tn = zeros(n);
yn(1)=y0;
tn(1)=t0;

for i = 1:n
    f_value = feval(fh,tn(i),yn(i));
    f_old = f_value;
    yn(i+1) = yn(i) + h*(3*f_value - f_old)/2;
    tn(i+1) = tn(i) + h;
end
end

