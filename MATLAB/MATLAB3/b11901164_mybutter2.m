clear all; clc;

%% (a)

Ts = 0.002;
fs = 1 / Ts;
f1 = 100;
M = 1000;
n = 1:M;
x = cos(2*pi*(n-1)*Ts) + 2*cos(2*pi*f1*(n-1)*Ts);

figure(1);
subplot(3, 1, 1);
plot(n, x);
title("(a) x[n] vs n");
xlabel("n");
ylabel("x[n]");

%% (b)

L = 16;
fc = f1 / 2;
[b, a] = butter(L, 2*fc/fs, "low");
% K = 100;
% [H, w] = freqz(b, a, K);
% Mag_H = 20*log10(abs(H));
% phase = atan2(imag(H), real(H));
% phase = phase*180/pi;
y = filter(b, a, x);

subplot(3, 1, 2);
plot(n, y);
title("(b) y[n] vs n");
xlabel("n");
ylabel("y[n]");

%% (c)

L = 16;
fc = [f1-f1/4, f1+f1/4];
[b,a] = butter(L, 2*fc/fs, "bandpass");
%[H,w] = freqz(b, a, K);
%Mag_H = 20*log10(abs(H));
%phase = atan2(imag(H), real(H));
%phase = phase*180/pi;
y = filter(b, a, x);

subplot(3, 1, 3);
plot(n, y);
title("(c) y[n] vs n");
xlabel("n");
ylabel("y[n]");

