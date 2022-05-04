function y = meanclose(x, m)
    n = size(x, 2);
    xm = mean(x, 2);
    xd = sum(abs(x - repmat(xm, 1, n)), 1);
    [~, k] = sort(xd);
    y = x(:, k(1:m));
end

