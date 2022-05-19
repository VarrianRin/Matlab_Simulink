function Filtered = FilterSignal(Signal)

Signal = fft(Signal);

Signal(:, 15:55)  = zeros;
Filtered = ifft(Signal);
end