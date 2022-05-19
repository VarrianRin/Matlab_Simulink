clc;
clear all;
close all;

%% синусиода

fs = 2500;  %частота дискретизации
A = 30000;  %амплитуда
f_sin = 1000;   %частота синусоиды

T = 3; %длительность 
t = 0:1/fs:T; %время


signal = A * sin(2*pi*f_sin*t);
signal = int16(signal);

%% графики

n = length(signal);
f = 1 / T * (0 : floor(n / 2) - 1); %

subplot(2,2,1), plot(t, signal);
xlabel("time , s");
ylabel("amplitude");
title("sin");

subplot(2,2,2), plot (f , abs(spectr(signal)));
xlabel("frequency , Hz");
ylabel("amplitude");
title("sin");
%% запись

audiowrite('sin.wav', signal, fs);

%% клиппинг

cut = 20000;
clipped_signal = signal;
%plot(t, x);

clipped_signal(clipped_signal > cut) = cut;
clipped_signal(clipped_signal < -cut) = -cut;

audiowrite('clipped_sin.wav', signal, fs);

%% графики

subplot(2,2,3), plot(t, clipped_signal);
xlabel("time , s");
ylabel("amplitude");
title("clipped sin");

subplot(2,2,4), plot (f , abs(spectr(clipped_signal)));
xlabel("frequency , Hz");
ylabel("amplitude");
title("clipped sin");

function spectr = spectr (signal)
n = length(signal);
fourier = fft(signal) / n;
spectr = fourier(1 : floor(n / 2));
end
 
% Вопросы и замечания:
% 1) Почему задано такое значание амплитуды (строка 8)?
% 2) Зачем нужна строка 16?
% 3) Отсутствует анализ характеристик клиппированного сигнала.


% 1) чтобы реализовать клипинг задавал значения сигнала в int16 (так как по
% умолчанию сигнал double, клипируется при амплитуде > 1)
% 2) при таком задании амплитуда 3 - очень тихая, взял 30000
% 3) добавлено, при клиппинге появляется дополнительная частота 500 hz


