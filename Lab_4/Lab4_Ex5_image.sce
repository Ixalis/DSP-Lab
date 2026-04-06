// ============================================================
// Lab 4 - Exercise 5: Image Processing in Scilab
// Investigate library/toolbox for image processing
// Demo: histogram display, blur
// ============================================================
clear; clc; clf;

// Scilab image processing uses SIVP or IPD toolbox
// Built-in functions: imread, imshow, imwrite
// For this demo, we create a synthetic grayscale image

// Create a 128x128 synthetic test image
N = 128;
img = zeros(N, N);

// Draw a bright square in center
img(32:96, 32:96) = 200;

// Draw a gradient region
for i = 1:N
    img(i, 100:128) = round(i/N * 255);
end

// Add some noise
noise = 20 * grand(N, N, "nor", 0, 1);
img_noisy = min(max(img + noise, 0), 255);

// Display original image
subplot(2,2,1);
Matplot(img);
title("Original Synthetic Image");

// Display noisy image
subplot(2,2,2);
Matplot(img_noisy);
title("Noisy Image (Gaussian Noise)");

// Histogram of noisy image
subplot(2,2,3);
img_vec = matrix(img_noisy, 1, N*N);
histplot(50, img_vec);
title("Histogram of Noisy Image");
xlabel("Pixel Intensity"); ylabel("Frequency");

// Simple blur: 3x3 averaging filter (manual convolution)
kernel_size = 3;
img_blur = zeros(N, N);
for i = 2:N-1
    for j = 2:N-1
        img_blur(i,j) = mean(img_noisy(i-1:i+1, j-1:j+1));
    end
end

subplot(2,2,4);
Matplot(img_blur);
title("Blurred Image (3x3 Averaging)");

printf("Image processing demo complete.\n");
printf("Demonstrated: synthetic image, noise, histogram, blur.\n");
printf("Scilab image functions: imread, imshow, Matplot, histplot\n");
