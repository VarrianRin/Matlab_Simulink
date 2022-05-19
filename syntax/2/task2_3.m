clc;
clear all;
%%
A = [randi(5, 10, 1); 0]
B = [randi(10, 10, 1); 0]
C = [randi(5, 10, 1); -5]

Answer = decision(A, B, C);