// ============================================================
// Exercise 8: Signal Manipulations
// ============================================================
// Given: x(n) = {1, -2, 3↑, 6}
// Origin (n=0) at value 3.
// So: x(-2)=1, x(-1)=-2, x(0)=3, x(1)=6
//     n_x = [-2, -1, 0, 1]
//
// Required manipulations (from lab manual):
//   y1(n) = x(-n)          (Folding / Time reversal)
//   y2(n) = x(n + 3)       (Advance by 3)
//   y3(n) = 2*x(-n - 2)    (Fold + shift + amplitude scaling)
// ============================================================
clear; clc; clf;

// Original signal
n_x = [-2, -1, 0, 1];
x   = [1, -2, 3, 6];

// ============================================================
// Manipulation 1: y1(n) = x(-n) => Folding (Time Reversal)
// ============================================================
n_y1 = -n_x($:-1:1);    // negate and reverse: [-1, 0, 1, 2]
y1   = x($:-1:1);        // reverse values:     [6, 3, -2, 1]

printf("--- y1(n) = x(-n) [Folding] ---\n");
printf("n_y1 = "); disp(n_y1);
printf("y1   = "); disp(y1);

// ============================================================
// Manipulation 2: y2(n) = x(n + 3) => Advance by 3
// Sample at index m appears at index m - 3.
// ============================================================
n_y2 = n_x - 3;         // [-5, -4, -3, -2]
y2   = x;               // values unchanged

printf("\n--- y2(n) = x(n+3) [Advance by 3] ---\n");
printf("n_y2 = "); disp(n_y2);
printf("y2   = "); disp(y2);

// ============================================================
// Manipulation 3: y3(n) = 2*x(-n - 2)
// Step 1: Fold  => x(-n),       indices [-1, 0, 1, 2]
// Step 2: Shift => x(-(n+2)),   indices [-3, -2, -1, 0]
// Step 3: Scale => 2*x(-(n+2)), values doubled
// ============================================================
n_fold = -n_x($:-1:1);   // [-1, 0, 1, 2]
x_fold = x($:-1:1);       // [6, 3, -2, 1]
n_y3   = n_fold - 2;      // [-3, -2, -1, 0]
y3     = 2 * x_fold;      // [12, 6, -4, 2]

printf("\n--- y3(n) = 2*x(-n-2) [Fold + Shift + Scale] ---\n");
printf("n_y3 = "); disp(n_y3);
printf("y3   = "); disp(y3);

// ============================================================
// PLOTTING
// ============================================================

// Figure 1: y1(n) = x(-n)
scf(1); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2); plot(n_x, x, 'bo');
title("Original x(n) = {1, -2, 3, 6}");
xlabel("n"); ylabel("x(n)"); xgrid();
subplot(2,1,2);
plot2d3(n_y1, y1, style=5); plot(n_y1, y1, 'ro');
title("y1(n) = x(-n)  [Folding]");
xlabel("n"); ylabel("y1(n)"); xgrid();

// Figure 2: y2(n) = x(n+3)
scf(2); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2); plot(n_x, x, 'bo');
title("Original x(n) = {1, -2, 3, 6}");
xlabel("n"); ylabel("x(n)"); xgrid();
subplot(2,1,2);
plot2d3(n_y2, y2, style=5); plot(n_y2, y2, 'ro');
title("y2(n) = x(n+3)  [Advance by 3]");
xlabel("n"); ylabel("y2(n)"); xgrid();

// Figure 3: y3(n) = 2*x(-n-2)
scf(3); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2); plot(n_x, x, 'bo');
title("Original x(n) = {1, -2, 3, 6}");
xlabel("n"); ylabel("x(n)"); xgrid();
subplot(2,1,2);
plot2d3(n_y3, y3, style=3); plot(n_y3, y3, 'mo');
title("y3(n) = 2*x(-n-2)  [Fold + Shift + Scale]");
xlabel("n"); ylabel("y3(n)"); xgrid();
