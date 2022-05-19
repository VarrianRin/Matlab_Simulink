clc;
clear all;
close all;

fs = 10000;  %частота дискретизации
A = 1;  %амплитуда
f = 1000; %частота синусоиды
T = 1; %длительность 

C_1 = 261.63;
D_1 = 293.66;
E_1 = 329.63;
F_1 = 349.23;
G_1 = 392;
A_1 = 440;
B_1 = 493.88;
C_2 = 523.25;


C_major = [sinus(C_1, T, fs, A) , sinus(D_1, T, fs, A), sinus(E_1, T, fs, A), sinus(F_1, T, fs, A), sinus(G_1, T, fs, A), sinus(A_1, T, fs, A), sinus(B_1, T, fs, A), sinus(C_2, T, fs, A)];

%plot(t, signal)

%% запись

audiowrite('C_major.wav', C_major, fs);