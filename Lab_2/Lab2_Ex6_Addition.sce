clear; clc; clf;

// Define x1(n) with its index
n1 = [0, 1, 2, 3];
x1 = [0, 1, 3, -2];

// Define x2(n) with its index
n2 = [-1, 0, 1, 2];
x2 = [0, 1, 2, 3];

// Common range: union of n1 and n2
n_min = min(min(n1), min(n2));    // -1
n_max = max(max(n1), max(n2));    //  3
n = n_min:n_max;                  // [-1, 0, 1, 2, 3]

// Extend x1 and x2 to the common range (zero-pad where undefined)
x1_ext = zeros(1, length(n));
x2_ext = zeros(1, length(n));

for i = 1:length(n1)
    idx = find(n == n1(i));
    x1_ext(idx) = x1(i);
end

for i = 1:length(n2)
    idx = find(n == n2(i));
    x2_ext(idx) = x2(i);
end

// Compute y(n) = x1(n) + x2(n)
y = x1_ext + x2_ext;

// Display
printf("Common index n = "); disp(n);
printf("x1(n) extended = "); disp(x1_ext);
printf("x2(n) extended = "); disp(x2_ext);
printf("y(n) = x1+x2  = "); disp(y);

// ----- Plot all three signals in one window -----
subplot(3,1,1);
plot2d3(n, x1_ext, style=2);
plot(n, x1_ext, 'bo');
title("Exercise 6: x1(n) = {0↑, 1, 3, -2}");
xlabel("n");
ylabel("x1(n)");
xgrid();

subplot(3,1,2);
plot2d3(n, x2_ext, style=5);
plot(n, x2_ext, 'ro');
title("x2(n) = {0, 1↑, 2, 3}");
xlabel("n");
ylabel("x2(n)");
xgrid();

subplot(3,1,3);
plot2d3(n, y, style=3);
plot(n, y, 'mo');
title("y(n) = x1(n) + x2(n)");
xlabel("n");
ylabel("y(n)");
xgrid();
