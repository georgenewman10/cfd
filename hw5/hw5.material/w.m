N = 5;

A = diag(zeros(N,1),0) + diag(ones(N-1,1),1) - diag(ones(N-1,1),-1);
  A = .5*A;
  C = diag(ones(N,1),0);
  
  A(1,N-1) = -.5;
  A(N,2) = .5;