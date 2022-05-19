clc;
clear all;
close all;

%% чтение

[myvoice, fs] = audioread('voice.wav');
myvoice = myvoice(:, 1);

%% графики

n = length(myvoice);
T = n / fs;
t = 0:1/fs:T;
f = 1 / T * (0 : floor(n / 2) - 1);

subplot(2, 2, 1), spectrogram(myvoice, [], [], [], fs, 'yaxis');
set(gca, 'YScale','log');
title('voice');

subplot(2, 2, 2), plot(f, abs(spectr(myvoice)));
xlabel("frequency , Hz");
ylabel("amplitude");
title("voice");
set(gca, 'XScale','log');

% 107hz - главная гармоника
% 218hz 
% 320hz
% 430hz
% 530hz
% 650hz
% 740hz
% 760hz
% 850hz
% 963hz
% 1080hz

%% фильтр

[b, a] = butter(3, [105, 109] / (fs/2), "bandpass");
harmonic1 = filter(b, a, myvoice) / 1;
[b, a] = butter(3, [216, 220] / (fs/2), "bandpass");
harmonic2 = filter(b, a, myvoice) / 2;
[b, a] = butter(3, [318, 322] / (fs/2), "bandpass");
harmonic3 = filter(b, a, myvoice) / 3;
[b, a] = butter(3, [428, 432] / (fs/2), "bandpass");
harmonic4 = filter(b, a, myvoice) / 4;
[b, a] = butter(3, [528, 532] / (fs/2), "bandpass");
harmonic5 = filter(b, a, myvoice) / 5;
[b, a] = butter(3, [648, 652] / (fs/2), "bandpass");
harmonic6 = filter(b, a, myvoice) / 6;
[b, a] = butter(3, [738, 742] / (fs/2), "bandpass");
harmonic7 = filter(b, a, myvoice) / 7;
[b, a] = butter(3, [758, 762] / (fs/2), "bandpass");
harmonic8 = filter(b, a, myvoice) / 8;
[b, a] = butter(3, [848, 852] / (fs/2), "bandpass");
harmonic9 = filter(b, a, myvoice) / 9;
[b, a] = butter(3, [961, 965] / (fs/2), "bandpass");
harmonic10 = filter(b, a, myvoice) / 10;
[b, a] = butter(3, [1078, 1082] / (fs/2), "bandpass");
harmonic11 = filter(b, a, myvoice) / 11;

filtered_voice = harmonic1 + harmonic2 + harmonic3 + harmonic4 + harmonic5 + harmonic6 + harmonic7 + harmonic8 + harmonic9 + harmonic10 + harmonic11;

subplot(2, 2, 3), spectrogram(filtered_voice, [], [], [], fs, 'yaxis');
set(gca, 'YScale','log');
title('filtered voice');

%% графики

subplot(2, 2, 4), plot(f, abs(spectr(filtered_voice)));
xlabel("frequency , Hz");
ylabel("amplitude");
title("filtered voice");
set(gca, 'XScale','log');

%% запись

max(abs(filtered_voice));
filtered_voice = filtered_voice ./ max(filtered_voice);
audiowrite('filtered_voice.wav', filtered_voice, fs);

%% 

function spectr = spectr (signal)
n = length(signal);
fourier = fft(signal) / n;
spectr = fourier(1 : floor(n / 2));
end


% Вопросы и замечания:
% 1) Судя по графику, максимум спектра приходится на 218 Гц, почему же ты
% считаешь основным тоном 107 Гц?
% 2) Записанный в файл отфильтрованный голос клиппируется и имеет очень
% низкую громкость. Нужно это исправить.

