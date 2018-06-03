function[x,y] = RK4(f, a, b, y0, h)

x = a:h:b;
m = length(x);
d = length(y0); 
y = zeros(d, m);

y(:, 1) = y0;

for n = 2:m
    k1 = h * f(x(n-1), y(:,n-1));
    k2 = h * f(x(n-1) + 0.5*h, y(:,n-1) + 0.5 * k1);
    k3 = h * f(x(n-1) + 0.5*h, y(:,n-1) + 0.5 * k2);
    k4 = h * f(x(n-1) + h, y(:,n-1) + 1 * k3);
    
    y(:, n) = y(:, n-1) + 1/6 * k1 + 2/6 * k2 + 2/6 * k3 + 1/6 * k4;
end

end
    

