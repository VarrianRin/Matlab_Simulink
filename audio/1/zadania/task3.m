clc;
clear all;
close all;

%% чтение

[x, fs] = audioread('task3.wav');

x1 = x(:, 1);  % 1 канал
x2 = x(:, 2);  % 2 канал
n = length(x1);
t = (0:n-1) / fs;
%   plot(t, x);

W_n = hanning(n, "periodic");
subplot(3, 1, 1), periodogram(x1, W_n, n, fs, "power");
title("fs = " + fs);

%% уменьшение

x1_decrease = x1(1:2:length(x1));
x2_decrease = x2(1:2:length(x2));

%plot(t, x_decrease);

audiowrite('task3_decrease.wav', [x1_decrease; x2_decrease], floor(fs / 2));

W_d = hanning(length(x1_decrease), "periodic");
subplot(3, 1, 2), periodogram(x1_decrease, W_d, length(x1_decrease), floor(fs / 2), "power");
title("fs = " + floor(fs / 2));

%% увеличение

x1_increase = zeros(2 * length(x1) - 1, 1);
x2_increase = zeros(2 * length(x2) - 1, 1);

for i = 2:length(x1_increase)
    if mod(i, 2) == 0
        x1_increase(i - 1) = x1(i / 2);
        x2_increase(i - 1) = x2(i / 2);
    else
        x1_increase(i - 1) = (x1((i + 1) / 2) + x1((i - 1) / 2)) / 2;
        x2_increase(i - 1) = (x2((i + 1) / 2) + x2((i - 1) / 2)) / 2;
    end
end
x1_increase(length(x1_increase)) = x1(length(x1));
x2_increase(length(x2_increase)) = x2(length(x2));

audiowrite('task3_increase.wav',  [x1_increase; x2_increase], fs*2);

W_i = hanning(length(x1_increase), "periodic");
subplot(3, 1, 3), periodogram(x1_increase, W_i, length(x1_increase), fs * 2, "power");
title("fs = " + fs * 2);

%plot(t, x_decrease);

% Вопросы и замечания:
% 1) Входной звук - стерео, а звуки с половинной и удвоенной частотой
% дискретизации, которые ты создаешь, - монофонические
% 2) Отсутствует анализ, который требовался при выполнении задачи


% 1) исправлено
% 2) при увеличении - увеличивается чистота звука, становится чуть громче и
% явнее, при уменьшении, как-будто играет из пещеры или эхом


