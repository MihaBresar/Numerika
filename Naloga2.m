f1 = @(t)1*ones(size(t));
f2 = @(t) sin(t);
f3 = @(t) cos(t);
f4 = @(t) sin(t).*cos(t);
g = @(t) t.*exp(-t.*(t+2));

A = [quad(@(x)f1(x).*f1(x),-1,1,1e-12) quad(@(x)f2(x).*f1(x),-1,1,1e-12) quad(@(x)f3(x).*f1(x),-1,1,1e-12) quad(@(x)f4(x).*f1(x),-1,1,1e-12);
     quad(@(x)f1(x).*f2(x),-1,1,1e-12) quad(@(x)f2(x).*f2(x),-1,1,1e-12) quad(@(x)f3(x).*f2(x),-1,1,1e-12) quad(@(x)f4(x).*f2(x),-1,1,1e-12);
     quad(@(x)f1(x).*f3(x),-1,1,1e-12) quad(@(x)f2(x).*f3(x),-1,1,1e-12) quad(@(x)f3(x).*f3(x),-1,1,1e-12) quad(@(x)f4(x).*f3(x),-1,1,1e-12);
     quad(@(x)f1(x).*f4(x),-1,1,1e-12) quad(@(x)f2(x).*f4(x),-1,1,1e-12) quad(@(x)f3(x).*f4(x),-1,1,1e-12) quad(@(x)f4(x).*f4(x),-1,1,1e-12)];

%grammova matrika
A

b = [quad(@(x)g(x).*f1(x),-1,1,1e-12), quad(@(x)g(x).*f2(x),-1,1,1e-12), quad(@(x)g(x).*f3(x),-1,1,1e-12), quad(@(x)g(x).*f4(x),-1,1,1e-12)]';

b

m = linsolve(A, b);

%koeficienti polinoma
m

p = @(x) m(1).*f1(x) + m(2).*f2(x) + m(3).*f3(x) + m(4).*f4(x);

r = @(x) g(x) - p(x);

norma = sqrt(quad(@(x)r(x).*r(x),-1,1,1e-12))

hold on
ezplot(g, [-1,1])
ezplot(p, [-1,1])