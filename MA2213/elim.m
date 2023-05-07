% Gaussian Elimination
function A = elim(A,b);
A = [A b];
n = size(A, 1);
for i=1:(n-1)
    for j=(i+1):n
        for k=(i+1):(n+1)
            A(j,k) = A(j,k)-(A(j,i)/A(i,i))*A(i,k);
        end
    end
    disp(A(n, n+1));
end
