clear all; clc;

%% (a)
z = tf("z");
H = 0.09*(z - 1)^2*(z + 1)^2/((z - 0.3 - 0.4i)*(z - 0.3 + 0.4i)*(z - 0.1 - 0.1i)*(z - 0.1 + 0.1i));
[b, a] = tfdata(H); % Access transfer function data
b = b{1}; % from cell array to regular array
a = a{1};

figure(1);
subplot(4, 2, 1);
zplane(b, a);

%% (b)
[r, p, k] = residuez(b, a); % residues, 4 ploes, direct term
n = 0:20;
h = r(1)*p(1).^n + r(2)*p(2).^n + r(3)*p(3).^n + r(4)*p(4).^n; % computes this sum for the given residues r and poles p over the range n = 0:20.
h(1) = h(1) + k; % direct term k contributes only to h[0]

subplot(4, 2, 2);
stem(n, h);
title("(b) h[n] vs n");
xlabel("n");
ylabel("h[n]");

%% (c)
K = 500;
[H, w] = freqz(b, a, K);

subplot(4, 2, 3);
plot(w, 20*log10(abs(H)));
title("(c)-1 magnitude of H(z) vs w in [0, pi]");
xlabel("w");
ylabel("magnitude of H in db");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

phase = atan2(imag(H), real(H));
phase = phase*180/pi;

subplot(4, 2, 4);
plot(w, phase);
title("(c)-2 phase response of H(z) vs w in [0, pi]");
xlabel("w");
ylabel("phase of H in degree");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

%% (d)
z = [1, 1, -1, -1]; % coefficient of z^(-1) on nominator
k = 0.09;
[sos] = zp2sos(z, p, k);

%% (e)
% from sos: 
% H1 = (0.09*z^2+0.18*z+0.09)/(z^2-0.2*z+0.02);
% H2 = (z^2-2*z+1)/(z^2-0.6*z+0.25);

z = tf("z");
b1 = [0.09, 0.18, 0.09];
a1 = [1, -0.2, 0.02]; 
b2=[1, -2, 1];
a2=[1, -0.6, 0.25];
[H1, w1] = freqz(b1, a1, K);
[H2, w2] = freqz(b2, a2, K);

subplot(4, 2, 5);
plot(w1, 20*log10(abs(H1)));
title("(e)-1 magnitude of H1(z) vs w in [0, pi]");
xlabel("w");
ylabel("magnitude of H1 (db)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

subplot(4, 2, 6);
plot(w2, 20*log10(abs(H2)));
title("(e)-2 magnitude of H2(z) vs w in [0, pi]");
xlabel("w");
ylabel("magnitude of H2 (db)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

subplot(4, 2, 7);
plot(w1, 20*log10(abs(H1).*abs(H2)));
title("(e)-3 magnitude of H1(z)*H2(z) vs w in [0, pi]");
xlabel("w");
ylabel("magnitude of H1*H2 (db)");
xticks([0, pi/4, pi/2, 3*pi/4, pi]);
xticklabels({"0", "\pi/4", "\pi/2", "3\pi/4", "\pi"});

%% (f)
x = zeros(1, 21);
x(1) = 1;
y = filter(b, a, x);

subplot(4, 2, 8);
stem(n, y);
title("(f) y[n] vs n");
xlabel("n");
ylabel("y[n]");
