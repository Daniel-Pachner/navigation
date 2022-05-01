function [A, b] = localarea(x, y, factor = .5, mind = 0, maxd = Inf)
    m = size(y, 2);
    A = zeros(m, 2);
    b = zeros(m, 1);
    c = zeros(m, 1);
    for i = 1 : m
        A(i, :) = [y(1, i)-x(1), y(2, i)-x(2)];
        A(i, :) = A(i, :)/norm(A(i, :));
        n = norm(y(:, i) - x);
        z = x + factor*(y(:, i) - x)*min(maxd, max(mind, n))/n;
        b(i) = A(i, :)*z;
    end
end

