function [yn,tn] = eulerbkwd(fh,y0,t0,h,n)


yn(1)=y0;
tn(1)=t0;
for i=1:n
    yn(i+1)=step(fh,yn(i),tn(i),h);
    tn(i+1)=tn(i)+h;
end

function ynn = step(fh,yn,tn,h)
ynn = fsolve()