function [yn,tn] = rk2(fh,y0,t0,h,n)
yn = zeros(n);
tn = zeros(n);
yn(1)=y0;
tn(1)=t0;

for i = 1:n
    k1 = h*feval(fh,tn(i),yn(i));
    k2 = h*feval(fh,tn(i)+(h/2),yn(i)+(k1/2));
    yn(i+1) = yn(i) + k2;
    tn(i+1) = tn(i) + h;
end
end


