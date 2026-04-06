// ============================================================
// Lab 4 - Exercise 1: Z-Transform
// x(n) = 2*delta(n+2) - 1*delta(n+1) + 2*delta(n)
//        - 3*delta(n-1) + 4*delta(n-2)
// This is a finite-length signal => ROC: entire z-plane
// except possibly z=0 and/or z=infinity
// ============================================================
// X(z) = sum x(n)*z^(-n)
//       = 2*z^(-(-2)) - 1*z^(-(-1)) + 2*z^0 - 3*z^(-1) + 4*z^(-2)
//       = 2*z^2 - z + 2 - 3*z^(-1) + 4*z^(-2)
// ROC: 0 < |z| < infinity (entire z-plane except z=0)
// Because we have both positive and negative powers of z,
// ROC is 0 < |z| < inf

printf("===== Exercise 1 =====\n");
printf("x(n) = 2*d(n+2) - d(n+1) + 2*d(n) - 3*d(n-1) + 4*d(n-2)\n");
printf("X(z) = 2*z^2 - z + 2 - 3*z^(-1) + 4*z^(-2)\n");
printf("     = (2*z^4 - z^3 + 2*z^2 - 3*z + 4) / z^2\n");
printf("ROC: 0 < |z| < infinity\n\n");

// ============================================================
// Lab 4 - Exercise 2: Z-Transform
// x(n) = (0.5)^n * u(n) + (0.4)^n * u(n)
// ============================================================
// X(z) = 1/(1 - 0.5*z^(-1)) + 1/(1 - 0.4*z^(-1))
//       = z/(z - 0.5) + z/(z - 0.4)
// ROC: |z| > 0.5 (from first term, causal)
//      AND |z| > 0.4 (from second term, causal)
//      => ROC: |z| > 0.5

printf("===== Exercise 2 =====\n");
printf("x(n) = (0.5)^n * u(n) + (0.4)^n * u(n)\n");
printf("X(z) = z/(z-0.5) + z/(z-0.4)\n");
printf("     = (2*z^2 - 0.9*z) / ((z-0.5)*(z-0.4))\n");
printf("ROC: |z| > 0.5\n\n");

// ============================================================
// Lab 4 - Exercise 3: Z-Transform
// x(n) = (0.5)^n * u(n) + (0.9)^n * u(-n-1)
// ============================================================
// First term:  (0.5)^n * u(n)     => z/(z-0.5), ROC: |z| > 0.5
// Second term: (0.9)^n * u(-n-1)  => -z/(z-0.9), ROC: |z| < 0.9
// Combined ROC: 0.5 < |z| < 0.9

printf("===== Exercise 3 =====\n");
printf("x(n) = (0.5)^n * u(n) + (0.9)^n * u(-n-1)\n");
printf("First term:  Z{(0.5)^n u(n)} = z/(z-0.5),  ROC: |z| > 0.5\n");
printf("Second term: Z{(0.9)^n u(-n-1)} = -z/(z-0.9),  ROC: |z| < 0.9\n");
printf("X(z) = z/(z-0.5) - z/(z-0.9)\n");
printf("     = 0.4*z / ((z-0.5)*(z-0.9))\n");
printf("ROC: 0.5 < |z| < 0.9\n");
