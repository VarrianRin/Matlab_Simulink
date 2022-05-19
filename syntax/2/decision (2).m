function Answer = decision(A, B, C)

function discrs = discriminant(A, B, C)
        discrs = B .^ 2 - A.*C * 4;
end

sz = size(A);
D = discriminant(A, B, C);

for k=1:1:sz(1)

    if (A(k, 1) == 0 && B(k, 1) == 0 & C(k, 1) ~= 0)
        Answer(k) = "Уравнение не имеет решений";

    elseif (A(k, 1) == 0 && B(k, 1) == 0 & C(k, 1) == 0)
        Answer(k) = "Решение уравнения выражается в действительных числах";

    elseif ((A(k, 1) == 0 && B(k, 1) ~= 0) | D(k) >= 0)
        Answer(k) = "Решение уравнения выражается в действительных числах";

    elseif (D(k) < 0)
        x1 = (-B(k, 1) + 1i*sqrt(-D(k))) / 2*A(k, 1);
        x2 = (-B(k, 1) - 1i*sqrt(-D(k))) / 2*A(k, 1);

        Answer(k) = sprintf("Решение уравнения: х1 = %.4f + %.4fi и х2 = %.4f  %.4fi", real(x1), imag(x1), real(x2), imag(x2));

    end

end

Answer = Answer(:);
Answer

end

