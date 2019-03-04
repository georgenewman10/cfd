function [yn,tn] = eulerfwd(fh,y0,t0,h,n)

yn(1)=y0;
tn(1)=t0;

for i=1:n
    yn(i+1) = yn(i) + h*feval(fh,tn(i),yn(i));
    tn(i+1) = tn(i) + h;
end
end