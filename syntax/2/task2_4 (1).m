clc;
clear all;
close all;
%%

syms x y z(x, y) z1(x, y) z2(x, y)

z(x, y) = y*(x^2) + 2*x*y - sin(x + y);


z1(x, y) = gradient(z, x)

z2(x, y) = gradient(z1, y)

%z2(1, 3)
value = double(z2(1, 3))

fsurf(z2(x, y), [-5, 5])

xlabel("X")
ylabel("Y")