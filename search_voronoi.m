function [i, y] = search_voronoi(V, P)
    i = 1;
    M = Inf;
    y = zeros(2, numel(V));
    j = 0;
    i = 1;
    while M > 1e-8
        j = j + 1;
        y(:, j) = V(i).x;
        [M, k] = max(V(i).A*P - V(i).b);
        if M > 1e-8
            i = V(i).An(k);
        end
    end
    j = j + 1;
    y(:, j) = V(i).x;
    y = y(:, 1:j);
end

