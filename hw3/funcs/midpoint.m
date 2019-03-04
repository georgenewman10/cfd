function [yn,tn] = midpoint(fh,y0,t0,h,n)

yn(1)=y0;
tn(1)=t0;

for i=1:n
    ynew = yn(i) + (h/2)*feval(fh,tn(i),yn(i));
    yn(i+1) = yn(i) + h*feval(fh,tn(i)+(h/2),ynew);
    tn(i+1) = tn(i) + h;
end
end
