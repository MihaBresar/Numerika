n = 100;
tol = 10^-10
A = zeros(n);
for i = 1:n
    A(i,i) = 2;
    
end;
for i = 1:n-1
    A(i,i+1) = -1;
    A(i+1,i) = -1;
end;
c = [0,1,3,4];
z = zeros(100,1);
z(1) = 1;
s = 10
A = (A - c(4)*eye(n));
while s > tol
    z = linsolve(A,z);
    z = z/norm(z);
    x = (z'*A*z);
    s = norm(A*z-x*z);

end;
x = x +c(4)