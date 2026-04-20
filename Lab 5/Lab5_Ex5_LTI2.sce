// ============================================================
// Lab 5 - Exercise 5: LTI System
// y(n) = 2*y(n-1) - 3*y(n-2) + x(n) + x(n-1)
// ============================================================
clear; clc; clf;

// H(z) = (1 + z^(-1)) / (1 - 2*z^(-1) + 3*z^(-2))
//      = z(z+1) / (z^2 - 2z + 3)
// Poles: z = (2 ± sqrt(4-12))/2 = 1 ± j*sqrt(2)
// |poles| = sqrt(1+2) = sqrt(3) ≈ 1.732 => UNSTABLE system

printf("===== Exercise 5 =====\n");
printf("y(n) = 2*y(n-1) - 3*y(n-2) + x(n) + x(n-1)\n\n");

// (b) Impulse response h(n) - compute recursively
N = 15;
n = 0:N-1;

// h(n) via recursion with x(n) = delta(n)
hn = zeros(1, N);
xn_imp = zeros(1, N);
xn_imp(1) = 1;  // delta(n)

hn(1) = xn_imp(1);  // h(0) = x(0) = 1 (y(-1)=y(-2)=0)
if N > 1 then
    hn(2) = 2*hn(1) + xn_imp(2) + xn_imp(1);  // h(1) = 2*h(0) + x(1) + x(0) = 2+0+1 = 3
end
for i = 3:N
    xn_cur = 0; xn_prev = 0;
    if i <= length(xn_imp) then xn_cur = xn_imp(i); end
    if i-1 <= length(xn_imp) then xn_prev = xn_imp(i-1); end
    hn(i) = 2*hn(i-1) - 3*hn(i-2) + xn_cur + xn_prev;
end

printf("(b) Impulse response h(n) first 10 values:\n");
disp(hn(1:min(10,N)));

// (c) Zero-input response yzi(n) with y(-1) = 1, y(-2) = 1
yzi = zeros(1, N);
// y(-2) = 1, y(-1) = 1, x(n) = 0 for all n
ym2 = 1; ym1 = 1;
yzi(1) = 2*ym1 - 3*ym2;  // y(0) = 2*y(-1) - 3*y(-2) = 2 - 3 = -1
yzi(2) = 2*yzi(1) - 3*ym1;  // y(1) = 2*y(0) - 3*y(-1) = -2 - 3 = -5
for i = 3:N
    yzi(i) = 2*yzi(i-1) - 3*yzi(i-2);
end

printf("\n(c) Zero-input response yzi(n) with y(-1)=y(-2)=1:\n");
printf("First 10 values: "); disp(yzi(1:min(10,N)));

// (d) Zero-state response yzs(n) when x(n) = 2^n * u(n)
xn_zs = 2.^n;  // 2^n * u(n) for n >= 0
yzs = zeros(1, N);
yzs(1) = xn_zs(1);  // y(0) = x(0) = 1
yzs(2) = 2*yzs(1) + xn_zs(2) + xn_zs(1);  // y(1) = 2*y(0) + x(1) + x(0) = 2+2+1 = 5
for i = 3:N
    yzs(i) = 2*yzs(i-1) - 3*yzs(i-2) + xn_zs(i) + xn_zs(i-1);
end

printf("\n(d) Zero-state response yzs(n) when x(n) = 2^n*u(n):\n");
printf("First 10 values: "); disp(yzs(1:min(10,N)));

// Plot
subplot(3,1,1);
plot2d3(n, hn, style=2); plot(n, hn, 'bo');
title("h(n) - Impulse Response");
xlabel("n"); ylabel("h(n)"); xgrid();

subplot(3,1,2);
plot2d3(n, yzi, style=5); plot(n, yzi, 'ro');
title("yzi(n) - Zero-Input Response [y(-1)=y(-2)=1]");
xlabel("n"); ylabel("yzi(n)"); xgrid();

subplot(3,1,3);
plot2d3(n, yzs, style=3); plot(n, yzs, 'mo');
title("yzs(n) - Zero-State Response [x(n)=2^n*u(n)]");
xlabel("n"); ylabel("yzs(n)"); xgrid();
