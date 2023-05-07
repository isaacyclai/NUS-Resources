% Givens rotation
% x is the vector, a is the coordinate used to eliminate, b is the
% coordinate to be eliminated
function G = givens(x,b,a)
c = x(a)/sqrt(x(a)^2 + x(b)^2); % cos
s = x(b)/sqrt(x(a)^2 + x(b)^2); % sin
x(a) = c*x(a) + s*x(b);
x(b) = 0;
G = x;