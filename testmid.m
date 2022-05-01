function t = testmid(x, y, A, b)
    m = 0.5*(x + y);
    v = y - x;
    v = [v(2); -v(1)];
    b = b - A*m;
    A = A*v;
    n = A < 0;
    p = A > 0;
    z = A == 0;
    LB = max([-Inf, max(b(n)./A(n))]);
    UB = min([Inf, min(b(p)./A(p))]);
    POS = min([Inf, min(b(z))]);
    t = (LB <= UB) && POS >= 0;
end

