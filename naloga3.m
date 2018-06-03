function[] = naloga3()

%podatki
h = 0.01;
a = 0;
b = 5;
tol = 1e-12;
y0 = [0;1];
f = @(x,y) [y(2); -(y(1).^2 - 1)*y(2) - y(1)];

% Adamson implicitna
[Xi, Yi]= adams_implicite(f,a,b,y0,h,tol);

% Adamson preditkor-korektor
[Xe, Ye]= adams_eksp(f,a,b,y0,h);

% ODE45
[Xt, Yt] = ode45(f,a:h:b, y0, ...
    odeset('RelTol', 10^(-12), 'AbsTol', (10^(-12))));

% Izracunamo vrednosti v y(1), y(2),..., y(5)
for i = 100:100:500
    ode(i/100) = Yt(i+1);
    eksplicite(i/100) = Ye(i+1,1);
    implicite(i/100) = Yi(i+1,1);
end
ode
eksplicite
implicite









