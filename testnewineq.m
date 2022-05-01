function t = testnewineq(a, b, A, B)

    if abs(a(1)) > abs(a(2)) && abs(a(1)) > 1e-8
        B = B - A(:, 1)*b/a(1);
        A = A(:, 2) - A(:, 1)*a(2)/a(1);
    elseif abs(a(2)) > 1e-8
        B = B - A(:, 2)*b/a(2);
        A = A(:, 1) - A(:, 2)*a(1)/a(2);
    else
        t = (0 >= b);
        return;
    end

    n = A < -1e-8;
    p = A > 1e-8;
    z = abs(A) <= 1e-8;
    LB = max([-Inf, max(B(n)./A(n))]);
    UB = min([Inf, min(B(p)./A(p))]);
    POS = min([Inf, min(B(z))]);
    t = (LB <= UB) && POS >= 0;
end

