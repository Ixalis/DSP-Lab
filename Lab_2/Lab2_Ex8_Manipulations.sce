clear; clc; clf;

// Original signal
n_x = [-2, -1, 0, 1];
x   = [1, -2, 3, 6];


// Manipulation 1: y1(n) = x(n - 2) => Delay by 2
// Shifting n by +2: new indices = n_x + 2

n_y1 = n_x + 2;         
y1   = x;               

printf("--- Manipulation 1: y1(n) = x(n-2) [Delay by 2] ---\n");
printf("n_y1 = "); disp(n_y1);
printf("y1   = "); disp(y1);

n_y2 = n_x - 1;         
y2   = x;              

printf("\n--- Manipulation 2: y2(n) = x(n+1) [Advance by 1] ---\n");
printf("n_y2 = "); disp(n_y2);
printf("y2   = "); disp(y2);


n_y3 = -n_x($:-1:1);    // reverse and negate: -[1,0,-1,-2] = [-1,0,1,2]
y3   = x($:-1:1);        // reverse values: [6, 3, -2, 1]

printf("\n--- Manipulation 3: y3(n) = x(-n) [Folding] ---\n");
printf("n_y3 = "); disp(n_y3);
printf("y3   = "); disp(y3);


// ----- Figure 1: x(n) and y1(n) = x(n-2) -----
scf(1); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2);
plot(n_x, x, 'bo');
title("Original Signal x(n) = {1, -2, 3↑, 6}");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(2,1,2);
plot2d3(n_y1, y1, style=5);
plot(n_y1, y1, 'ro');
title("y1(n) = x(n - 2)  [Delay by 2]");
xlabel("n");
ylabel("y1(n)");
xgrid();

// ----- Figure 2: x(n) and y2(n) = x(n+1) -----
scf(2); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2);
plot(n_x, x, 'bo');
title("Original Signal x(n) = {1, -2, 3↑, 6}");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(2,1,2);
plot2d3(n_y2, y2, style=5);
plot(n_y2, y2, 'ro');
title("y2(n) = x(n + 1)  [Advance by 1]");
xlabel("n");
ylabel("y2(n)");
xgrid();

// ----- Figure 3: x(n) and y3(n) = x(-n) -----
scf(3); clf;
subplot(2,1,1);
plot2d3(n_x, x, style=2);
plot(n_x, x, 'bo');
title("Original Signal x(n) = {1, -2, 3↑, 6}");
xlabel("n");
ylabel("x(n)");
xgrid();

subplot(2,1,2);
plot2d3(n_y3, y3, style=3);
plot(n_y3, y3, 'mo');
title("y3(n) = x(-n)  [Folding / Time Reversal]");
xlabel("n");
ylabel("y3(n)");
xgrid();

printf("\n--- All plots displayed in 3 separate figure windows ---\n");
printf("Figure 1: x(n) and y1(n) = x(n-2)\n");
printf("Figure 2: x(n) and y2(n) = x(n+1)\n");
printf("Figure 3: x(n) and y3(n) = x(-n)\n");
