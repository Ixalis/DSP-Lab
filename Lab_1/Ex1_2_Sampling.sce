clear; clc; clf;


F0   = 100;            // Analog frequency in Hz
A    = 3;              // Amplitude
phi  = %pi/3;          // Phase offset

T0   = 1/F0;           // Analog period = 0.01 s
Fs   = 300;            // Sampling rate (samples/s)
Ts   = 1/Fs;           // Sampling interval


// Part (a): Draw the analog signal xa(t) over 5 periods

t = linspace(0, 5*T0, 1000);
xa_t = A * cos(2*%pi*F0*t + phi);     // analog signal

subplot(3,1,1);
plot(t*1000, xa_t, 'b-');
xlabel("Time t (ms)");
ylabel("x_a(t)");
title("Analog Signal x_a(t) = 3·cos(200πt + π/3)  —  5 periods");
xgrid();


// Part (b): Discrete-time signal x(n) sampled at Fs=300

f0 = F0 / Fs;
omega0 = 2*%pi*f0;

disp("--- Discrete-time signal analysis ---");
printf("  Analog frequency F0       = %g Hz\n", F0);
printf("  Sampling rate Fs          = %g samples/s\n", Fs);
printf("  Digital frequency f0      = F0/Fs = %g/%g = %g cycles/sample\n", F0, Fs, f0);
printf("  Digital angular freq w0   = 2*pi*(%g) = %g rad/sample\n", f0, omega0);


// Part (c): Periodicity check of x(n)



// For a general check: f0 = p/q where gcd(p,q) = 1
//   Here p = 1, q = 3

[num_f0, den_f0] = rat(f0);   // rational approximation
// rat() returns fraction
g = gcd([num_f0, den_f0]);
p = num_f0 / g;
q = den_f0 / g;

N0 = q;   // fundamental period in samples

printf("\n  f0 as fraction            = %d/%d\n", p, q);
printf("  => x(n) is PERIODIC with period N0 = %d samples\n", N0);
printf("  Discrete fundamental freq = 1/N0 = 1/%d cycles/sample\n", N0);

// Draw x(n) over 5 periods
n_total = 5 * N0;
n = 0 : n_total - 1;
xn = A * cos(omega0 * n + phi);

subplot(3,1,2);
plot2d3(n, xn, style=2);
plot(n, xn, 'ro');
xlabel("Sample index n");
ylabel("x(n)");
title("Discrete-time Signal x(n)  —  5 periods  (N0 = " + string(N0) + " samples)");
xgrid();


// Part (d): Quantized signal xq(n) using truncation

Delta = 1;   // quantization step size — adjust if needed

xq_n = fix(xn / Delta) * Delta;   // truncation quantization

subplot(3,1,3);
plot2d3(n, xq_n, style=5);
plot(n, xq_n, 'ms');
xlabel("Sample index n");
ylabel("x_q(n)");
title("Quantized Signal x_q(n) using Truncation (Δ = " + string(Delta) + ")");
xgrid();

// Adjust overall figure
gcf().figure_size = [800, 900];

printf("\n  Quantization step Delta   = %g\n", Delta);
printf("  Method: Truncation (fix)\n");
