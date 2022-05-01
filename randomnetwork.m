function [X, index, previous] = randomnetwork(n, m)
    N = n*m;
    X = zeros(2, N);
    index = zeros(1, N);
    previous = zeros(1, N);
    c = 0;
    t = linspace(0, 1, n);

    for i = 1 : m
        p = zeros(2, 4);

        j = ceil(rand*(c-1)) + 1;
        k = ceil(2*rand*(c-1)) + 1;
        if j <= c && j > 1
            p(:, 1) = X(:, j);
            p(:, 2) = X(:, j - 1);
        else
            p(:, 1 : 2) = 2*rand(2, 2) - 1;
        end
        p(:, 2) = p(:, 1) + (p(:, 2) - p(:, 1))/norm((p(:, 2) - p(:, 1)));

        if k <= c && k > 1
            p(:, 3) = X(:, k);
            p(:, 4) = 2*rand(2, 1) - 1;
        else
            p(:, 3 : 4) = 2*rand(2, 2) - 1;
        end
        p(:, 4) = p(:, 3) + (p(:, 4) - p(:, 3))/norm((p(:, 4) - p(:, 3)));

        for k = 1 : n
            X(:, c+k) = (p(:,1)*(1 - t(k)) + p(:,2)*t(k))*(1 - t(k)) + (p(:,3)*(1 - t(k)) + p(:,4)*t(k))*t(k);
            index(c+k) = i;
            if k > 1
                previous(c+k) = c+k-1;
            end
        end
        c = c + n;
    end
end
