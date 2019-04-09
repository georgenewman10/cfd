N = 5;

A = zeros(N) + diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
A(1,N-1) = -1;
A(N,2) = 1;

B = zeros(N) -2* diag(ones(N,1),0) + diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
B(1,N-1) = 1;
B(N,2) = 1;