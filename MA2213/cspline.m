% Cubic spline interpolation
% Each row of C contains the coefficients of each cubic spline
function C = cspline(x,y)
n = length(x);
h = zeros(n-1,1);
b = zeros(n-1,1);
for i = 1:(n-1)
    h(i) = x(i+1) - x(i);
    b(i) = (y(i+1) - y(i))/h(i);
end
v = zeros(n-1,1);
u = zeros(n-1,1);
for i = 2:(n-1)
    v(i) = 2*(h(i-1) + h(i));
    u(i) = 6*(b(i) - b(i-1));
end
A = zeros(n-2);
A(1,1) = v(2);
A(1,2) = h(1);
A(n-2,n-3) = h(n-3);
A(n-2,n-2) = v(n-1);
for i = 2:(n-3)
    A(i,i-1) = h(i-1);
    A(i,i) = v(i+1);
    A(i,i+1) = h(i);
end
z = [0; A\u(2:n-1); 0];
C = zeros(n-1,4);
for i = 1:(n-1)
    a = z(i+1)/(6*h(i));
    b = z(i)/(6*h(i));
    c = y(i+1)/h(i) - h(i)*z(i+1)/6;
    d = y(i)/h(i) - h(i)*z(i)/6;
    p = @(k) a.*(k-x(i)).^3+b.*(x(i+1)-k)^3+c.*(k-x(i))+d.*(x(i+1)-k);
    C(i,:) = [a b c d];
    fplot(p,[x(i),x(i+1)]);
    hold ON;
end
