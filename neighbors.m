function [A, b, N] = neighbors(x, factor = 0.5)
    n = size(x, 2);
    A = zeros(n-1, 2, n);
    b = zeros(n-1, n);
    N = zeros(n-1, n);
    for i = 1 : n
        k = 0;
        for j = [1:i-1, i+1:n]
            k = k + 1;
            [A(k, :, i), b(k, i)] = localarea(x(:, i), x(:, j), factor);
            N(k, i) = j;
        end
    end
end


