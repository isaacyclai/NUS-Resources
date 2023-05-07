% Householder reflecor
% x is a vector such that H*x = [norm(x); 0; 0...]. s is (i-1)-th column of 
% the matrix we are doing QR factorisation on.function HH = house(x,s) 
function HH = house(x,s)
L = length(x);
norm = sqrt(x'*x);
x(1) = x(1) - norm;
H = eye(L) - 2*(x*x')/(x'*x); % H = I*-2*P
if s == 0
    HH = H;
else
    HH = [eye(s) zeros(s,L); zeros(L,s) H]; % HH = [I 0; 0 H]
end