rand('seed', 0);
close all
npoints = 55;
index = 1 : 55;
x = rand(2, npoints);
P = [0.4; 0.3];
m = min(x, [], 2);
M = max(x, [], 2);
V = find_voronoi(x(:, 1:12), index(1:12));

subplot(1, 2, 1)
plot_voronoi(V, m, M, 2);
markgnss(P);
plot(x(1, :), x(2, :), 'k.');
[A, b] = neighbors(x(:, 1:12), factor = 0.99);
[~, ~, h] = evaluate_voronoi(V, P);
[S, A, b] = plotcon(A(:, :, h), b(:, h), min(x(:, 1:12), [], 2)-0.5, max(x(:, 1:12), [], 2)+0.5);
plot(S(1, :), S(2, :), 'r:', 'linewidth', 1);

phi = linspace(-pi, pi, 100);
c = repmat(P, 1, 100) + norm(x(:, h)-P)*[cos(phi); sin(phi)];
plot(c(1, :), c(2, :), 'k')

subplot(1, 2, 2)
f  = filter_points(x, A, b);
V = find_voronoi(x(:, f), index(f));
plot_voronoi(V, m, M, 2);
plot(x(1, :), x(2, :), 'k.');
markgnss(P);
plot(x(1, :), x(2, :), 'k.');
[~, ~, h] = evaluate_voronoi(V, P);
plot(V(h).x(1), V(h).x(2), 'go')

[~, k] = min(sum((x - repmat(P, 1, npoints)).^2, 1));
plot(x(1, k), x(2, k), 'rx')
figure
plot(sqrt(sum((x - repmat(P, 1, npoints)).^2, 1)), 'ro', 'markersize', 3);
hold on
hx = plot(norm(V(h).x - P)*ones(1, npoints), 'k:', 'displayname', 'minimum distance');
legend(hx)
title('site distance from GNSS')

