// ============================================================
// Lab 5 - Exercise 2: Convolution via Z and Z^-1 Transform
// Verify results with Scilab's convol function
// ============================================================
clear; clc; clf;

// ── (a) x1(n) = {1↑, 2, 3, 4, 5} and x2(n) = {1↑, 1, 1} ──
printf("===== Exercise 2(a): Finite-length convolution =====\n");
x1a = [1, 2, 3, 4, 5];
x2a = [1, 1, 1];
ya = convol(x1a, x2a);
printf("x1 = "); disp(x1a);
printf("x2 = "); disp(x2a);
printf("y = x1 * x2 = "); disp(ya);
// Expected: [1, 3, 6, 9, 12, 9, 5]

subplot(3,2,1);
na = 0:length(ya)-1;
plot2d3(na, ya, style=2); plot(na, ya, 'bo');
title("2(a): y = {1,2,3,4,5} * {1,1,1}");
xlabel("n"); ylabel("y(n)"); xgrid();

// ── (b) x1(n) = (1/5)^n * u(n) and x2(n) = 2^n * u(n) ──
printf("\n===== Exercise 2(b): Two causal geometric sequences =====\n");
// X1(z) = z/(z - 1/5),  ROC: |z| > 1/5
// X2(z) = z/(z - 2),    ROC: |z| > 2
// Y(z) = X1(z) * X2(z) = z^2 / ((z-0.2)(z-2))
// Partial fractions: Y(z)/z = z / ((z-0.2)(z-2))
//   = A/(z-0.2) + B/(z-2)
//   A = 0.2/(-1.8) = -1/9
//   B = 2/1.8 = 10/9
// Y(z) = (-1/9)*z/(z-0.2) + (10/9)*z/(z-2)
// y(n) = [-1/9 * (0.2)^n + 10/9 * 2^n] * u(n)
// ROC: |z| > 2

N = 10;
n = 0:N-1;
yb_theory = (-1/9) * (0.2).^n + (10/9) * 2.^n;

// Numerical verification (truncated convolution)
x1b = (1/5).^(0:N-1);
x2b = 2.^(0:N-1);
yb_num = convol(x1b, x2b);
yb_num = yb_num(1:N);  // take first N samples

printf("y(n) = [-1/9*(1/5)^n + 10/9*2^n] * u(n)\n");
printf("Theory (first 5): "); disp(yb_theory(1:5));
printf("Numerical (first 5): "); disp(yb_num(1:5));

subplot(3,2,3);
plot2d3(n, yb_theory, style=5); plot(n, yb_theory, 'ro');
title("2(b): (1/5)^n*u(n) * 2^n*u(n)");
xlabel("n"); ylabel("y(n)"); xgrid();

// ── (c) x1(n) = u(n) and x2(n) = 2^n * u(n-1) ──
printf("\n===== Exercise 2(c): u(n) * 2^n*u(n-1) =====\n");
// X1(z) = z/(z-1),  ROC: |z| > 1
// X2(z) = Z{2^n * u(n-1)} = Z{2^n * u(n)} - 2^0*delta(n)
//       = z/(z-2) - 1 = (z - (z-2))/(z-2) = 2/(z-2)
// Actually: 2^n * u(n-1) = 2^n * u(n) - delta(n)
// X2(z) = z/(z-2) - 1 = (z - z + 2)/(z-2) = 2/(z-2)
// Y(z) = X1*X2 = 2z / ((z-1)(z-2))
// Partial fractions: Y(z)/z = 2/((z-1)(z-2))
//   = A/(z-1) + B/(z-2)
//   A = 2/(1-2) = -2
//   B = 2/(2-1) = 2
// Y(z) = -2*z/(z-1) + 2*z/(z-2)
// y(n) = [-2 + 2*2^n] * u(n) = 2*(2^n - 1)*u(n)
// ROC: |z| > 2

yc_theory = 2 * (2.^n - 1);

// Numerical verification
x1c = ones(1, N);
x2c = zeros(1, N);
x2c(2:N) = 2.^(1:N-1);  // 2^n * u(n-1): zero at n=0, 2^n for n>=1
yc_num = convol(x1c, x2c);
yc_num = yc_num(1:N);

printf("y(n) = 2*(2^n - 1) * u(n)\n");
printf("Theory (first 5): "); disp(yc_theory(1:5));
printf("Numerical (first 5): "); disp(yc_num(1:5));

subplot(3,2,5);
plot2d3(n, yc_theory, style=3); plot(n, yc_theory, 'mo');
title("2(c): u(n) * 2^n*u(n-1)");
xlabel("n"); ylabel("y(n)"); xgrid();
