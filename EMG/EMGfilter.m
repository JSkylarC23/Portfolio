clear all;clc;

load ('myo9classTest1no1RawWTrigger.mat');

data = myo9classTest1no1RawWTrigger(2:9,:);

fs = 200;
Ts = 1/fs;
t = 0:Ts:(length(data)-1)*Ts;

freq = linspace(0,100,length(data)/2);

yfft = zeros(8,length(data));
for i = 1:8
    yfft(i,:) = abs(fftshift(fft(data(i,:))));
end

figure(1);
for i = 1:8
    subplot(8,1,i);
    plot(t,data(i,:));
    ylabel(num2str(i));
end
sgtitle('Raw');

figure(2);
for i = 1:8
    subplot(8,1,i);
    plot(freq,yfft(i,(length(yfft)/2)+1:end));
    ylabel(num2str(i));
end
sgtitle('Frequency');

%filter out 60Hz
d = designfilt('bandstopiir','FilterOrder',30,'HalfPowerFrequency1',59,'HalfPowerFrequency2',61,'DesignMethod','butter','SampleRate',fs);
%fvtool(d,'Fs',fs);

dataFilt = zeros(8,length(data));
for i = 1:8
    dataFilt(i,:) = filtfilt(d,data(i,:));
end

figure(3);
for i = 1:8
    subplot(8,1,i);
    plot(t,dataFilt(i,:));
    ylabel(num2str(i));
end
sgtitle('Raw filtered out 60 Hz');

yfftFilt = zeros(8,length(dataFilt));
for i = 1:8
    yfftFilt(i,:) = abs(fftshift(fft(dataFilt(i,:))));
end

figure(4);
for i = 1:8
    subplot(8,1,i);
    plot(freq,yfftFilt(i,(length(yfftFilt)/2)+1:end));
    ylabel(num2str(i));
end
sgtitle('Frequency filtered out 60 Hz');

%filter out -15 Hz and +45Hz
dpass = designfilt('bandpassiir','FilterOrder',30,'HalfPowerFrequency1',15,'HalfPowerFrequency2',45,'DesignMethod','butter','SampleRate',fs);
%fvtool(dpass,'Fs',fs);

dataFiltpass = zeros(8,length(data));
for i = 1:8
    dataFiltpass(i,:) = filtfilt(dpass,data(i,:));
end

figure(5);
for i = 1:8
    subplot(8,1,i);
    plot(t,dataFiltpass(i,:));
    ylabel(num2str(i));
end
sgtitle('Raw filtered 15 - 45 Hz');

yfftFiltpass = zeros(8,length(data));
for i = 1:8
    yfftFiltpass(i,:) = abs(fftshift(fft(dataFiltpass(i,:))));
end

figure(6);
for i = 1:8
    subplot(8,1,i);
    plot(freq,yfftFiltpass(i,(length(yfftFiltpass)/2)+1:end));
    ylabel(num2str(i));
end
sgtitle('Frequency filtered 15 - 45 Hz');

