clc;
clear all;

%% в несколько строчек

Answer = (1:100);

Answer = Answer(:);


Answer = Answer(mod(Answer, 3) ~= 0);

Answer = Answer(mod(Answer, 4) == 0);


%% все в одну строчку

Answer = (1:100).';

Answer = Answer((mod(Answer, 4) == 0) & (mod(Answer, 3) ~= 0))