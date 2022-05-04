rand('seed', 0);

P = [0.3; 0.6];
x = rand(2, 50);

V = find_voronoi(x);
plot_voronoi(V, [], [], 1);

markgnss(P)

[y, k, h] = evaluate_voronoi(V, P);
plot(V(h).x(1), V(h).x(2), 'go')


tic
[i, y] = search_voronoi(V, P);
toc

plot(y(1, :), y(2, :), 'g-o', 'linewidth', 2)
