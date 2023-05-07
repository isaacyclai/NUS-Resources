% QR iteration
function [Q,D] = qrit(M,k)
n = length(M);
Q = eye(n);
M = uhess(M); % transform M into upper Hessenberg form
for i = 1:k
    [Qi,Ri] = givensqr(M);
    M = Ri*Qi;
    Q = Q*Qi;
end
D = diag(M);