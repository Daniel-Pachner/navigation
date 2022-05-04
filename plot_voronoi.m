function plot_voronoi(V, m = [], M = [], markpoints = 0)
    if isempty(m)
        m = min([V.x], [], 2);
    end
    if isempty(M)
        M = max([V.x], [], 2);
        d = 0.1*(M - m);
    else
        d = 0;
    end
    C = colormap('lines');
    nc = size(C, 1);

    for i = 1 : numel(V)
        X = plotcon(V(i).A, V(i).b, m - d, M + d);
        if size(X, 2) > 0
            color = C(rem(V(i).index - 1, nc) + 1, :);
            patch(X(1, :), X(2, :), color, ...
            'facealpha', 0.5, 'edgecolor', color, 'linewidth', 0.01);
            hold on
        end
        plot(V(i).data(1, :), V(i).data(2, :), '.', 'color', color, ...
        'markerfacecolor', color);
        if markpoints > 1
            X = plotcon(V(i).F, V(i).g, m - d, M + d);
            if size(X, 2) > 0
                color = C(rem(V(i).index - 1, nc) + 1, :);
                plot(X(1, :), X(2, :), 'color', color, 'linewidth', 2);
            end
        end
    end
    if markpoints > 0
        for i = 1 : numel(V)
            plot(V(i).x(1), V(i).x(2), 'ko', 'markersize', 3, 'markerfacecolor', 'y');
        end
    end
    if markpoints > 1
        for i = 1 : numel(V)
            text(V(i).x(1), V(i).x(2), num2str(i), 'FontName', 'CourierNew');
        end
    end
    if markpoints > 2
        for i = 1 : numel(V)
            text(V(i).x(1), V(i).x(2), num2str(V(i).index), 'FontName', 'CourierNew', ...
            'FontSize', 12);
        end
    end
    axis equal
end

