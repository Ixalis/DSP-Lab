// ============================================================
// Exercise 3: Fold Function
// y(n) = x(-n)  (Time Reversal)
// ============================================================
clear; clc; clf;

function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;

    nx = (0:length(xn)-1) - (xorigin - 1);
    ny = (0:length(yn)-1) - (yorigin - 1);

    clf;
    subplot(2,1,1);
    plot2d3(nx, xn, style=2); plot(nx, xn, 'bo');
    title("x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

    subplot(2,1,2);
    plot2d3(ny, yn, style=3); plot(ny, yn, 'mo');
    title("y(n) = x(-n)  [Folding]");
    xlabel("n"); ylabel("y(n)"); xgrid();
endfunction

// ── Test ─────────────────────────────────────────────────────
[yn, yorigin] = fold([1, -2, 3, 6], 3);
printf("yn = "); disp(yn);
printf("yorigin = %d\n", yorigin);
