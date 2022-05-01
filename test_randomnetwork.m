figure
rand('seed', 0)
cmap = colormap('lines');
[X, index] = randomnetwork(100, 19);
N = size(X, 2);
f = true(1, N);
plotnetwork(gca, X, f, index, unique(index), cmap)

%%rand('seed', 5)
%%P = X(:, floor(rand*(N - 1)) + 1);
%%P = P + (2*rand(2, 1) - 1)*0.1;
%%P = [-.13; .19];

P = [0; -.18];
markgnss(P);

print(1, 'tramnetwork.svg')
