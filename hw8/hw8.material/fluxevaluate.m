function F=fluxevaluate(fh,kh,U,uL,uR,method)

%
% function F=fluxevaluate(fh,kh,U,uL,uR,method)
%
% fh: function handle to the flux function
% kh: k/h factor
% U:  solution at time t = t_n
% uL: left boundary condition u(-L)=uL
% uR: right boundary condotion u(+L)=uR
% method: one of 'first-order-upwind', 'law-wendroff',
%                'richtmyer', 'maccormack'

N=length(U);
F=zeros(N+1,1);

%
%     
%    F(1)  F(2)   F(3)       F(i-1)  F(i)   F(i+1)            F(N)   F(N+1)
%    |------|------|--- //  ---|-------|------|------|--- // ---|-----|
%       1      2                  i-1      i     i+1               N
%   -L                                                                L   
%

switch lower(method)
case 'first-order-upwind'

  % F(i) = F^L_i, the left numerical flux
  for i=2:N
     if ( U(i)>0 ) F(i)=feval(fh,U(i-1)); end;
     if ( U(i)<0 ) F(i)=feval(fh,U(i)); end;
  end

  % BCs

  % left
  if ( U(1)>0 ) F(1)=feval(fh,uL); end;
  if ( U(1)<0 ) F(1)=feval(fh,U(1)); end;

  % right
  if ( U(N)>0 ) F(N+1)=feval(fh,U(N)); end;
  if ( U(N)<0 ) F(N+1)=feval(fh,uR); end;
  

case 'lax-wendroff'

   % code here


case 'richtmyer'

   % code here

case 'maccormack'

   % code here

otherwise
  error('method is unknown');

end


