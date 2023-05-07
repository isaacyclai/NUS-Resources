% QR factorisation using Givens rotations
function [Q,R] = givensqr(M)
n = length(M);
Q = eye(n);
for i = 1:(n-1)
    for j = (i+1):n
        c = M(i,i)/sqrt(M(i,i)^2 + M(j,i)^2); % cos
        s = M(j,i)/sqrt(M(i,i)^2 + M(j,i)^2); % sin
        tmp = c*M(i,:) + s*M(j,:);
        M(j,:) = -s*M(i,:) + c*M(j,:);
        M(i,:) = tmp;
        tmp = c*Q(i,:) + s*Q(j,:);
        Q(j,:) = -s*Q(i,:) + c*Q(j,:);
        Q(i,:) = tmp;
    end
end
Q = Q';
R = M;