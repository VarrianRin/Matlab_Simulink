function signal = sinus(f, T, fs, A)


fs;  %частота дискретизации
A;  %амплитуда
f; %частота синусоиды
T; %длительность 

t = 0:1/fs:T; %время

signal = A * sin(2*pi*f*t);

end