% Divided differences
function b = divdiff(x,y)
n = length(x) - 1;
b = y;
for i = 1:n
    for j = (n+1):-1:(i+1)
        b(j) = (b(j)-b(j-1))/(x(j)-x(j-i));
    end
end