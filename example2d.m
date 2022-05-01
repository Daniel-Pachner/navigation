A = [
1,     0;
0,     1;
-1,   -1;
-1,    0
-1,    0];

b = [
0.0;
0.0;
0.7
0.3
0.9]*2;

close all

[A, b] = reduceineq(A, b);

X = plotcon(A, b, -10, 10);
patch(X(1, :), X(2, :), 'r');

x = 2*rand(2, 500)-1;
i = all(A*x <= b, 1);
hold on
plot(x(1, i), x(2, i), 'bx', 'markersize', 3)
plot(x(1, ~i), x(2, ~i), 'k+', 'markersize', 3)
