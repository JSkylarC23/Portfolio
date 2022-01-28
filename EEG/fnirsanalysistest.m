clc;
clear all;
close all;

load = importdata('E:\BCIs\Final\G2P1FinalSortedFull.mat');

oxyfNIRS=load(2:9,:);
deOxy = load(10:17,:);
data=oxyfNIRS;
FS=500;
Time=1:length(data);
Oxy1=data(1,1:end);
Oxy2=data(2,1:end);
Oxy3=data(3,1:end);
Oxy4=data(4,1:end);
Oxy5=data(5,1:end);
Oxy6=data(6,1:end);
Oxy7=data(7,1:end);
Oxy8=data(8,1:end);
Oxy=[Oxy1;Oxy2;Oxy3;Oxy4;Oxy5;Oxy6;Oxy7;Oxy8];

DeOxy1=deOxy(1,1:end);
DeOxy2=deOxy(2,1:end);
DeOxy3=deOxy(3,1:end);
DeOxy4=deOxy(4,1:end);
DeOxy5=deOxy(5,1:end);
DeOxy6=deOxy(6,1:end);
DeOxy7=deOxy(7,1:end);
DeOxy8=deOxy(8,1:end);
DeOxy=[DeOxy1;DeOxy2;DeOxy3;DeOxy4;DeOxy5;DeOxy6;DeOxy7;DeOxy8];

%{
Total1=data(1:end,2)+data(1:end,3);
Total2=data(1:end,4)+data(1:end,5);
Total3=data(1:end,6)+data(1:end,7);
Total4=data(1:end,8)+data(1:end,9);
Total5=data(1:end,10)+data(1:end,11);
Total6=data(1:end,12)+data(1:end,13);
Total7=data(1:end,14)+data(1:end,15);
Total8=data(1:end,16)+data(1:end,17);
%}


% This below function will extract the Average, RMS, Skewness, and kurtosis for input HBO or HBR concentrations
epoch = 1;
all = round(length(Oxy)/100);

avg = zeros(8,all);
rms = zeros(8,all);
sk = zeros(8,all);
ku = zeros(8,all);


while epoch < all && (epoch*100+100) < length(Oxy)
    for i=1:8f
        [avg(i,epoch), rms(i,epoch), sk(i,epoch), ku(i,epoch)] = parameters(Oxy(i,epoch*100:(epoch*100+100)));
    end
    epoch = epoch + 1;
end
featuresOxy=[avg(1:8,:) ; rms(1:8,:) ; sk(1:8,:) ; ku(1:8,:)];

%{
featuresOxy=[avg(1,:) ; rms(1,:) ; sk(1,:) ; ku(1,:)
    avg(2,:) ; rms(2,:) ; sk(2,:) ; ku(2,:)
    avg(3,:) ; rms(3,:) ; sk(3,:) ; ku(3,:)
    avg(4,:) ; rms(4,:) ; sk(4,:) ; ku(4,:)
    avg(5,:) ; rms(5,:) ; sk(5,:) ; ku(5,:)
    avg(6,:) ; rms(6,:) ; sk(6,:) ; ku(6,:)
    avg(7,:) ; rms(7,:) ; sk(7,:) ; ku(7,:)
    avg(8,:) ; rms(8,:) ; sk(8,:) ; ku(8,:)];
%}

epoch = 1;

while epoch < all && (epoch*100+100) < length(deOxy)
    for i=1:8
        [avg(i,epoch), rms(i,epoch), sk(i,epoch), ku(i,epoch)] = parameters(deOxy(i,epoch*100:(epoch*100+100)));
    end
    epoch = epoch + 1;
end

featuresDeOxy=[avg(1:8,:) ; rms(1:8,:) ; sk(1:8,:) ; ku(1:8,:)];

%{
featuresDeOxy=[avg(1,:) ; rms(1,:) ; sk(1,:) ; ku(1,:)
    avg(2,:) ; rms(2,:) ; sk(2,:) ; ku(2,:)
    avg(3,:) ; rms(3,:) ; sk(3,:) ; ku(3,:)
    avg(4,:) ; rms(4,:) ; sk(4,:) ; ku(4,:)
    avg(5,:) ; rms(5,:) ; sk(5,:) ; ku(5,:)
    avg(6,:) ; rms(6,:) ; sk(6,:) ; ku(6,:)
    avg(7,:) ; rms(7,:) ; sk(7,:) ; ku(7,:)
    avg(8,:) ; rms(8,:) ; sk(8,:) ; ku(8,:)];
%}
