function [x, Y] = adams_implicite(f, a, b, Y0, h, tol)
    % toleranca pri navadni iteraciji default=1e-6
    if nargin < 6
        tol = 1e-6;
    end
    % prvo priblizke za x1, x2, x3 poiscemo z RK4 metodo
    [x1, Y1] = RK4(f, a, a+3*h, Y0, h);
    d = length(Y0);
    x = a:h:b;
    Y = zeros(length(x), d);
    Y(1:4,:) = Y1';
    for i = 5:length(x)
        Y(i,:) = Y(i-1,:);
        lastY = zeros(1, d);
        while sum(abs(Y(i,:)-lastY)) > sum(abs(Y(i,:)))*tol
            lastY = Y(i,:);
            Y(i,:) = Y(i-1,:) + h/24*(9*f(x(i),Y(i,:)) + 19*f(x(i-1),Y(i-1,:)) - 5*f(x(i-2),Y(i-2,:)) + f(x(i-3),Y(i-3,:)))';
        end
    end
end