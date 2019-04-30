function W = U2W(U,g)

% I would comment what is being done, but the comments
% would be the same as the actual code i.e. for the first 
% line below: The first entry in W is set equal to the 
% first entry in U, which is rho. 

W(1) = U(1);
W(2) = U(2)/U(1);
W(3) = (g-1) * (U(3)-((U(2)^2/U(1))/2));

end