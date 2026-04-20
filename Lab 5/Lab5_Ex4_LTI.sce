// ============================================================
// Lab 5 - Exercise 4: LTI System y(n) = 0.7*y(n-1) + x(n)
// ============================================================
clear; clc; clf;

// (b) Impulse response h(n):
// H(z) = 1 / (1 - 0.7*z^(-1)) = z / (z - 0.7)
// h(n) = (0.7)^n * u(n)

// (c) Step response y(n) when x(n) = u(n):
// X(z) = z/(z-1)
// Y(z) = z^2 / ((z-0.7)(z-1))
// Partial fractions: Y(z)/z = z/((z-0.7)(z-1))
//   A/(z-0.7) + B/(z-1)
//   A = 0.7/(0.7-1) = -7/3
//   B = 1/(1-0.7) = 10/3
// y(n) = [-7/3*(0.7)^n + 10/3] * u(n)

N = 20;
n = 0:N-1;

// Impulse response
hn = (0.7).^n;

// Step response (analytical)
yn_theory = -7/3 * (0.7).^n + 10/3;

// Step response (recursive verification)
yn_recur = zeros(1, N);
xn = ones(1, N);  // u(n)
yn_recur(1) = xn(1);  // y(0) = 0.7*y(-1) + x(0) = 0 + 1 = 1
for i = 2:N
    yn_recur(i) = 0.7 * yn_recur(i-1) + xn(i);
end

subplot(2,1,1);
plot2d3(n, hn, style=2); plot(n, hn, 'bo');
title("h(n) = (0.7)^n * u(n)");
xlabel("n"); ylabel("h(n)"); xgrid();

subplot(2,1,2);
plot2d3(n, yn_theory, style=5); plot(n, yn_theory, 'ro');
plot(n, yn_recur, 'b+');
title("y(n) for x(n) = u(n): analytical (stems) vs recursive (+)");
xlabel("n"); ylabel("y(n)"); xgrid();

printf("h(n) = (0.7)^n * u(n)\n");
printf("y(n) = [-7/3*(0.7)^n + 10/3] * u(n)\n");
printf("Analytical first 5: "); disp(yn_theory(1:5));
printf("Recursive  first 5: "); disp(yn_recur(1:5));
