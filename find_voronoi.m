function V = find_voronoi(x, index = [])
    n = size(x, 2);
    if isempty(index)
        index = 1 : n;
    end
    S = cell(1, n);
    z = cell(1, n);

    [A, b] = neighbors(x);
    for i = 1 : n
        [S{i}, z{i}] = reduceineq(A(:, :, i), b(:, i));
    end
    V = struct('x', num2cell(x, 1), ...
    'A', S, 'b', z, 'index', num2cell(index));
end

