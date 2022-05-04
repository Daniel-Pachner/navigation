D = inf;
tic;
for i = 1 : n
    d = norm(x(:, i) - x_gnss);
    if d < D
        mini = i;
        minx = x(:, i);
        D = d;
    end
end
fprintf('linear search time = %d\n', toc)
