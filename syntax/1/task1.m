%% start main script

clc; % clear screen / clear command window
clear all; % clear ALL workspace / 

%% array of complex

Complex_data = rand(9, 1) + rand(9, 1)*1i;

%% abs and angle
   
AMP = abs(Complex_data)
Phase = angle(Complex_data)

%% sub

[val_max, idx_max] = max(AMP);
[val_min, idx_min] = min(AMP);

%{
старый код
Com_max = Complex_data(idx_max);
Com_min = Complex_data(idx_min);


Sub_complex = Com_max - Com_min
%}

Sub_complex = val_max - val_min
