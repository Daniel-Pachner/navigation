rand('seed', 0);
close all
n = 50000;
x = rand(2, n);

D = 2;
minn = 10;

figure
V = cell(1, 1);
V{1} = find_voronoi(meanclose(x, D), [], x);
plot_voronoi(V{1}, [0; 0], [1; 1], 1);
pause(1)

c1 = 1;
c2 = 1;
conti = true;

k = 0;
while conti
    d = 0;
    conti = false;
    for k = c1 : c2
        for j = 1 : numel(V{k})
            fprintf('(%d, %d) %d\n', k, j, size(V{k}(j).data, 2))
            y = V{k}(j).data;
            m = size(y, 2);
            if m > minn
                d = d + 1;
                V{k}(j).child = c2 + d;
                V{c2 + d} = find_voronoi(meanclose(y, D), [], y);
                conti = true;
            else
                V{k}(j).child = -1;
            end
        end
    end
    c1 = c2 + 1;
    c2 = c2 + d;
end

t = zeros(1, n);
e = zeros(1, n);
for i = 1 : size(x, 2)
    x_gnss = x(:, i) + 0e-5*(2*rand(2, 1)-1);
    tic;
    y = search_voronoi_tree(V, x_gnss);
    t(i) = toc;
    e(i) = max(abs(x_gnss - y));
    fprintf('i=%d t=%d\n', i, t(i));
    disp([x_gnss, y]);
end

figure
subplot(1, 2, 1)
plot(t)
subplot(1, 2, 2)
plot(e)


