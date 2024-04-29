clear all; clc;

%% (a)

Ts = 1 / 20; 
% sampling interval and the sampling frequency is fs = 1/Ts = 20 Hz
n = 1:100;
x = cos(2*pi*(n-1)*Ts);

figure(1);
plot(n, x);
title("(a) x[n] vs n");
xlabel("n");
ylabel("x[n]");

%% (b)

L = 3; % Filter order
fc = 0.05; % Cutoff frequency
[b, a] = butter(L, fc, "low");
K = 50;
% K-point complex frequency response vector H
% K-point frequency vecctor w in radians/sample of the filter
[H, w] = freqz(b, a, K);

figure(2);
Mag_H = 20 * log10(abs(H)); % magnitude of H in db

subplot(3, 3, 1);
plot(w, Mag_H);
title("(b)-1 magnitude response (in dB) vs w (in interval [0, pi])");
xlabel("w");
ylabel("magnitude response (dB)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

phase = atan2(imag(H), real(H)); % arctan(imag(H)/real(H))
phase = phase * 180 / pi; % from radian to degree

subplot(3, 3, 2);
plot(w, phase);
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});
title("(b)-2 phase response (in degree) vs w (in interval [0, pi])");
xlabel("w");
ylabel("phase response (degree)");

y = filter(b, a, x); % output signal

subplot(3, 3, 3);
plot(n, y);
title("(b)-3 output signal y[n] vs n");
xlabel("n");
ylabel("y[n]");
xticks([0, 25, 50, 75, 100]);
xticklabels({"0", "25", "50", "75", "100"});

%% (c)

L = 7; % Filter order
fc = 0.05; % Cutoff frequency
[b, a] = butter(L, fc, "low");
% K-point complex frequency response vector H
% K-point frequency vecctor w in radians/sample of the filter
[H, w] = freqz(b, a, K);

Mag_H = 20 * log10(abs(H)); % magnitude of H in db

subplot(3, 3, 4);
plot(w, Mag_H);
title("(c)-1 magnitude response (in dB) vs w (in interval [0, pi])");
xlabel("w");
ylabel("magnitude response (dB)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

phase = atan2(imag(H), real(H)); % arctan(imag(H)/real(H))
phase = phase * 180 / pi; % from radian to degree

subplot(3, 3, 5);
plot(w, phase);
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});
title("(c)-2 phase response (in degree) vs w (in interval [0, pi])");
xlabel("w");
ylabel("phase response (degree)");

y = filter(b, a, x); % output signal

subplot(3, 3, 6);
plot(n, y);
title("(c)-3output signal y[n] vs n");
xlabel("n");
ylabel("y[n]");
xticks([0, 25, 50, 75, 100]);
xticklabels({"0", "25", "50", "75", "100"});

%% (d)

L = 3; % Filter order
fc = 0.5; % Cutoff frequency
[b, a] = butter(L, fc, "low");
% K-point complex frequency response vector H
% K-point frequency vecctor w in radians/sample of the filter
[H, w] = freqz(b, a, K);

Mag_H = 20 * log10(abs(H)); % magnitude of H in db

subplot(3, 3, 7);
plot(w, Mag_H);
title("(d)-1 magnitude response (in dB) vs w (in interval [0, pi])");
xlabel("w");
ylabel("magnitude response (dB)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

phase = atan2(imag(H), real(H)); % arctan(imag(H)/real(H))
phase = phase * 180 / pi; % from radian to degree

subplot(3, 3, 8);
plot(w, phase);
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});
title("(d)-2 phase response (in degree) vs w (in interval [0, pi])");
xlabel("w");
ylabel("phase response (degree)");

y = filter(b, a, x); % output signal

subplot(3, 3, 9);
plot(n, y);
title("(d)-3 output signal y[n] vs n");
xlabel("n");
ylabel("y[n]");
xticks([0, 25, 50, 75, 100]);
xticklabels({"0", "25", "50", "75", "100"});
