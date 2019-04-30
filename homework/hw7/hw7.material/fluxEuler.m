function F = fluxEuler(U,g)

p = (g-1)*(U(3)-((U(2)^2/U(1))/2));
F(1) = U(2);
F(2) = ((U(2)^2)/U(1)) + p;
F(3) = (U(2)/U(1))*(U(3)+p);

end