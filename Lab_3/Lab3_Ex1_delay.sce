// ============================================================
// Exercise 1: Delay Function
// y(n) = x(n - k), k > 0
// ============================================================
clear; clc; clf;

function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;

    nx = (0:length(xn)-1) - (xorigin - 1);
    ny = (0:length(yn)-1) - (yorigin - 1);

    clf;
    subplot(2,1,1);
    plot2d3(nx, xn, style=2); plot(nx, xn, 'bo');
    title("x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

    subplot(2,1,2);
    plot2d3(ny, yn, style=5); plot(ny, yn, 'ro');
    title("y(n) = x(n - " + string(k) + ")  [Delay by " + string(k) + "]");
    xlabel("n"); ylabel("y(n)"); xgrid();
endfunction

// ── Test ─────────────────────────────────────────────────────
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
printf("yn = "); disp(yn);
printf("yorigin = %d\n", yorigin);
