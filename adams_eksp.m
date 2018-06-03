function [x, Y] = adams_eksp(f, a, b, Y0, h, tol)

    if nargin < 6
        tol = 1e-6;
    end
    
    [x1, Y1] = RK4(f, a, a+3*h, Y0, h);
    d = length(Y0);
    x = a:h:b;
    Y = zeros(length(x), d);
    Y(1:4,:) = Y1';
    for i = 5:length(x)
        Y(i,:) = Y(i-1,:);
        Y(i,:) = Y(i-1,:) + h/24*(55*f(x(i-1),Y(i-1,:)) - 59*f(x(i-2),Y(i-2,:)) + 37*f(x(i-3),Y(i-3,:)) - 9*f(x(i-4),Y(i-4,:)))';
        prejsnji_Y = zeros(1, d);
        while sum(abs(Y(i,:)-prejsnji_Y)) > sum(abs(Y(i,:)))*tol
            prejsnji_Y = Y(i,:);
            Y(i,:) = Y(i-1,:) + h/24*(9*f(x(i),Y(i,:)) + 19*f(x(i-1),Y(i-1,:)) - 5*f(x(i-2),Y(i-2,:)) + f(x(i-3),Y(i-3,:)))';
        end
    end
end