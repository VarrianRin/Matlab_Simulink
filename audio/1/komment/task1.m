clc;
clear all;
close all;

%% чтение

[x, fs] = audioread('file8.wav');
fs
x = x(:, 1);
N = length(x);
t = (0:N-1) / fs;

%% графики

spectrogram(x, [], [], [], fs, 'yaxis');
%plot(t, x);

%% фильтр
[b, a] = butter(4, [149, 151] / (fs/2), "bandpass");
harmonic1 = filter(b, a, signal);
[b, a] = butter(4, [249, 251] / (fs/2), "bandpass");
harmonic2 = filter(b, a, signal);
[b, a] = butter(4, [349, 351] / (fs/2), "bandpass");
harmonic3 = filter(b, a, signal);
[b, a] = butter(4, [0.2 0.95], 'bandpass');
xclean = harmonic1 + harmonic2 + harmonic3;

%plot(t, xclean);
spectrogram(xclean, [], [], [], fs, 'yaxis');

%% запись

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
% 2) 
% 3) 
% 4) 
