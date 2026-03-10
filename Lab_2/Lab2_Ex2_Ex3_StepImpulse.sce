
clear; clc; clf;

n = -5:5;
msignal = bool2s(n >= 0);
subplot(1,2,1);
plot2d3(n, msignal);
title("Exercise 2: Unit Step Signal u(n)");
xlabel("n");
ylabel("u(n)");
xgrid();

n = -5:5;
msignal = bool2s(n == 0);
subplot(1,2,2);
plot2d3(n, msignal);
title("Exercise 3: Unit Impulse Signal d(n)");
xlabel("n");
ylabel("d(n)");
xgrid();


