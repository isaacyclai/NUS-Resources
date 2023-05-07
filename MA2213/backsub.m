% Back substitution (combine with Gaussian elimination for Gauss-Jordan Elimination)
function b = backsub(A)
n = size(A,1);
for i=n:-1:1
    for j=(i+1):n
        A(i,n+1) = A(i,n+1)-A(i,j)*A(j,n+1);
    end
    A(i,n+1) = A(i,n+1)/A(i,i);
end
b = A(:,n+1);
