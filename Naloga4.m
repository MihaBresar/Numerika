f = @(x) exp(sin(10*x) - x);
g = @(x) (10*cos(10*x)-1)*exp(sin(10*x) - x);
n = 6;
x = zeros(1,n+1);
y = zeros(1,n+1);
z = zeros(1,n+1);
for i = 0:n
    x(i+1) = i/n;
    y(i+1) = f(i/n);
    z(i+1) = g(i/n);
end;
d = zeros(1,4);
rezultat = zeros(1,n);
hold on
for i = 0:n-1
    X = [i/n,i/n,(i+1)/n,(i+1)/n];
    Y = [y(i+1),y(i+1),y(i+2),y(i+2)];
    Z = [z(i+1),z(i+1),z(i+2),z(i+2)];
    d = deljene(X, Y, Z);
    S{i+1} = @(x) d(1) + d(2)*(x-i/n) + d(3)*(x-i/n)*(x-i/n) + d(4)*(x-i/n)*(x-i/n)*(x-(i+1)/n);
    rezultat(i+1) = S{i+1}((x(i+1)+x(i+2))/2);
end;
rezultat
hold on
for i = 1:n
    ezplot(@(x) S{i}(x),[x(i),x(i+1)]);
end;
    ezplot(@(x) f(x),[0,1])        
