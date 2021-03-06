function id = recursive_voronoi(X, index, P)

    indices = unique(index);
    id = 0;
    N = size(X, 2);
    f = true(1, N);
    select = unique(round(linspace(1, N, 10)));


    for it = 1 : 15
        disp([sum(f), min(index(f)), max(index(f))])

        V = find_voronoi(X(:, select), index(select));
        if numel(V) <= 1 || min(index(f)) == max(index(f))
            break
        end
        m = min([X(:, f), P], [], 2);
        M = max([X(:, f), P], [], 2);
        d = 0.05*(M - m);
        m = m - d;
        M = M + d;

        [~, ~, h] = evaluate_voronoi(V, P);
        S = plotcon(V(h).F, V(h).g, m, M);

        fig = figure;
        C = colormap('lines');
        ax = gca;
        hold(ax, 'on');
        plot_voronoi(V, m, M, 2);
        plotnetwork(gca, X, f, index, indices, C);
        markgnss(P);
        patch(S(1, :), S(2, :), 'facecolor', [1, 0, 0], 'facealpha', 0.15);
        title(sprintf('step %d', it));
        print(fig, sprintf('voronoi_%d.svg', it))

        f  = f & filter_points(X, V(h).F, V(h).g);
        select = find(f);
        while numel(select) > 10
            select = select(1 : 2 : end);
        end
        id = index(h);

    end
    end
