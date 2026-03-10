
// Even component: xe(n) = [x(n) + x(-n)] / 2
// Odd component:  xo(n) = [x(n) - x(-n)] / 2
// Verification:   x(n) = xe(n) + xo(n)
clear; clc; clf;

// Define the signal
n = -1:1;               // n = [-1, 0, 1]
x = [1, 3, -2];         // x(-1)=1, x(0)=3, x(1)=-2

// x(-n): reverse the vector => x(1)=-2, x(0)=3, x(-1)=1
// For n = [-1, 0, 1], x(-n) = [x(1), x(0), x(-1)] = [-2, 3, 1]
x_flipped = x($:-1:1);  // reverse of x

// Even component: xe(n) = [x(n) + x(-n)] / 2
xe = (x + x_flipped) / 2;

// Odd component: xo(n) = [x(n) - x(-n)] / 2
xo = (x - x_flipped) / 2;

// Display values
printf("n       = "); disp(n);
printf("x(n)    = "); disp(x);
printf("x(-n)   = "); disp(x_flipped);
printf("xe(n)   = "); disp(xe);
printf("xo(n)   = "); disp(xo);
printf("xe + xo = "); disp(xe + xo);  // should equal x(n)

// ----- Plot all three signals in one window -----
subplot(3,1,1);
plot2d3(n, x, style=2);
plot(n, x, 'bo');
title("Exercise 5: Original Signal x(n) = {1, 3, -2}");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, xe, style=5);
plot(n, xe, 'ro');
title("Even Component xe(n) = [x(n) + x(-n)] / 2");
xlabel("n");
ylabel("xe(n)");
xgrid();

subplot(3,1,3);
plot2d3(n, xo, style=3);
plot(n, xo, 'mo');
title("Odd Component xo(n) = [x(n) - x(-n)] / 2");
xlabel("n");
ylabel("xo(n)");
xgrid();
