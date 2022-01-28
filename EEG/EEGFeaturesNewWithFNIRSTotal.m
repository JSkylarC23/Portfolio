clc;
clear all;
close all;

loadTime = importdata('F:\BCIs\Final\G2P2Final.mat');
load = importdata('F:\BCIs\Final\G2P2FinalSortedFull.mat');
%targetMatrix = importdata('F:\BCIs\Final\EEGFeaturesTargetMatrix.xlsx');
targetMatrix = xlsread('F:\BCIs\Final\EEGFeaturesTargetMatrix.xlsx');

dataOxy = load(2:9,:);
dataDeOxy = load(10:17,:);
dataFNIRSTotal = dataOxy + dataDeOxy;
data=load(18:33,:);

%bandpass filter imported data
time = loadTime(1,1:length(load));
sampleRate = 1/(time(2) - time(1));
FS=1/sampleRate;%/500;
lowEnd = 13;
highEnd = 30;
filterOrder = 4; %how does this affect the outcome?
[b,a] = butter(filterOrder, [lowEnd highEnd]/(sampleRate/2));

dataS = zeros(16,length(data));

for i = 1:16
    dataS(i,:) = filtfilt(b, a, data(i,:));
end

%dataS = [dataS ; load(35,41)];

%{
%frequency domain
constant = 1.6;
f = constant*(0:FS:(length(dataS/2)));
testFFT = fft(data1); % Left 1
ptestFFT = abs(testFFT');
%}


%{
t = 0:FS:time(length(ptestFFT));
tdur = seconds(t);
xt = timetable(tdur',ptestFFT); %dataS(1,:)
[se, te] =  pentropy(xt);
[setest, tetest] =  pentropy(dataS(1,:),500); %,500?
[seRaw, teRaw] =  pentropy(dataS(1,:),FS);

[se1, te1] =  pentropy(dataS(1,:),t');
[se2, te2] =  pentropy(dataS(2,:),500);
[se3, te3] =  pentropy(dataS(3,:),FS);
[se4, te4] =  pentropy(dataS(4,:),FS);
[se5, te5] =  pentropy(dataS(5,:),FS);
[se6, te6] =  pentropy(dataS(6,:),FS);
[se7, te7] =  pentropy(dataS(7,:),FS);
[se8, te8] =  pentropy(dataS(8,:),FS);
[se9, te9] =  pentropy(dataS(9,:),FS);
[se10, te10] =  pentropy(dataS(10,:),FS);
[se11, te11] =  pentropy(dataS(11,:),FS);
[se12, te12] =  pentropy(dataS(12,:),FS);
[se13, te13] =  pentropy(dataS(13,:),FS);
[se14, te14] =  pentropy(dataS(14,:),FS);
[se15, te15] =  pentropy(dataS(15,:),FS);
[se16, te16] =  pentropy(dataS(16,:),FS);

seS = [se1' ; se2' ; se3' ; se4' ; se5' ; se6' ; se7' ; se8' ; se9' ; se10' ; se11' ; se12' ; se13' ; se14' ; se15' ; se16'];
%}


ta = 0:FS*100:time(length(dataS));

fingerOne = zeros(16,round(length(ta)/7));
fingerTwo = zeros(16,round(length(ta)/7));
fingerThree = zeros(16,round(length(ta)/7));
fingerFour = zeros(16,round(length(ta)/7));
fingerFive = zeros(16,round(length(ta)/7));
fingerSix = zeros(16,round(length(ta)/7));
fingerSeven = zeros(16,round(length(ta)/7));

for  c = 1:length(dataS)
    if load(35,c) == 1
        fingerOne = [fingerOne dataS(:,c)];
    end
    if load(36,c) == 1
        fingerTwo = [fingerTwo dataS(:,c)];
    end
    if load(37,c) == 1
        fingerThree = [fingerThree dataS(:,c)];
    end
    if load(38,c) == 1
        fingerFour = [fingerFour dataS(:,c)];
    end
    if load(39,c) == 1
        fingerFive = [fingerFive dataS(:,c)];
    end
    if load(40,c) == 1
        fingerSix = [fingerSix dataS(:,c)];
    end
    if load(41,c) == 1
        fingerSeven = [fingerSeven dataS(:,c)];
    end
end

fingerOnefNIRS = zeros(8,round(length(ta)/7));
fingerTwofNIRS = zeros(8,round(length(ta)/7));
fingerThreefNIRS = zeros(8,round(length(ta)/7));
fingerFourfNIRS = zeros(8,round(length(ta)/7));
fingerFivefNIRS = zeros(8,round(length(ta)/7));
fingerSixfNIRS = zeros(8,round(length(ta)/7));
fingerSevenfNIRS = zeros(8,round(length(ta)/7));

for  c = 1:length(dataFNIRSTotal)
    if load(35,c) == 1
        fingerOnefNIRS = [fingerOnefNIRS dataFNIRSTotal(:,c)];
    end
    if load(36,c) == 1
        fingerTwofNIRS = [fingerTwofNIRS dataFNIRSTotal(:,c)];
    end
    if load(37,c) == 1
        fingerThreefNIRS = [fingerThreefNIRS dataFNIRSTotal(:,c)];
    end
    if load(38,c) == 1
        fingerFourfNIRS = [fingerFourfNIRS dataFNIRSTotal(:,c)];
    end
    if load(39,c) == 1
        fingerFivefNIRS = [fingerFivefNIRS dataFNIRSTotal(:,c)];
    end
    if load(40,c) == 1
        fingerSixfNIRS = [fingerSixfNIRS dataFNIRSTotal(:,c)];
    end
    if load(41,c) == 1
        fingerSevenfNIRS = [fingerSevenfNIRS dataFNIRSTotal(:,c)];
    end
end

epoch = 1;
all = round(length(fingerOne)/100);

array = zeros(1,100);

seOne = zeros(16,all);
teOne = zeros(16,all);
seTwo= zeros(16,all);
teTwo = zeros(16,all);
seThree = zeros(16,all);
teThree = zeros(16,all);
seFour = zeros(16,all);
teFour = zeros(16,all);
seFive = zeros(16,all);
teFive = zeros(16,all);
seSix = zeros(16,all);
teSix = zeros(16,all);
seSeven = zeros(16,all);
teSeven = zeros(16,all);

spfOne = zeros(16,all);
spfTwo = zeros(16,all);
spfThree = zeros(16,all);
spfFour = zeros(16,all);
spfFive = zeros(16,all);
spfSix = zeros(16,all);
spfSeven = zeros(16,all);

psdOne = zeros(16,all);
psdTwo = zeros(16,all);
psdThree = zeros(16,all);
psdFour = zeros(16,all);
psdFive = zeros(16,all);
psdSix = zeros(16,all);
psdSeven = zeros(16,all);

avgOne = zeros(8,all);
rmsOne = zeros(8,all);
skOne = zeros(8,all);
kuOne = zeros(8,all);
avgTwo = zeros(8,all);
rmsTwo = zeros(8,all);
skTwo = zeros(8,all);
kuTwo = zeros(8,all);
avgThree = zeros(8,all);
rmsThree = zeros(8,all);
skThree = zeros(8,all);
kuThree = zeros(8,all);
avgFour = zeros(8,all);
rmsFour = zeros(8,all);
skFour = zeros(8,all);
kuFour = zeros(8,all);
avgFive = zeros(8,all);
rmsFive = zeros(8,all);
skFive = zeros(8,all);
kuFive = zeros(8,all);
avgSix = zeros(8,all);
rmsSix = zeros(8,all);
skSix = zeros(8,all);
kuSix = zeros(8,all);
avgSeven = zeros(8,all);
rmsSeven = zeros(8,all);
skSeven = zeros(8,all);
kuSeven = zeros(8,all);

%finger 1
while epoch < all && (epoch*100+100) < length(fingerOne)
    for i=1:16
        array = fingerOne(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seOne(i,epoch) = mean(sea);
        teOne(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfOne(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdOne(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerOnefNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgOne(i,epoch), rmsOne(i,epoch), skOne(i,epoch), kuOne(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 2
while epoch < all && (epoch*100+100) < length(fingerTwo)
    for i=1:16
        array = fingerTwo(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seTwo(i,epoch) = mean(sea);
        teTwo(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfTwo(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdTwo(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerTwofNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgTwo(i,epoch), rmsTwo(i,epoch), skTwo(i,epoch), kuTwo(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 3
while epoch < all && (epoch*100+100) < length(fingerThree)
    for i=1:16
        array = fingerThree(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seThree(i,epoch) = mean(sea);
        teThree(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfThree(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdThree(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerThreefNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgThree(i,epoch), rmsThree(i,epoch), skThree(i,epoch), kuThree(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 4
while epoch < all && (epoch*100+100) < length(fingerFour)
    for i=1:16
        array = fingerFour(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seFour(i,epoch) = mean(sea);
        teFour(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfFour(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdFour(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerFourfNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgFour(i,epoch), rmsFour(i,epoch), skFour(i,epoch), kuFour(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 5
while epoch < all && (epoch*100+100) < length(fingerFive)
    for i=1:16
        array = fingerFive(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seFive(i,epoch) = mean(sea);
        teFive(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfFive(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdFive(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerFivefNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgFive(i,epoch), rmsFive(i,epoch), skFive(i,epoch), kuFive(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 6
while epoch < all && (epoch*100+100) < length(fingerSix)
    for i=1:16
        array = fingerSix(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seSix(i,epoch) = mean(sea);
        teSix(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfSix(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdSix(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerSixfNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgSix(i,epoch), rmsSix(i,epoch), skSix(i,epoch), kuSix(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end
epoch = 1;

%finger 7
while epoch < all && (epoch*100+100) < length(fingerSeven)
    for i=1:16
        array = fingerSeven(i,epoch*100:(epoch*100+100)-1);
        
        %Spectral entropy
        [sea, tea] =  pentropy(array,100);
        seSeven(i,epoch) = mean(sea);
        teSeven(i,epoch) = mean(tea);
        
        %Spectral flatness
        pxx = periodogram(array);
        num=geomean(pxx);
        den=mean(pxx);
        spfSeven(i,epoch) = num/den ;
        
        %Power Spectral Density
        Pxx = pwelch(array);
        psdSeven(i,epoch) = mean(Pxx);
        
        if i < 9
        %fNIRS Features
        arrayfNIRS = fingerSevenfNIRS(i,epoch*100:(epoch*100+100)-1);
        [avgSeven(i,epoch), rmsSeven(i,epoch), skSeven(i,epoch), kuSeven(i,epoch)] = parameters(arrayfNIRS);
        end
    end
    epoch = epoch + 1;
end

dataSpectralEntropy = [seOne(:,5:430) seTwo(:,5:430) seThree(:,5:430) seFour(:,5:430) seFive(:,5:430) seSix(:,5:430) seSeven(:,5:430)];
dataSpectralFlatness = [spfOne(:,5:430) spfTwo(:,5:430) spfThree(:,5:430) spfFour(:,5:430) spfFive(:,5:430) spfSix(:,5:430) spfSeven(:,5:430)];
dataPSD = [psdOne(:,5:430) psdTwo(:,5:430) psdThree(:,5:430) psdFour(:,5:430) psdFive(:,5:430) psdSix(:,5:430) psdSeven(:,5:430)];
dataAvg = [avgOne(:,5:430) avgTwo(:,5:430) avgThree(:,5:430) avgFour(:,5:430) avgFive(:,5:430) avgSix(:,5:430) avgSeven(:,5:430)];
dataRms = [rmsOne(:,5:430) rmsTwo(:,5:430) rmsThree(:,5:430) rmsFour(:,5:430) rmsFive(:,5:430) rmsSix(:,5:430) rmsSeven(:,5:430)];
dataSk = [skOne(:,5:430) skTwo(:,5:430) skThree(:,5:430) skFour(:,5:430) skFive(:,5:430) skSix(:,5:430) skSeven(:,5:430)];
dataKu = [kuOne(:,5:430) kuTwo(:,5:430) kuThree(:,5:430) kuFour(:,5:430) kuFive(:,5:430) kuSix(:,5:430) kuSeven(:,5:430)];

eegFeatures = [dataSpectralEntropy ; dataSpectralFlatness ; dataPSD];
fNIRSFeatures = [dataAvg ; dataRms ; dataSk ; dataKu];
fullMatrix = [fNIRSFeatures ; eegFeatures];

%{
for i = 1:7
    for j = 1:7
        
        targetMatrix(i,(j-1)*426:(j-1)*426+426) = 1;
    end
end

eegFeatures = [dataNew ; targetMatrix] ; 
%}

%{
%plot 16 channels
figure(1);
subplot(4,4,1); % Channel 1
plot(ta(1:length(ta)-2),seRawTest(1,1:length(seRawTest)-2));
title('C1');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,2); % Channel 2
plot(ta(1:length(ta)-2),seRawTest(2,1:length(seRawTest)-2));
title('C2');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,3); % Channel 3
plot(ta(1:length(ta)-2),seRawTest(3,1:length(seRawTest)-2));
title('C3');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,4); % Channel 4
plot(ta(1:length(ta)-2),seRawTest(4,1:length(seRawTest)-2));
title('C4');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,5); % Channel 5
plot(ta(1:length(ta)-2),seRawTest(5,1:length(seRawTest)-2));
title('C5');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,6); % Channel 6
plot(ta(1:length(ta)-2),seRawTest(6,1:length(seRawTest)-2));
title('C6');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,7); % Channel 7
plot(ta(1:length(ta)-2),seRawTest(7,1:length(seRawTest)-2));
title('C7');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,8); % Channel 8
plot(ta(1:length(ta)-2),seRawTest(8,1:length(seRawTest)-2));
title('C8');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,9); % Channel 9
plot(ta(1:length(ta)-2),seRawTest(9,1:length(seRawTest)-2));
title('C9');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,10); % Channel 10
plot(ta(1:length(ta)-2),seRawTest(10,1:length(seRawTest)-2));
title('C10');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,11); % Channel 11
plot(ta(1:length(ta)-2),seRawTest(11,1:length(seRawTest)-2));
title('C11');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,12); % Channel 12
plot(ta(1:length(ta)-2),seRawTest(12,1:length(seRawTest)-2));
title('C12');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,13); % Channel 13
plot(ta(1:length(ta)-2),seRawTest(13,1:length(seRawTest)-2));
title('C13');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,14); % Channel 14
plot(ta(1:length(ta)-2),seRawTest(14,1:length(seRawTest)-2));
title('C14');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,15); % Channel 15
plot(ta(1:length(ta)-2),seRawTest(15,1:length(seRawTest)-2));
title('C15');
xlabel('time');
ylabel('Spectral Entropy');
subplot(4,4,16); % Channel 16
plot(ta(1:length(ta)-2),seRawTest(16,1:length(seRawTest)-2));
title('C16');
xlabel('time');
ylabel('Spectral Entropy');
%}

