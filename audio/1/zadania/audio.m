clc;
clear all;
close all;

%% чтение

[x, fs] = audioread('file8.wav');
fs
x = x(:, 1);
N = length(x);
t = (0:N-1) / fs;
%%
%plot(t, x);

plot(t, fft(x));

%spectrogram(x, [], [], [], fs, 'yaxis');
%%

W = hanning(N, 'periodic');

periodogram(x, W, N, fs, 'power');  

%%
histogram(x)


%% фильтр

[b, a] = butter(4, [0.2 0.95], 'bandpass');
xclean = filter(b, a, x);

%plot(t, xclean);
plot(t, fft(xclean));
%spectrogram(xclean, [], [], [], fs, 'yaxis');


%% запись

audiowrite('file8_filtered.wav', xclean, fs);


%%
a = [1 2 3 4 4 5 6];

a=a(mod(a, 2)==0)