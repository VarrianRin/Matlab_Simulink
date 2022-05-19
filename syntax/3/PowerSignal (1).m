function P = PowerSignal(Signal)

P = mean(abs(Signal).^2);

end