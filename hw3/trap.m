function [yn,tn] = trap(fh,y0,t0,h,n)
yn = zeros(n);
tn = zeros(n);
yn(1)=y0;
tn(1)=t0;

for i = 1:n
    ynew = yn(i) + (h/2)*feval(fh,tn(i),yn(i));
    tn(i+1) = tn(i) + h;
    yn(i+1) = yn(i) + (h/2)*(feval(fh,tn(i),yn(i)) + feval(fh,tn(i+1),ynew));
end
end

