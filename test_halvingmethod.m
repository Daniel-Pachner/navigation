x1 = [-.5; +.25];
x2 = [+.5; -.25];
xA = (x1 + x2)/2;

[A1, b1] = localarea(x1, [xA, x2], 0);
X1 = plotcon(A1, b1);
[A2, b2] = localarea(x2, [xA, x1], 0);
X2 = plotcon(A2, b2);


figure
subplot(1, 2, 1)
patch(X1(1, :), X1(2, :), 'b');
hold on
patch(X2(1, :), X2(2, :), 'r');
plot(x1(1), x1(2), 'bo', 'MarkerFaceColor', 'b')
plot(x2(1), x2(2), 'ro', 'MarkerFaceColor', 'r')
text(x1(1), x1(2), 'x1')
text(x2(1), x2(2), 'x2')
axis equal

[A1, b1] = localarea(x1, x2, 1);
X1 = plotcon(A1, b1);
[A2, b2] = localarea(x2, x1, 1);
X2 = plotcon(A2, b2);

subplot(1, 2, 2)
patch(X1(1, :), X1(2, :), 'r', 'FaceAlpha', 0.2);
hold on
patch(X2(1, :), X2(2, :), 'b', 'FaceAlpha', 0.2);
axis equal