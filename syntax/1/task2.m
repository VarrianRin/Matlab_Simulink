%% 1 реализация 

clc;
clear all;
rows = 35;
cols = 35;
A = zeros(rows, cols);
rng(2);
B = randi(25, rows, cols);
C = zeros (rows, cols);

tic

%на диагонали матрицы А 1...35
for m=1:cols

 A(m,m)= m;
end

%у матрицы В начиная с 13 строчки и 25 столбца логарифмы чисел
for m=13:rows 
 for n=25:cols
 B(m,n)=log(B(m,n));
end
end

%теперь 2 в степени элементов В
for m=1:rows
 for n=1:cols
 B(m,n)=2^(B(m,n));
 end
end

%C = A + B
for m=1:rows
 for n=1:cols
 C(m,n)=A(m,n)+B(m,n);
 end
end

toc



%% 2 реализация

rows = 35;
cols = 35;
new_A = zeros(rows, cols);

tic
%на диагонали матрицы А стоят 1...cols
for m=1:cols

 new_A(m,m)= m;
end

rng(2);
new_B = randi(25, rows, cols);

new_B = [(ones(12, 35) * 2) .^ new_B(1:12,:); (ones(23, 24) * 2) .^ new_B(13:35,1:24), (ones(23, 11) * 2) .^ (log(new_B(13:35,25:35)))];
new_C = new_A + new_B;

toc

%% Сравнене матриц

if new_C == C
    sprintf("Массивы совпали")
else
    sprintf("Массивы не совпали")
end






