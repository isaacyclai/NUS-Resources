% QR factorisation using Householder reflectors
function [Q,R] = hhqr(M)
n = length(M);
Q = eye(n);
for i = 1:(n-1)
    H = house(M(i:n,i),i-1); % Householder reflector for column i
    M = H*M;
    Q = Q*H;
end
R = M;