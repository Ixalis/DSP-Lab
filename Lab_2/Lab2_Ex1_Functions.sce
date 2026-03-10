
clear; clc; clf;

// ----- plot2d3(x, y) -----
n = 0:5;
x = [1 3 2 5 4 6];
subplot(2,2,1);
plot2d3(n, x);
title("plot2d3 - Stem Plot");
xlabel("n"); ylabel("x(n)");

// ----- min(...) and max(...) -----
v = [3, -1, 7, 2, -5, 10];
printf("Vector v = [3, -1, 7, 2, -5, 10]\n");
printf("min(v) = %g\n", min(v));   // returns -5
printf("max(v) = %g\n", max(v));   // returns 10

// ----- subplot(m, n, p) -----
subplot(2,2,2);
plot2d3(n, x*2);
title("subplot demo - position (2,2,2)");
xlabel("n"); ylabel("2*x(n)");

// ----- title(...), xlabel(...), ylabel(...) -----
subplot(2,2,3);
plot2d3(n, -x);
title("title() demo");
xlabel("xlabel() demo");
ylabel("ylabel() demo");

// ----- bool2s(...) -----
n2 = -3:3;
result = bool2s(n2 >= 0);
printf("\nbool2s(n >= 0) for n = -3:3:\n");
disp(result);
subplot(2,2,4);
plot2d3(n2, result);
title("bool2s - Boolean to Numeric");
xlabel("n"); ylabel("bool2s(n>=0)");

// ----- deff(...) -----
deff('[y] = square(x)', 'y = x.^2');
printf("deff example: square(5) = %g\n", square(5));
printf("deff example: square([1 2 3]) = ");
disp(square([1 2 3]));

