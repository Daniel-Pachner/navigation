function plotnetwork(hxa, X, f, index, indices, cmap)
    hold(hxa, 'on');
    C = colormap('lines');
    for i = indices
        plot(hxa, X(1, f & index == i), X(2, f & index == i), ...
        '-', 'color', cmap(i, :), 'linewidth', 2);
    end
    for i = indices
        k = find(f & index == i, 1, 'last');
        if ~isempty(k)
            text(mean(X(1, k)), mean(X(2, k)), sprintf('Line %d', i), ...
            'backgroundcolor', C(i, :), 'FontName', 'CourierNew');
        end
    end
    axis equal
    set(gca, 'visible', 'off');
end

