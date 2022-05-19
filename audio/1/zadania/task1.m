clc;
clear all;
close all;

%% чтение

[x, fs] = audioread('file8.wav');
fs;
x = x(:, 1);
N = length(x);
t = (0:N-1) / fs;
f = fs / N * (0 : floor(N / 2) - 1);

%% графики

subplot(1, 2, 1), spectrogram(x, [], [], [], fs, 'yaxis');
%plot(t, x);


% 1 harmonic = 250 khz
% 2 harmonic = 600 khz
% 3 harmonic = 900 khz

%% фильтр
[b, a] = butter(4, [249, 251] / (fs/2), "bandpass");
harmonic1 = filter(b, a, x);
[b, a] = butter(4, [599, 601] / (fs/2), "bandpass");
harmonic2 = filter(b, a, x);
[b, a] = butter(4, [899, 901] / (fs/2), "bandpass");
harmonic3 = filter(b, a, x);

xclean = harmonic1 + harmonic2 + harmonic3;

%plot(t, xclean);
subplot(1, 2, 2), spectrogram(xclean, [], [], [], fs, 'yaxis');

subplot(2, 2, 3), plot(f, abs(spectr(harmonic1)));
xlabel("frequency , Hz");
ylabel("amplitude");
title("filtered voice");
set(gca, 'XScale','log');

%% запись
max(xclean)
xclean = xclean ./ max(xclean);
audiowrite('file8_filtered.wav', xclean, fs);

% Вопросы и замечания:
% 1) Что делается в строке 9?
% 2) Из каких соображений выбран фильтр и его параметры?
% 3) Обрати внимание на предупреждение при записи файла - он записывается
% неправильно.
% 4) Задача практически не выполнена: частоты гармоник не определены,
% поэтому непонятно, решает ли выполненная фильтрация вторую часть
% поставленной задачи.

% 1) на случай многоканальной записи, отрезаю только первый канал
% 2) такой же фильтр использовался на лекции, параметры гармоник выбраны по
% спектрограме
% 3) исправил
% 4) определил, звук после фильтрации стал гораздо чище

function spectr = spectr (signal)
n = length(signal);
fourier = fft(signal) / n;
spectr = fourier(1 : floor(n / 2));
end
