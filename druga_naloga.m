function[] = druga_naloga()

a = 0;
b = 4;
h = 0.01;

F = @(x,y) [y(2); -2*y(1)/(y(1)^2 + y(3)^2)^(3/2); y(4);...
    -2*y(3)/(y(1)^2 + y(3)^2)^(3/2)];
y0 = [0; 1; 1; -1];


[Xe, Ye] = RK4(F,a,b,y0,h);

[Xt, Yt] = ode45(F,a:h:b, y0,odeset('RelTol', 10^(-12), 'AbsTol', (10^(-12))));
Yt = Yt';

% Položaj v ?asih 1,2,3,4
for i = 100:100:400
    polozaj_x(i/100) = Ye(1,i+1);
    polozaj_y(i/100) = Ye(3,i+1);
    
    ode_x(i/100) = Yt(1,i+1);
    ode_y(i/100) = Yt(3,i+1);
    
    
end

polozaj_x
polozaj_y
ode_x
ode_y

end