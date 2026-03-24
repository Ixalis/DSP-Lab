// ============================================================
// Exercise 6: Convolution Function
// y(n) = x(n) * h(n)  (linear convolution)
// ============================================================
clear; clc; clf;

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    yorigin = xorigin + horigin - 1;

    nx = (0:length(xn)-1) - (xorigin - 1);
    nh = (0:length(hn)-1) - (horigin - 1);
    ny = (0:length(yn)-1) - (yorigin - 1);

    clf;
    subplot(3,1,1);
    plot2d3(nx, xn, style=2); plot(nx, xn, 'bo');
    title("x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

    subplot(3,1,2);
    plot2d3(nh, hn, style=5); plot(nh, hn, 'ro');
    title("h(n)"); xlabel("n"); ylabel("h(n)"); xgrid();

    subplot(3,1,3);
    plot2d3(ny, yn, style=3); plot(ny, yn, 'mo');
    title("y(n) = x(n) * h(n)  [Convolution]");
    xlabel("n"); ylabel("y(n)"); xgrid();
endfunction

// ── Test ─────────────────────────────────────────────────────
[yn, yorigin] = convolution([1, 2, 3, 4], 3, [1, 1, 1], 2);
printf("yn = "); disp(yn);
printf("yorigin = %d\n", yorigin);
