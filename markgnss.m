function markgnss(P)
    hold on;
    plot(P(1), P(2), 'rs', 'markerfacecolor', 'r');
    text(P(1), P(2), 'GNSS');
end
