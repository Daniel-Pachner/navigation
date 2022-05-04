function [A, b, N] = reduceineq(A, b, N = [])
    n = size(A, 1);
    t = false(n, 1);
    for i = 1 : n
        t(i) = testnewineq(A(i, :), b(i), A([1:i-1, i+1:n], :), b([1:i-1, i+1:n]));
    end
    A = A(t, :);
    b = b(t);
    if ~isempty(N)
        N = N(t);
    end
end

