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


%% спектры
f = linspace(0, fs, floor(length(x1_increase)/2));

x1_n = [abs(spectr(x1)); zeros(floor(n/2),1)];
xi_n = abs(spectr(x1_increase));
xd_n = [abs(spectr(x1_decrease)); zeros(3 * floor(n/4), 1)];

figure;
semilogy(f, [x1_n.'; xi_n.'; xd_n.']);
xlim([0,8000]) %масштаб
xlabel('Frequency hz')
legend('fs', '2fs', 'fs/2');

function spectr = spectr (signal)
n = length(signal);
fourier = fft(signal) / n;
spectr = fourier(1 : floor(n / 2));
spectr = spectr / PowerSignal(abs(spectr));
end

function P = PowerSignal(Signal)

P = mean(abs(Signal));

end

%plot(t, x_decrease);

% Вопросы и замечания:
% 1) Входной звук - стерео, а звуки с половинной и удвоенной частотой
% дискретизации, которые ты создаешь, - монофонические
% 2) Отсутствует анализ, который требовался при выполнении задачи


% 1) исправлено
% 2) при увеличении - увеличивается чистота звука, становится чуть громче и
% явнее, при уменьшении, как-будто играет из пещеры или эхом


% Дополнительные вопросы:
% 1) Почему звук с удвоенной частотой становится громче, а с половинной -
% тише?
% 2) Отобрази спектры всех трех сигнаорв на одном графике. Спектр нужно
% выводить до половины частоты дискретизации каждого сигнала, а общая шкала
% спектра - от 0 до 8 кГц. Предварительно нужно отнормировать сигналы по
% мощности: средняя мощность одного отсчета всех трех сигналов должна быть
% одинаковой (например, единичной).
