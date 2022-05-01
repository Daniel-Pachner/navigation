function [y, k, h] = evaluate_voronoi(V, x)
    n = size(x, 2);
    y = zeros(1, n);
    k = zeros(1, n);
    h = zeros(1, n);
    m = numel(V);
    for i = 1 : n
        y = Inf;
        for j = 1 : numel(V)
            d = max([max(V(j).A*x(:, i) - V(j).b), -Inf]);
            if d < y
                y(i) = d;
                k(i) = V(j).index;
                h(i) = j;
            end
        end
    end
end


