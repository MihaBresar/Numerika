n = 10000;
b = ones(n,1);
c = ones(n-2,1);
d = ones(n-2,1);
rand('seed', 123);
a = rand(n, 1);
A = zeros(n,n);
y  = 2 * ones(n,1);

for i = 2:n-1
    A(1,i) = c(i - 1,1);
    A(n,i) = d(i - 1,1) ;   
end;
for i = 1:n
    A(i,i) = a(i,1);
    A(n +1 -i,i) = b(i,1);
end;

x = A \ y;
s = norm(x,1)

R = qr(A);
f = norm(R,'fro')

