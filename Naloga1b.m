f = @(t) sin(pi*t);
n = 40;
b = @(t) bernstein(f, n, t);
a = 0;
for j = 0:100
     if abs(f(j/100)-b(j/100)) > a
         a = abs(f(j/100)-b(j/100));
     end;
end;
a