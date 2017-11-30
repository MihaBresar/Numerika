function y=naloga4(g,x0,n)
k = 0;
x = 0;
r = Inf;
while and(k < n , abs(r-x) > 10^-3)
    x = g(x0)
    r = x0
    x0 = x
    k = k + 1
end;
y = x0