clc;
clear all;
close all;

N = 128;
SNR = 37;

%% 1

t = (1:N);

SignalSpec = zeros(1,N);
SignalSpec(5) = 1;
SignalSpec(10) = 2;
SignalSpec(60) = 3;

%plot(SignalSpec)

Signal = ifft(SignalSpec);

plot(t, abs(Signal))
legend("Signal")
xlabel('Time');
ylabel('Amplitude');
grid on;

%% 2

NoisedSignal = NoiseGenerator(Signal, SNR);
Noise = NoisedSignal - Signal;
%% 3

P_Signal = PowerSignal(Signal);
P_Noise = PowerSignal(Noise);
P_NoisedSignal = PowerSignal(NoisedSignal);

%% 4

NoiseSpec = fft(Noise);
NoisedSignalSpec = fft(NoisedSignal);

P_SignalSpec = PowerSignal(SignalSpec);
P_NoiseSpec = PowerSignal(NoiseSpec);
P_NoisedSignalSpec = PowerSignal(NoisedSignalSpec);

if ((P_SignalSpec - N * P_Signal) < 0.1 * P_SignalSpec) && ((P_NoiseSpec - N * P_Noise) < 0.1 * P_NoiseSpec) && ((P_NoisedSignalSpec - N * P_NoisedSignal) < 0.1 * P_NoisedSignalSpec)

   sprintf("True")
else
   sprintf("False")
end

%% 5

FilteredNoisedSignal = FilterSignal(NoisedSignal);

%% 6

P_FilteredNoisedSignal = PowerSignal(FilteredNoisedSignal)
SNR_Fil = 10*log10(P_NoisedSignal / P_Noise)
SNR_Not = 10*log10(P_FilteredNoisedSignal / P_Noise)

%{ 
графики
plot(t, [abs(Noise); abs(Signal); abs(NoisedSignal); abs(FilteredNoisedSignal)])
legend("Noise", "Signal", "NoisedSignal", "FilteredNoisedSignal")
xlabel('Time');
ylabel('Amplitude');
grid on;
%}
