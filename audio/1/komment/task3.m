clc;
clear all;
close all;

%% чтение

[x, fs] = audioread('task3.wav');


x1 = x(:, 1);  % 1 канал
x2 = x(:, 2);  % 2 канал
N = length(x1);
t = (0:N-1) / fs;
%   plot(t, x);

%% уменьшение

x1_decrease = x1(1:2:length(x1));
x2_decrease = x2(1:2:length(x2));

%plot(t, x_decrease);

audiowrite('task3_decrease.wav', [x1_decrease; x2_decrease], fs/2);


%% увеличение

x1_increase = zeros(1, 2 * length(x1));
x2_increase = zeros(1, 2 * length(x2));

for i = 2:length(x1_increase)
    if mod(i, 2) == 0
        x1_increase(i - 1) = x1(i / 2);
        x2_increase(i - 1) = x2(i / 2);
    else
        x1_increase(i - 1) = (x1((i + 1) / 2) + x1((i - 1) / 2)) / 2;
        x2_increase(i - 1) = (x2((i + 1) / 2) + x2((i - 1) / 2)) / 2;
    end
end

audiowrite('task3_increase.wav',  [x1_increase; x2_increase], fs*2);

%plot(t, x_decrease);

% Вопросы и замечания:
% 1) Входной звук - стерео, а звуки с половинной и удвоенной частотой
% дискретизации, которые ты создаешь, - монофонические
% 2) Отсутствует анализ, который требовался при выполнении задачи


% 1) исправлено
% 2) 


