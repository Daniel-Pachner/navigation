
y = [
0, -1, 0, 1, 0, 0.2, 1
0, 0, 1, 1, -2, -3, -0.4];

[A, b] = localarea(y(:, 1), y(:, 2:end));
X = plotcon(A, b);

figure
patch(X(1, :), X(2, :), 'r');
hold on;
plot(y(1, 1), y(2, 1), 'bx')
for i = 2 : size(y, 2)
    plot(y(1, i), y(2, i), 'bo')
    text(y(1, i), y(2, i), num2str(i-1))
end

axis equal
