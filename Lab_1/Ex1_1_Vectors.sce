clear; clc;

// ----- Task 1 -----
x = 1:4;
result1 = x + 1;
disp("Task 1: Vector x = 1:4, Result = x + 1");
disp(x, "x =");
disp(result1, "x + 1 =");

// ----- Task 2 -----
x = 1:4;
y = 5:8;
result2 = x .* y;   // element-wise multiplication
disp("Task 2: Element-wise product of x=1:4 and y=5:8");
disp(x, "x =");
disp(y, "y =");
disp(result2, "x .* y =");

// ----- Task 3 -----
x = linspace(0, %pi, 10);
result3 = sin(x);
disp("Task 3: sin(x) for 10 linearly spaced values in [0, pi]");
disp(x, "x =");
disp(result3, "sin(x) =");
