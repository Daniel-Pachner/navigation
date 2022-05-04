function V = find_voronoi(x, index = [], indata = zeros(2, 0))
    n = size(x, 2);
    if isempty(index)
        index = 1 : n;
    end
    S = cell(1, n);
    Sn = cell(1, n);
    z = cell(1, n);
    F = cell(1, n);
    Fn = cell(1, n);
    g = cell(1, n);
    data = cell(1, n);
    child = zeros(1, n);

    [A, b, Na] = neighbors(x);
    [C, d, Nc] = neighbors(x, 0.99);
    for i = 1 : n
        [S{i}, z{i}, Sn{i}] = reduceineq(A(:, :, i), b(:, i), Na(:, i));
        [F{i}, g{i}, Fn{i}] = reduceineq(C(:, :, i), d(:, i), Nc(:, i));
        data{i} = indata(:, filter_points(indata, F{i}, g{i}));
    end
    V = struct('x', num2cell(x, 1), ...
    'A', S, 'b', z, 'F', F, 'g', g, 'index', num2cell(index), ...
    'An', Sn, 'Fn', Fn, ...
    'child', num2cell(child), 'data', data);
end

