// ============================================================
// Lab 4 - Exercise 4: Audio Processing in Scilab
// Investigate existing library/toolbox for audio data
// ============================================================
clear; clc; clf;

// Scilab provides built-in functions for audio:
//   loadwave() / savewave()  - read/write .wav files
//   sound() / playsnd()      - play audio
//   wavread() / wavwrite()   - alternative wav I/O

// Demo: Generate a simple sine wave tone and manipulate it

// Parameters
Fs = 8000;          // sampling rate (Hz)
duration = 1;       // duration in seconds
f1 = 440;           // frequency A4 (Hz)
t = 0:1/Fs:duration;

// Generate a 440 Hz sine wave
signal = 0.5 * sin(2 * %pi * f1 * t);

// Plot the original signal (first 200 samples)
subplot(3,1,1);
plot(t(1:200)*1000, signal(1:200), 'b-');
title("Original: 440 Hz Sine Wave");
xlabel("Time (ms)"); ylabel("Amplitude"); xgrid();

// Manipulation 1: Change playback speed (resample by taking every 2nd sample)
signal_fast = signal(1:2:$);
t_fast = (0:length(signal_fast)-1) / Fs;
subplot(3,1,2);
plot(t_fast(1:100)*1000, signal_fast(1:100), 'r-');
title("Speed Up: Every 2nd Sample (sounds 1 octave higher)");
xlabel("Time (ms)"); ylabel("Amplitude"); xgrid();

// Manipulation 2: Add echo (delay + attenuate + mix)
delay_samples = round(0.2 * Fs);  // 200ms echo
echo_signal = zeros(1, length(signal) + delay_samples);
echo_signal(1:length(signal)) = signal;
echo_signal(delay_samples+1:$) = echo_signal(delay_samples+1:$) + 0.5 * signal;
subplot(3,1,3);
t_echo = (0:length(echo_signal)-1) / Fs;
plot(t_echo*1000, echo_signal, 'color', [0 0.6 0]);
title("Echo Effect: Original + 0.5x Delayed by 200ms");
xlabel("Time (ms)"); ylabel("Amplitude"); xgrid();

// Save to wav (optional, uncomment to test)
// savewave("original.wav", signal, Fs);
// savewave("echo.wav", echo_signal, Fs);

printf("Audio processing demo complete.\n");
printf("Scilab audio functions: loadwave, savewave, sound, playsnd\n");
printf("Generated: 440Hz sine, speed-up, and echo effect.\n");
