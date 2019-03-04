function [yn,tn] = trapFunc(fh,y0,t0,h,n)

yn(1)=y0;
tn(1)=t0;

for i = 1:n
    ynew = yn(i) + (h/2)*feval(fh,tn(i),yn(i));
    yn(i+1) = yn(i) + (h/2)*(feval(fh,tn(i),yn(i)) + feval(fh,tn(i+1),ynew));
    tn(i+1) = tn(i) + h;
end
end

