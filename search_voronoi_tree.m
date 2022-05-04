function y = search_voronoi_tree(V, x)
    y = zeros(2, 1);
    i = 1;
    term = false;
    while ~term
        j = search_voronoi(V{i}, x);
        m = size(V{i}(j).data, 2);
        if V{i}(j).child <= 0
            m = size(V{i}(j).data, 2);
            distsq = sum((V{i}(j).data - repmat(x, 1, m)).^2, 1);
            [~, mini] = min(distsq);
            y = V{i}(j).data(:, mini);
            term = true;
        else
            i = V{i}(j).child;
        end
    end
end


