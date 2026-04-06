// ============================================================
// Lab 4 - Exercise 6: Linear Convolution
// x(n) = {1↑, 2, -3, 2, 1}    (origin at position 1, i.e. n=0 at first element)
// h(n) = {1↑, 0, -1}           (origin at position 1)
// ============================================================
clear; clc; clf;

xn = [1, 2, -3, 2, 1];
hn = [1, 0, -1];
Lx = length(xn);   // 5
Lh = length(hn);    // 3
Ly = Lx + Lh - 1;  // 7

// ============================================================
// (a) When both x(n) and h(n) are causal, y(n) converges
//     because the sum has finite limits: k = 0 to n
//     (only finitely many non-zero terms overlap)
//
// (b) When h(n) has finite impulse response (h(n)=0 for n<0 or n>M),
//     the convolution always converges because the infinite sum
//     reduces to a finite sum over k = 0 to M.
// ============================================================

// ============================================================
// Folding and Shifting Method
// y(n) = sum_{k} h(k) * x(n - k)
// ============================================================
printf("===== Folding and Shifting Method =====\n");

yn_fs = zeros(1, Ly);
for n = 0:Ly-1
    for k = 0:Lh-1
        idx = n - k;  // index into x
        if idx >= 0 & idx < Lx then
            yn_fs(n+1) = yn_fs(n+1) + hn(k+1) * xn(idx+1);
        end
    end
end

printf("y(n) = "); disp(yn_fs);

// ============================================================
// Matrix Method
// y = H * x  where H is the convolution matrix (Toeplitz)
// H is Ly x Lx, each row is h shifted
// ============================================================
printf("\n===== Matrix Method =====\n");

H = zeros(Ly, Lx);
for i = 1:Ly
    for j = 1:Lx
        row_idx = i - j;  // corresponds to h(i-j)
        if row_idx >= 0 & row_idx < Lh then
            H(i, j) = hn(row_idx + 1);
        end
    end
end

printf("Convolution matrix H:\n");
disp(H);

yn_mat = H * xn';
yn_mat = yn_mat';

printf("y(n) = "); disp(yn_mat);

// Verify with built-in
yn_builtin = convol(xn, hn);
printf("\nBuilt-in convol verification: "); disp(yn_builtin);

// ============================================================
// Plot x(n), h(n), y(n) and energy
// ============================================================
nx = 0:Lx-1;
nh = 0:Lh-1;
ny = 0:Ly-1;

subplot(2,2,1);
plot2d3(nx, xn, style=2); plot(nx, xn, 'bo');
title("x(n) = {1, 2, -3, 2, 1}");
xlabel("n"); ylabel("x(n)"); xgrid();

subplot(2,2,2);
plot2d3(nh, hn, style=5); plot(nh, hn, 'ro');
title("h(n) = {1, 0, -1}");
xlabel("n"); ylabel("h(n)"); xgrid();

subplot(2,2,3);
plot2d3(ny, yn_fs, style=3); plot(ny, yn_fs, 'mo');
title("y(n) = x(n) * h(n) [Linear Convolution]");
xlabel("n"); ylabel("y(n)"); xgrid();

// Energy
Ex = sum(xn.^2);
Eh = sum(hn.^2);
Ey = sum(yn_fs.^2);

subplot(2,2,4);
bar([1, 2, 3], [Ex, Eh, Ey]);
set(gca(), "x_ticks", tlist(["ticks", "locations", "labels"], [1, 2, 3], ["E_x", "E_h", "E_y"]));
title("Signal Energies");
ylabel("Energy"); xgrid();

printf("\nEnergies: Ex = %g, Eh = %g, Ey = %g\n", Ex, Eh, Ey);
