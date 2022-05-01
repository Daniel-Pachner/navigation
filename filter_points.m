function y = filter_points(x, A, b, margin = 0)
    n = size(x, 2);
    y = true(1, n);
    if ~isempty(A)
        for i = 1 : n
            y(i) = max(A*x(:, i) - b) <= margin;
        end
    end
end


