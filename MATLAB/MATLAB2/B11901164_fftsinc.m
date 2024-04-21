clear all; clc;
%% Part I

%% (a)

N = 1001;
T = 100;
N1 = (N-1) / 2;
Ts = T/N1;
n = -N1:N1;
t = -N1*Ts: Ts: N1*Ts;
x = sin(2*pi*t) ./ (2*pi*t);
x(N1+1) = 1;

figure(1);
plot(n, x);
title("x[n] vs n");
xlabel("n");
ylabel("x[n]");

%% (b)

X = fftshift(fft(x));
f = -pi:2*pi/(N-1):pi;

figure(2);
plot(f, abs(X));
title("magnitude of the fft output vs frequency omega");
xlabel("frequency omega");
ylabel("X");
xticks([-pi, -pi/2, 0, pi/2, pi]);
xticklabels({"-\pi", "-\pi/2", "0", "\pi/2", "\pi"});

%% (c)

Xk = zeros(1,N);
for k = -N1:N1
    Xk(k+N1+1) = sum(x .* exp(-1i*2*pi*n*k/N));
end

figure(3);
plot(f, abs(Xk));
title("the magnitude of Xk(e^(j*omega)) vs frequency omega");
xlabel("frequency omega");
ylabel("Xk");
xticks([-pi, -pi/2, 0, pi/2, pi]);
xticklabels({"-\pi", "-\pi/2", "0", "\pi/2", "\pi"});

%% Part II

%% (d)

Tw = T/2;
w = zeros(1,N);
for i = 1:N
    if(abs(n(i)*Ts) <= Tw/2)
        w(i) = 0.5*(1+cos(2*pi*abs(n(i)*Ts)/Tw));
    end
end

figure(4);
plot(n, w);
title("w[n] vs n");
xlabel("n");
ylabel("w[n]");

%% (e)

y = x.*w;

figure(5);
plot(n, y);
title("y[n] vs n");
xlabel("n");
ylabel("y[n]");

%% (f)

Y = fftshift(fft(y));
f = -pi:2*pi/(N-1):pi;

figure(6);
plot(f,abs(Y));
title("magnitude of the fft output vs frequency omega");
xlabel("frequency omega");
ylabel("Y");
xticks([-pi, -pi/2, 0, pi/2, pi]);
xticklabels({"-\pi", "-\pi/2", "0", "\pi/2", "\pi"});
