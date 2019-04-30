function W = U2W(U,g)

% I would comment what is being done, but the comments
% would be the same as the actual code i.e. for the first 
% line below: The first entry in W is set equal to the 
% first entry in U, which is rho. 

W(1) = U(1);
W(2) = U(2)/U(1);
W(3) = (g-1) * (U(3)-((U(2)^2/U(1))/2));

end

function lambda = eigsEuler(U,g)

A = zeros(3,3);
p = (g-1)*(U(3)-((U(2)^2/U(1))/2)); % defining p to make code clear
a = sqrt(g*p/U(1));                 % defining a to make code clear
u = (U(2)/U(1));                    % defining u to make code clear

% defining the jacobian matrix based on known values: gamma, a, u

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

function F = fluxEuler(U,g)

p = (g-1)*(U(3)-((U(2)^2/U(1))/2)); % defining p to make code more clear
F(1) = U(2);
F(2) = ((U(2)^2)/U(1)) + p;
F(3) = (U(2)/U(1))*(U(3)+p);

end

