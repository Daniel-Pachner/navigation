function [Y, A, b] = plotcon(A, b, m = -10, M = 10)
    A = [A; eye(2); -eye(2)];
    b = [b; zeros(2, 1) + M; zeros(2, 1) - m];
    [A, b] = reduceineq(A, b);
    n = size(A, 1);
    X = zeros(2, 10);
    a = zeros(10, 1);
    c = 0;
    for i = 1 : n
        for j = i+1 : n
            if abs(A(i, :)/norm(A(i, :))*(A(j, :)'/norm(A(j, :)))) < 1-1e-5 && ...
                norm(A(i, :)) > 1e-5 && norm(A(j, :)) > 1e-5
                x = A([i, j], :) \ b([i, j]);
                if all(A*x <= b + 1e-6)
                    c = c + 1;
                    X(:, c) = x;
                end
            end
        end
    end
    for k = 1 : c
        a(k) = myangle(X(1, k) - mean(X(1, 1:c)), X(2, k) - mean(X(2, 1:c)));
    end
    [~, i] = sort(a(1:c));
    if numel(i) > 0
        i = [i(:); i(1)];
    end
    Y = X(:, i);
end

function a = myangle(x, y)
    if x > 0
        a = atan(y/x);
    elseif x < 0 && y >= 0
        a = atan(y/x) + pi;
    elseif x < 0 && y < 0
        a = atan(y/x) - pi;
    elseif x == 0 && y >= 0
        a = pi/2;
    elseif x == 0 && y < 0
        a = -pi/2;
    else
        a = 0;
    end
    end
