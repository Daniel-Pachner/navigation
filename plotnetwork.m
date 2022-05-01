function plotnetwork(hxa, X, f, index, indices, previous, cmap)
    hold(hxa, 'on');
    cmap = colormap('lines');
    for i = indices
        idx = f & index == i;
        plot(hxa, X(1, idx), X(2, idx), ...
        '.', 'color', cmap(i, :), 'linewidth', 1);
    end
    for i = indices
        k = find(f & index == i, 1, 'last');
        if ~isempty(k)
            text(mean(X(1, k)), mean(X(2, k)), sprintf('Line %d', i), ...
            'backgroundcolor', cmap(i, :)*0.6 + 0.4, 'FontName', 'CourierNew');
        end
    end
    axis equal
    set(gca, 'visible', 'off');
end

