% Transforms a matrix into upper Hessenberg form using Householder
% reflectors
function U = uhess(M)
n = length(M);
for i = 1:(n-2)
    H = house(M(i+1:n,i),i);
    M = H*M*H'; % note that inv(H)=H' since H is orthogonal
end
U = M;