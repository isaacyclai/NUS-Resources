% Gram-Schmidt on the first four monomial bases to get Chebyshev polynomials
m1 = @(x) 1;
m2 = @(x) x;
m3 = @(x) x.^2;
m4 = @(x) x.^3;
w = @(x) 1./sqrt(1-x.^2); % weight function
m2 = @(x) m2(x) - integral(@(x) m1(x).*m2(x).*w(x),-1,1).*m1(x); % orthonormalise m2
m3 = @(x) m3(x) - integral(@(x) m1(x).*m3(x).*w(x),-1,1)./integral(@(x) m1(x).*m1(x).*w(x),-1,1).*m1(x); % orthogonalise m3 with m1
m3 = @(x) m3(x) - integral(@(x) m2(x).*m3(x).*w(x),-1,1)./integral(@(x) m2(x).*m2(x).*w(x),-1,1).*m2(x); % orthogonalise m3 with m2
m3 = @(x) m3(x)./m3(1); % normalise m3 such that m3(1) = 1
m4 = @(x) m4(x) - integral(@(x) m1(x).*m4(x).*w(x),-1,1)./integral(@(x) m1(x).*m1(x).*w(x),-1,1).*m1(x); % orthogonalise m4 with m1
m4 = @(x) m4(x) - integral(@(x) m2(x).*m4(x).*w(x),-1,1)./integral(@(x) m2(x).*m2(x).*w(x),-1,1).*m2(x); % orthogonalise m4 with m2
m4 = @(x) m4(x) - integral(@(x) m3(x).*m4(x).*w(x),-1,1)./integral(@(x) m3(x).*m3(x).*w(x),-1,1).*m3(x); % orthogonalise m4 with m3
m4 = @(x) m4(x)./m4(1); % normalise m4 such that m4(1) = 1
