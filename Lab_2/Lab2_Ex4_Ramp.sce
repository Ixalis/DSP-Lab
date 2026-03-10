// Definition: ur(n) = n  for n >= 0
//             ur(n) = 0  for n < 0
// Equivalently: ur(n) = n * u(n)
clear; clc; clf;

n = -5:5;

// Method: ur(n) = n .* u(n) = n .* bool2s(n >= 0)
ur = n .* bool2s(n >= 0);

plot2d3(n, ur);
title("Exercise 4: Unit Ramp Signal ur(n)");
xlabel("n");
ylabel("ur(n)");
xgrid();

disp("Unit ramp signal ur(n) for n = -5:5:");
disp([n; ur]);
