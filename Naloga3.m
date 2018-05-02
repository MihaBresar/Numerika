f = @(t) cos(2+2.*t)^2;
n = 5;
x = zeros(1,n+1);
y = zeros(1,n+1);
for i = 0:n
    x(i+1) = i/n;
    y(i+1) = f(i/n);
end;

d = deljene_diference(x, y)
p = @(x) d(1) + d(2)*x + d(3)*x*(x-1/5) + d(4)*x*(x-1/5)*(x-2/5) + d(5)*x*(x-1/5)*(x-2/5)*(x-3/5) + d(6)*x*(x-1/5)*(x-2/5)*(x-3/5)*(x-4/5);

v1 = d(n+1);

for i = n:-1:1
    v1 = d(i) + (0.25 - (i-1)/n)*v1;
end;
v1
u1 = f(0.25)
v2 = d(n+1);
for i = n:-1:1
    v2 = d(i) + (0.95 - (i-1)/n)*v2;
end;
v2
u2 = f(0.95)
a = 0
for i = 0:100
    if abs(p(i/100)-f(i/100)) > a
        a = abs(p(i/100)-f(i/100));
    end;
end;
a;
