// ============================================================
// Lab 4 - Exercise 7: Circular Convolution
// x(n) = {1↑, 2, -3, 2, 1}  (N = 5)
// h(n) = {1↑, 0, -1, -1, 1} (M = 5)
//
// Circular convolution: y(n) = sum_{k=0}^{N-1} h(k) * x((n-k) mod N)
//
// Why circular? For periodic signals of length N, the convolution
// wraps around: when the shifted signal goes past the end, it
// re-enters from the beginning. This is equivalent to computing
// linear convolution and then aliasing (folding) the result back
// into one period of length N.
// ============================================================
clear; clc; clf;

xn = [1, 2, -3, 2, 1];
hn = [1, 0, -1, -1, 1];
N = length(xn);  // 5 (both same length for circular conv)

// ============================================================
// Explanation: Why circular convolution has this form
// ============================================================
// For a periodic signal x(n) with period N, we only need one
// period of data. When we shift x(n-k), the samples that "fall
// off" one end wrap around to the other. This wrapping is
// captured by the modulo operation: x((n-k) mod N).
// The result is also periodic with the same period N,
// so circular convolution produces exactly N output samples.

// ============================================================
// Folding and Shifting Method (Circular)
// y(n) = sum_{k=0}^{N-1} h(k) * x((n-k) mod N)
// ============================================================
printf("===== Circular Convolution: Folding and Shifting =====\n");

yn_circ = zeros(1, N);
for n = 0:N-1
    for k = 0:N-1
        idx = modulo(modulo(n - k, N) + N, N);  // ensure positive circular index
        yn_circ(n+1) = yn_circ(n+1) + hn(k+1) * xn(idx+1);
    end
end

printf("y(n) = "); disp(yn_circ);

// ============================================================
// Matrix Method (Circular)
// y = C * x  where C is the circulant matrix of h
// Each row is a circular shift of h
// ============================================================
printf("\n===== Circular Convolution: Matrix Method =====\n");

C = zeros(N, N);
for i = 0:N-1
    for j = 0:N-1
        k = modulo(modulo(i - j, N) + N, N);
        C(i+1, j+1) = hn(k+1);
    end
end

printf("Circulant matrix C:\n");
disp(C);

yn_mat = C * xn';
yn_mat = yn_mat';

printf("y(n) = "); disp(yn_mat);

// ============================================================
// Plot x(n), h(n), y(n) and energy
// ============================================================
n_idx = 0:N-1;

subplot(2,2,1);
plot2d3(n_idx, xn, style=2); plot(n_idx, xn, 'bo');
title("x(n) = {1, 2, -3, 2, 1}");
xlabel("n"); ylabel("x(n)"); xgrid();

subplot(2,2,2);
plot2d3(n_idx, hn, style=5); plot(n_idx, hn, 'ro');
title("h(n) = {1, 0, -1, -1, 1}");
xlabel("n"); ylabel("h(n)"); xgrid();

subplot(2,2,3);
plot2d3(n_idx, yn_circ, style=3); plot(n_idx, yn_circ, 'mo');
title("y(n) = Circular Conv of x and h");
xlabel("n"); ylabel("y(n)"); xgrid();

// Energy
Ex = sum(xn.^2);
Eh = sum(hn.^2);
Ey = sum(yn_circ.^2);

subplot(2,2,4);
bar([1, 2, 3], [Ex, Eh, Ey]);
set(gca(), "x_ticks", tlist(["ticks", "locations", "labels"], [1, 2, 3], ["E_x", "E_h", "E_y"]));
title("Signal Energies");
ylabel("Energy"); xgrid();

printf("\nEnergies: Ex = %g, Eh = %g, Ey = %g\n", Ex, Eh, Ey);
