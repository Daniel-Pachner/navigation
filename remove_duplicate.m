function index = remove_duplicate(x, index)
    n = size(x, 2);
    for i = 1 : n
        f = (max(abs(x - repmat(x(:, i), 1, n)), [], 1) <= 1e-4);
        index(f) = index(i);
    end
end

