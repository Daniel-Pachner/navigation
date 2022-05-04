figure
rand('seed', 0)
cmap = colormap('lines');
[x, index, previous] = randomnetwork(50, 4);
N = size(x, 2);
f = true(1, N);
plotnetwork(gca, x, f, index, cmap)
axis equal

P = [0.82; -.8];
markgnss(P);

print(1, 'tramnetwork.svg')
