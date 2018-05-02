f = @(t) sin(pi*t);
b5 = @(t) bernstein(f, 5, t); 
for n = 0:40
    b = @(t) bernstein(f, n, t);
    a = 0;
    for j = 0:100
        if abs(f(j/100)-b(j/100)) > a
            a = abs(f(j/100)-b(j/100));
        end;
    end;
    if a < 0.05
        n
        return 
    end;
end;

     
     
     
     
     