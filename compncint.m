% Composite Integration
% n+1 is the number of points, k is the number of sub-intervals
function I = compncint(f,a,b,n,k)
I = 0;
if n==0 % Composite Midpoint Rule
    h = (b-a)/k;
    for i=1:k
        I = I + f(a+i*h-h/2); % x_i=a+i*h, (x_{i-1}+x_i)/2
    end
    I = h*I;
elseif n==1 % Composite Trapezoid Rule
    h = (b-a)/k;
    for i=1:(k-1)
        I = I + f(a+i*h);
    end
    I = (h/2)*(f(a)+f(b)) + h*I;
elseif n==2 % Composite Simpson's Rule
    h = (b-a)/(2*k);
    odd = 0;
    even = 0;
    for i=1:(2*k)
        if mod(i,2)
            odd = odd + f(a+i*h);
        elseif i~=2*k
            even = even + f(a+i*h);
        end
    end
    I = (h/3)*(f(a)+f(b)+4*odd+2*even);
end