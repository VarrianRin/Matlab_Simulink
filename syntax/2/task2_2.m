clc;
clear all;
close all;
%% 
k=-2 + 4*rand(randi(10,1,1),1);
BuildGraphs(k);
print('-djpeg','-r300','Graphs.jpg');