clc; clear all; close all;
N = 1:20;
vals = [];
for i=1:20
    n = i;
    T = full(gallery('tridiag',n,1,-2,1));
    vals(i) = max(abs(eig(T)));
end

plot(N, vals)
title('Max |Eigenvalue| vs. N')
xlabel('N')
ylabel('Max |Eigenvalue|')