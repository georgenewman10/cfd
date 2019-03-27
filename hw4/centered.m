function [tn,yn] = centered(fh,t0,y0,yend,h,n)
yn = zeros(n);
tn = zeros(n);
yn(1)=y0;
tn(1)=t0;
yn(n)=yend;

for i=1:n-1
    ynew    = yn(i) + (h/2)*feval(fh,tn(i),yn(i));
    yn(i+1) = yn(i) + h*feval(fh,tn(i)+(h/2),ynew);
    tn(i+1) = tn(i) + h;
end
end
