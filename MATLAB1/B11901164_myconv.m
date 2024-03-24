clear all; clc;

% (a) plot x1[n] vs n and x2[n] vs n
% Define the range for n
n = 1:39;

% Define x1[n]
x1 = [n(1:20), 40 - n(21:39)];

% Define x2[n]
u = @(n) (n >= 0); % Unit step function
x2 = u(n - 1) - u(n - 11);

% Plot x1[n] and x2[n]
figure;
subplot(2,1,1);
stem(n, x1, 'filled');
xlabel('n');
ylabel('x1[n]');
title('(1) x1[n] vs n');

subplot(2,1,2);
stem(n, x2, 'filled');
xlabel('n');
ylabel('x2[n]');
title('(2) x2[n] vs n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (b) Computing the convolution using conv
% Compute the convolution
y = conv(x1, x2);

% Plot the output y[n]
figure;
stem(1:length(y), y, 'filled');
xlabel('n');
ylabel('y[n]');
title('(3) y1[n] vs n (conv)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (c) Computing the convolution using matrix form
% Create the convolution matrix
N1 = length(x1);
N2 = length(x2);
conv_matrix = zeros(N1 + N2 - 1, N1);
for k = 1:N1
    conv_matrix(:, k) = [zeros(k-1, 1); x1'; zeros(N1 - k, 1)];
end

% Compute the convolution using matrix form
y_matrix = conv_matrix * x2';

% Plot the output y[n]
figure;
stem(1:length(y_matrix), y_matrix, 'filled');
xlabel('n');
ylabel('y[n]');
title('(4) y2[n] vs n (matrix form)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (d) Repeat (a) to (c)
% Modify x1[n]
x1_new = [3 .^ (1:3), zeros(1, 36)];

% Modify x2[n]
x2_new = [2 .^ (1:5), zeros(1, 34)];

% Plot modified x1[n] and x2[n]
figure;
subplot(2,1,1);
stem(n, x1_new, 'filled');
xlabel('n');
ylabel('x1[n]');
title('(5) x1[n] vs n');

subplot(2,1,2);
stem(n, x2_new, 'filled');
xlabel('n');
ylabel('x2[n]');
title('(6) x2[n] vs n');

% Compute the convolution for modified signals
y_new = conv(x1_new, x2_new);

% Plot the output y[n] for modified signals
figure;
stem(1:length(y_new), y_new, 'filled');
xlabel('n');
ylabel('y[n]');
title('(7) y1[n] vs n (conv)');

% Create the convolution matrix for modified signals
N1_new = length(x1_new);
N2_new = length(x2_new);
conv_matrix_new = zeros(N1_new + N2_new - 1, N1_new);
for k = 1:N1_new
    conv_matrix_new(:, k) = [zeros(k-1, 1); x1_new'; zeros(N1_new - k, 1)];
end

% Compute the convolution using matrix form for modified signals
y_matrix_new = conv_matrix_new * x2_new';

% Plot the output y[n] for modified signals (Matrix Form)
figure;
stem(1:length(y_matrix_new), y_matrix_new, 'filled');
xlabel('n');
ylabel('y[n]');
title('(8) y2[n] vs n (matrix form)');
