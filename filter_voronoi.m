function y = filter_voronoi(V, x, k, margin = 0)
    n = size(x, 2);
    y = true(1, n);
    if ~isempty(V(k).A)
        for i = 1 : n
            y(i) = max(V(k).A*x(:, i) - V(k).b) <= margin;
        end
    end
end


