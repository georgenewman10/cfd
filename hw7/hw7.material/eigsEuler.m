function lambda = eigsEuler(U,g)

A = zeros(3,3);

p = (g-1)*(U(3)-((U(2)^2/U(1))/2));
a = sqrt(g*p/U(1));
u = (U(2)/U(1));


A(1,1) = 0;
A(1,2) = 1;
A(1,3) = 0;

A(2,1) = (g-3) * (u^2/2);
A(2,2) = (3-g) * u;
A(2,3) = g-1;

A(3,1) = (g-2) * (u^3/2) - (a^2*u)/(g-1);
A(3,2) = (3-2*g)*(u^2/2) + a^2/(g-1);
A(3,3) = g*u;

lambda = eig(A);



end