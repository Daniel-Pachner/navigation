function [X, index] = randomnetwork(n, m)
    N = n*m;
    X = zeros(2, N);
    index = zeros(1, N);
    c = 0;
    t = linspace(0, 1, n);

    for i = 1 : m
        p = zeros(2, 4);
        j = ceil(rand*N) + 1;
        k = ceil(rand*N) + 1;

        if j <= c && j > 10
            p(:, 1) = X(:, j);
            p(:, 2) = X(:, j - 10);
        else
            p(:, 1 : 2) = 2*rand(2, 2) - 1;
        end

        if k <= c && k > 10
            p(:, 3) = X(:, k);
            p(:, 4) = X(:, k - 10);
        else
            p(:, 3 : 4) = 2*rand(2, 2) - 1;
        end

        for k = 1 : n
            X(:, c+k) = (p(:,1)*(1 - t(k)) + p(:,2)*t(k))*(1 - t(k)) + (p(:,3)*(1 - t(k)) + p(:,4)*t(k))*t(k);
            index(c+k) = i;
        end
        c = c + n;
    end
end
