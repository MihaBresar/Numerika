function y=iteracija(f,a,b)
c = 0
d = Inf
k = 0
while and(abs(c-d) > 10^-10,k < 5)
    d  = c
    c = (f(b)*a - f(a)*b)/(f(b)-f(a))
    if sign(f(a)) == sign(f(b))
        a = c
    
    else 
        b = c
    end;
    k = k + 1
end;
y = [c, k]
   
