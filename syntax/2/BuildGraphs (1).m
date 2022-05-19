function x = BuildGraphs(k)

x = (0.01:0.01:10);

data = k.*log(x);

plot(x, data, LineWidth=2);



sz = size(k);
legend_text = cell(sz(1), 1);

for l=1:sz(1)
text = sprintf('%.2flnx ', k(l));
legend_text{l, 1} = text;
end


legend(legend_text, 'FontSize', 10, 'Position', [0.86 0.7 0.1 0.2]); %легенда

grid on %сетка

title("Логарифмы-Логарифмики"); %название

xlim([5.01,7]) %масштаб
ylim([-5,5])

xlabel('X') %оси
ylabel('Y')

end