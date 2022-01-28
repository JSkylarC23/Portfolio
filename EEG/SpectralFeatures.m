
clc;
clear all;
close all;

load = importdata('C:\Users\P748U644\Desktop\Spring 2021\Brain Computer Interface\final project\BCIFinal\Final data\G2P1FinalSortedFull.mat');

oxyfNIRS=load(2:9,:);
deOxy = load(10:17,:);
data=oxyfNIRS;
EEG=load(18:33,:);
FS=500;
% idMatrix1=idMatrix2(:,1:42755); %task1
% idMatrix1=idMatrix2(:,42756:85510); %task2
% idMatrix1=idMatrix2(:,85511:128265); %task3
%  idMatrix1=idMatrix2(:,128266:171020); %task4
% idMatrix1=idMatrix2(:,171021:213775); %task5
% idMatrix1=idMatrix2(:,213776:256530); %task6
%idMatrix1=idMatrix2(:,256531:299285); %task7
 
% idMatrix1=idMatrix2(:,1:42755); %task1
% fNIRS=idMatrix1(1:16,:);
% EEG=idMatrix1(17:32,:);
y=EEG;
epoch = 1;
all = round(length(y)/100);
spectral_relative_power = zeros(16,all);
spectral_flatness = zeros(16,all);
spectral_entropy = zeros(16,all);


while epoch < all && (epoch*100+100) < length(y)
for i=1 
x=y(i,:);
spectral_relative_power(i,:)=spectral_features(x(i,epoch*100:(epoch*100+100)),500,'spectral_relative_power');
spectral_flatness(i,:)=spectral_features(x(i,epoch*100:(epoch*100+100)),500,'spectral_flatness');
spectral_entropy(i,:)=spectral_features(x(i,epoch*100:(epoch*100+100)),500,'spectral_entropy');
end
epoch = epoch + 1;
end
featurs=[spectral_relative_power ; spectral_flatness ; spectral_entropy];