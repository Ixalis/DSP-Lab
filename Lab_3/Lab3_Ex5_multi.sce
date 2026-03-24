// ============================================================
// Exercise 5: Signal Multiplication Function
// y(n) = x1(n) .* x2(n)
// ============================================================
clear; clc; clf;

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1_start = -(x1origin - 1);
    n1_end   = n1_start + length(x1n) - 1;
    n2_start = -(x2origin - 1);
    n2_end   = n2_start + length(x2n) - 1;

    n_min = min(n1_start, n2_start);
    n_max = max(n1_end, n2_end);
    n = n_min:n_max;

    x1_ext = zeros(1, length(n));
    x2_ext = zeros(1, length(n));

    for i = 1:length(x1n)
        idx = find(n == (n1_start + i - 1));
        x1_ext(idx) = x1n(i);
    end
    for i = 1:length(x2n)
        idx = find(n == (n2_start + i - 1));
        x2_ext(idx) = x2n(i);
    end

    yn = x1_ext .* x2_ext;
    yorigin = find(n == 0);

    clf;
    subplot(3,1,1);
    plot2d3(n, x1_ext, style=2); plot(n, x1_ext, 'bo');
    title("x1(n)"); xlabel("n"); ylabel("x1(n)"); xgrid();

    subplot(3,1,2);
    plot2d3(n, x2_ext, style=5); plot(n, x2_ext, 'ro');
    title("x2(n)"); xlabel("n"); ylabel("x2(n)"); xgrid();

    subplot(3,1,3);
    plot2d3(n, yn, style=3); plot(n, yn, 'mo');
    title("y(n) = x1(n) * x2(n)"); xlabel("n"); ylabel("y(n)"); xgrid();
endfunction

// ── Test ─────────────────────────────────────────────────────
[yn, yorigin] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
printf("yn = "); disp(yn);
printf("yorigin = %d\n", yorigin);
