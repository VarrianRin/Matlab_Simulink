function NoisedSignal = NoiseGenerator(Signal, SNR)

N = size(Signal, 2)
SNR = SNR + 1.5;
MS_real = sqrt(mean(real(Signal).^2));
MS_imag = sqrt(mean(imag(Signal).^2));

MN_imag = MS_imag / (10^(SNR/20));
MN_real = MS_real / (10^(SNR/20));

Noise = normrnd(MN_real, MN_real/2, 1, N) + 1i*normrnd(MN_imag, MN_imag/2, 1, N);

%P_Noise = PowerSignal(Noise)

%10*log10(PowerSignal(Signal) / P_Noise)
NoisedSignal = Noise + Signal;

end