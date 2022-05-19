clear all;
clc;

textfile = "Textvar2.txt";
text = importdata(textfile);
TextSize = text_size(text)

text = lower(text);

Probability = {{'б', amount(text, 'б') / TextSize}, 
               {'д', amount(text, 'д') / TextSize},
               {'о', amount(text, 'о') / TextSize},
               {'щ', amount(text, 'щ') / TextSize},};




[val_max, idx_max] = max([Probability{1, 1}{1, 2}, Probability{2, 1}{1, 2}, Probability{3, 1}{1, 2}, Probability{4, 1}{1, 2}]);
[val_min, idx_min] = min([Probability{1, 1}{1, 2}, Probability{2, 1}{1, 2}, Probability{3, 1}{1, 2}, Probability{4, 1}{1, 2}]);

Answer_1 = {Probability{idx_max, 1}{1, 1}, val_max}
Answer_2 = {Probability{idx_min, 1}{1, 1}, val_min}



%% доп
Probability_ALL = {{'а', amount(text, 'а') / TextSize},
                   {'б', amount(text, 'б') / TextSize}, 
                   {'в', amount(text, 'в') / TextSize},
                   {'г', amount(text, 'г') / TextSize}, 
                   {'д', amount(text, 'д') / TextSize},
                   {'е', amount(text, 'е') / TextSize},
                   {'ё', amount(text, 'ё') / TextSize},
                   {'ж', amount(text, 'ж') / TextSize},
                   {'з', amount(text, 'з') / TextSize},
                   {'и', amount(text, 'и') / TextSize},
                   {'й', amount(text, 'й') / TextSize},
                   {'к', amount(text, 'к') / TextSize},
                   {'л', amount(text, 'л') / TextSize},
                   {'м', amount(text, 'м') / TextSize},
                   {'н', amount(text, 'н') / TextSize},
                   {'о', amount(text, 'о') / TextSize},
                   {'п', amount(text, 'п') / TextSize},
                   {'р', amount(text, 'р') / TextSize},
                   {'с', amount(text, 'с') / TextSize},
                   {'т', amount(text, 'т') / TextSize},
                   {'у', amount(text, 'у') / TextSize},
                   {'ф', amount(text, 'ф') / TextSize},
                   {'х', amount(text, 'х') / TextSize},
                   {'ц', amount(text, 'ц') / TextSize},
                   {'ч', amount(text, 'ч') / TextSize},
                   {'ш', amount(text, 'ш') / TextSize},
                   {'щ', amount(text, 'щ') / TextSize},
                   {'ъ', amount(text, 'ъ') / TextSize},
                   {'ы', amount(text, 'ы') / TextSize},
                   {'ь', amount(text, 'ь') / TextSize},
                   {'э', amount(text, 'э') / TextSize},
                   {'ю', amount(text, 'ю') / TextSize},
                   {'я', amount(text, 'я') / TextSize}};

%{
for k=1:size(Probability, 1)
    sprintf("Вероятность встречи буквы %s равна %.4f", Probability{k, 1}{1, 1}, Probability{k, 1}{1, 2})
end
%}
val_max = 0;
val_min = 1;

for k=1:size(Probability_ALL, 1)
    if Probability_ALL{k, 1}{1, 2} > val_max
        val_max = Probability_ALL{k, 1}{1, 2};
        idx_max = k;
    end
    if  (Probability_ALL{k, 1}{1, 2} < val_min) && (Probability_ALL{k, 1}{1, 2} ~= 0)
        val_min = Probability_ALL{k, 1}{1, 2};
        idx_min = k;
    end

end
Answer_1_2 = {Probability_ALL{idx_max, 1}{1, 1}, val_max}
Answer_1_2 = {Probability_ALL{idx_min, 1}{1, 1}, val_min}

%%
function x = text_size(text)

x = 0;

for k=1:(size(text, 1) - 1)
    x = x + strlength(text{k, 1}) + 2; %+2 за каждый /r/n
end
    x = x + strlength(text{size(text,1), 1}); %так как в последней строчки нет переноса
end

function x = amount(text, letter)

    x = 0;

    for k=1:size(text)
        sz = size(text{k, 1});
        
        for i=1:sz(2)
            text{k, 1}(i);

            if letter == text{k, 1}(i)
                x = x + 1;
            end
        end
    end
end    