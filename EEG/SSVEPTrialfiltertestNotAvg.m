clc
clear all
close all

data = importdata('F:\BCIs\Trial1Group2.mat');
start = zeros(12,1);
data = data(1:12,1500:end);
data = [start data];

%bandpass filter imported data
time = data(1,2:end);
sampleRate = 1/(time(2) - time(1));
lowEnd = 4;
highEnd = 30;
filterOrder = 4; %how does this affect the outcome?
[b,a] = butter(filterOrder, [lowEnd highEnd]/(sampleRate/2));
data1 = filtfilt(b, a, data(2,:));
data2 = filtfilt(b, a, data(3,:));
data3 = filtfilt(b, a, data(4,:));
data4 = filtfilt(b, a, data(5,:));
data5 = filtfilt(b, a, data(6,:));
data6 = filtfilt(b, a, data(7,:));
data7 = filtfilt(b, a, data(8,:));
data8 = filtfilt(b, a, data(9,:));
data9 = filtfilt(b, a, data(10,:));
data10 = filtfilt(b, a, data(11,:));

dataS = [data1; data2; data3; data4; data5; data6; data7; data8; data9; data10];

left = zeros(13,0); right = zeros(13,0); up = zeros(13,0); down = zeros(13,0); in = zeros(13,0); out = zeros(13,0); stop = zeros(13,0);

countLeft = 0; countRight = 0; countUp = 0; countDown = 0; countIn = 0; countOut = 0; countStop = 0;

%Separate directions
for c = 1:length(data1)
    if data(12,c) == 108 % left
        if data(12,c-1) ~= 108
            countLeft = countLeft + 1;
        end
        left = [left(1,:) data(1,c); left(2:11,:) dataS(:,c); left(12,:) countLeft];
    end
    if data(12,c) == 114 % right
        if data(12,c-1) ~= 114
            countRight = countRight + 1;
        end
        right = [right(1,:) data(1,c); right(2:11,:) dataS(:,c); right(12,:) countRight];
    end
    if data(12,c) == 117 % Up
        if data(12,c-1) ~= 117
            countUp = countUp + 1;
        end
        up = [up(1,:) data(1,c); up(2:11,:) dataS(:,c); up(12,:) countUp];
    end
    if data(12,c) == 100 % Down
        if data(12,c-1) ~= 100
            countDown = countDown + 1;
        end
        down = [down(1,:) data(1,c); down(2:11,:) dataS(:,c); down(12,:) countDown];
    end
    if data(12,c) == 105 % In
        if data(12,c-1) ~= 105
            countIn = countIn + 1;
        end
        in = [in(1,:) data(1,c); in(2:11,:) dataS(:,c); in(12,:) countIn];
    end
    if data(12,c) == 111 % Out
        if data(12,c-1) ~= 111
            countOut = countOut + 1;
        end
        out = [out(1,:) data(1,c); out(2:11,:) dataS(:,c); out(12,:) countOut];
    end
    if data(12,c) == 115 % Stop
        if data(12,c-1) ~= 115
            countStop = countStop + 1;
        end
        stop = [stop(1,:) data(1,c); stop(2:11,:) dataS(:,c); stop(12,:) countStop];
    end
end

%separate counts

% Left
leftOne = zeros(10,0); leftTwo = zeros(10,0); leftThree = zeros(10,0); leftFour = zeros(10,0); leftFive = zeros(10,0);
for  c = 1:length(left)
    if left(12,c) == 1
        leftOne = [leftOne left(2:11,c)];
    end
    if left(12,c) == 2
        leftTwo = [leftTwo left(2:11,c)];
    end
    if left(12,c) == 3
        leftThree = [leftThree left(2:11,c)];
    end
    if left(12,c) == 4
        leftFour = [leftFour left(2:11,c)];
    end
    if left(12,c) == 5
        leftFive = [leftFive left(2:11,c)];
    end
end

% Right
rightOne = zeros(10,0); rightTwo = zeros(10,0); rightThree = zeros(10,0); rightFour = zeros(10,0); rightFive = zeros(10,0);
for  c = 1:length(right)
    if right(12,c) == 1
        rightOne = [rightOne right(2:11,c)];
    end
    if right(12,c) == 2
        rightTwo = [rightTwo right(2:11,c)];
    end
    if right(12,c) == 3
        rightThree = [rightThree right(2:11,c)];
    end
    if right(12,c) == 4
        rightFour = [rightFour right(2:11,c)];
    end
    if right(12,c) == 5
        rightFive = [rightFive right(2:11,c)];
    end
end

% Up
upOne = zeros(10,0); upTwo = zeros(10,0); upThree = zeros(10,0); upFour = zeros(10,0); upFive = zeros(10,0);
for  c = 1:length(up)
    if up(12,c) == 1
        upOne = [upOne up(2:11,c)];
    end
    if up(12,c) == 2
        upTwo = [upTwo up(2:11,c)];
    end
    if up(12,c) == 3
        upThree = [upThree up(2:11,c)];
    end
    if up(12,c) == 4
        upFour = [upFour up(2:11,c)];
    end
    if up(12,c) == 5
        upFive = [upFive up(2:11,c)];
    end
end

% Down
downOne = zeros(10,0); downTwo = zeros(10,0); downThree = zeros(10,0); downFour = zeros(10,0); downFive = zeros(10,0);
for  c = 1:length(down)
    if down(12,c) == 1
        downOne = [downOne down(2:11,c)];
    end
    if down(12,c) == 2
        downTwo = [downTwo down(2:11,c)];
    end
    if down(12,c) == 3
        downThree = [downThree down(2:11,c)];
    end
    if down(12,c) == 4
        downFour = [downFour down(2:11,c)];
    end
    if down(12,c) == 5
        downFive = [downFive down(2:11,c)];
    end
end

% In
inOne = zeros(10,0); inTwo = zeros(10,0); inThree = zeros(10,0); inFour = zeros(10,0); inFive = zeros(10,0);
for  c = 1:length(in)
    if in(12,c) == 1
        inOne = [inOne in(2:11,c)];
    end
    if in(12,c) == 2
        inTwo = [inTwo in(2:11,c)];
    end
    if in(12,c) == 3
        inThree = [inThree in(2:11,c)];
    end
    if in(12,c) == 4
        inFour = [inFour in(2:11,c)];
    end
    if in(12,c) == 5
        inFive = [inFive in(2:11,c)];
    end
end

% Out
outOne = zeros(10,0); outTwo = zeros(10,0); outThree = zeros(10,0); outFour = zeros(10,0); outFive = zeros(10,0);
for  c = 1:length(out)
    if out(12,c) == 1
        outOne = [outOne out(2:11,c)];
    end
    if out(12,c) == 2
        outTwo = [outTwo out(2:11,c)];
    end
    if out(12,c) == 3
        outThree = [outThree out(2:11,c)];
    end
    if out(12,c) == 4
        outFour = [outFour out(2:11,c)];
    end
    if out(12,c) == 5
        outFive = [outFive out(2:11,c)];
    end
end

% Stop
stopOne = zeros(10,0); stopTwo = zeros(10,0); stopThree = zeros(10,0); stopFour = zeros(10,0); stopFive = zeros(10,0);
for  c = 1:length(stop)
    if stop(12,c) == 1
        stopOne = [stopOne stop(2:11,c)];
    end
    if stop(12,c) == 2
        stopTwo = [stopTwo stop(2:11,c)];
    end
    if stop(12,c) == 3
        stopThree = [stopThree stop(2:11,c)];
    end
    if stop(12,c) == 4
        stopFour = [stopFour stop(2:11,c)];
    end
    if stop(12,c) == 5
        stopFive = [stopFive stop(2:11,c)];
    end
end

%more processing before frequency domain
%DWT, PSD, SNR, MinE
%{
Pyy=leftFFT.*conj(leftFFT)/512; % Power Spectral Density
pwelch(X) - returns power spectral density estimate
[Pxx,F] = pwelch(X,WINDOW,NOVERLAP,NFFT,Fs)
Find minimum energy
SNR
%}

% To f-domain
%L = length(leftOne);
constant = 1.6; % not sure where this comes from
f = constant*(0:(sampleRate/2));

% Left

maxAvgLeft = zeros(0);

%Channel 1
leftFFTOneC1 = fft(leftOne(1,:), 512); % Left 1
pLeftOneC1 = abs(leftFFTOneC1);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC1);
xMaxLeftOneC1 = f(indexMaxLeftOne); % (1) for first instance
maxAvgLeft = [maxAvgLeft xMaxLeftOneC1];

leftFFTTwoC1 = fft(leftTwo(1,:), 512); % Left 2
pLeftTwoC1 = abs(leftFFTTwoC1);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC1);
xMaxLeftTwoC1 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC1];

leftFFTThreeC1 = fft(leftThree(1,:), 512); % Left 3
pLeftThreeC1 = abs(leftFFTThreeC1);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC1);
xMaxLeftThreeC1 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC1];

leftFFTFourC1 = fft(leftFour(1,:), 512); % Left 4
pLeftFourC1 = abs(leftFFTFourC1);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC1);
xMaxLeftFourC1 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC1];

leftFFTFiveC1 = fft(leftFive(1,:), 512); % Left 5
pLeftFiveC1 = abs(leftFFTFiveC1);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC1);
xMaxLeftFiveC1 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC1];

%Channel 2
leftFFTOneC2 = fft(leftOne(2,:), 512); % Left 1
pLeftOneC2 = abs(leftFFTOneC2);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC2);
xMaxLeftOneC2 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC2];

leftFFTTwoC2 = fft(leftTwo(2,:), 512); % Left 2
pLeftTwoC2 = abs(leftFFTTwoC2);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC2);
xMaxLeftTwoC2 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC2];

leftFFTThreeC2 = fft(leftThree(2,:), 512); % Left 3
pLeftThreeC2 = abs(leftFFTThreeC2);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC2);
xMaxLeftThreeC2 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC2];

leftFFTFourC2 = fft(leftFour(2,:), 512); % Left 4
pLeftFourC2 = abs(leftFFTFourC2);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC2);
xMaxLeftFourC2 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC2];

leftFFTFiveC2 = fft(leftFive(2,:), 512); % Left 5
pLeftFiveC2 = abs(leftFFTFiveC2);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC2);
xMaxLeftFiveC2 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC2];

%Channel 3
leftFFTOneC3 = fft(leftOne(3,:), 512); % Left 1
pLeftOneC3 = abs(leftFFTOneC3);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC3);
xMaxLeftOneC3 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC3];

leftFFTTwoC3 = fft(leftTwo(3,:), 512); % Left 2
pLeftTwoC3 = abs(leftFFTTwoC3);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC3);
xMaxLeftTwoC3 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC3];

leftFFTThreeC3 = fft(leftThree(3,:), 512); % Left 3
pLeftThreeC3 = abs(leftFFTThreeC3);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC3);
xMaxLeftThreeC3 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC3];

leftFFTFourC3 = fft(leftFour(3,:), 512); % Left 4
pLeftFourC3 = abs(leftFFTFourC3);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC3);
xMaxLeftFourC3 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC3];

leftFFTFiveC3 = fft(leftFive(3,:), 512); % Left 5
pLeftFiveC3 = abs(leftFFTFiveC3);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC3);
xMaxLeftFiveC3 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC3];

%Channel 4
leftFFTOneC4 = fft(leftOne(4,:), 512); % Left 1
pLeftOneC4 = abs(leftFFTOneC4);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC4);
xMaxLeftOneC4 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC4];

leftFFTTwoC4 = fft(leftTwo(4,:), 512); % Left 2
pLeftTwoC4 = abs(leftFFTTwoC4);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC4);
xMaxLeftTwoC4 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC4];

leftFFTThreeC4 = fft(leftThree(4,:), 512); % Left 3
pLeftThreeC4 = abs(leftFFTThreeC4);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC4);
xMaxLeftThreeC4 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC4];

leftFFTFourC4 = fft(leftFour(4,:), 512); % Left 4
pLeftFourC4 = abs(leftFFTFourC4);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC4);
xMaxLeftFourC4 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC4];

leftFFTFiveC4 = fft(leftFive(4,:), 512); % Left 5
pLeftFiveC4 = abs(leftFFTFiveC4);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC4);
xMaxLeftFiveC4 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC4];

%Channel 5
leftFFTOneC5 = fft(leftOne(5,:), 512); % Left 1
pLeftOneC5 = abs(leftFFTOneC5);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC5);
xMaxLeftOneC5 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC5];

leftFFTTwoC5 = fft(leftTwo(5,:), 512); % Left 2
pLeftTwoC5 = abs(leftFFTTwoC5);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC5);
xMaxLeftTwoC5 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC5];

leftFFTThreeC5 = fft(leftThree(5,:), 512); % Left 3
pLeftThreeC5 = abs(leftFFTThreeC5);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC5);
xMaxLeftThreeC5 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC5];

leftFFTFourC5 = fft(leftFour(5,:), 512); % Left 4
pLeftFourC5 = abs(leftFFTFourC5);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC5);
xMaxLeftFourC5 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC5];

leftFFTFiveC5 = fft(leftFive(5,:), 512); % Left 5
pLeftFiveC5 = abs(leftFFTFiveC5);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC5);
xMaxLeftFiveC5 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC5];

%Channel 6
leftFFTOneC6 = fft(leftOne(6,:), 512); % Left 1
pLeftOneC6 = abs(leftFFTOneC6);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC6);
xMaxLeftOneC6 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC6];

leftFFTTwoC6 = fft(leftTwo(6,:), 512); % Left 2
pLeftTwoC6 = abs(leftFFTTwoC6);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC6);
xMaxLeftTwoC6 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC6];

leftFFTThreeC6 = fft(leftThree(6,:), 512); % Left 3
pLeftThreeC6 = abs(leftFFTThreeC6);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC6);
xMaxLeftThreeC6 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC6];

leftFFTFourC6 = fft(leftFour(6,:), 512); % Left 4
pLeftFourC6 = abs(leftFFTFourC6);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC6);
xMaxLeftFourC6 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC6];

leftFFTFiveC6 = fft(leftFive(6,:), 512); % Left 5
pLeftFiveC6 = abs(leftFFTFiveC6);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC6);
xMaxLeftFiveC6 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC6];

%Channel 7
leftFFTOneC7 = fft(leftOne(7,:), 512); % Left 1
pLeftOneC7 = abs(leftFFTOneC7);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC7);
xMaxLeftOneC7 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC7];

leftFFTTwoC7 = fft(leftTwo(7,:), 512); % Left 2
pLeftTwoC7 = abs(leftFFTTwoC7);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC7);
xMaxLeftTwoC7 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC7];

leftFFTThreeC7 = fft(leftThree(7,:), 512); % Left 3
pLeftThreeC7 = abs(leftFFTThreeC7);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC7);
xMaxLeftThreeC7 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC7];

leftFFTFourC7 = fft(leftFour(7,:), 512); % Left 4
pLeftFourC7 = abs(leftFFTFourC7);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC7);
xMaxLeftFourC7 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC7];

leftFFTFiveC7 = fft(leftFive(7,:), 512); % Left 5
pLeftFiveC7 = abs(leftFFTFiveC7);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC7);
xMaxLeftFiveC7 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC7];

%Channel 8
leftFFTOneC8 = fft(leftOne(8,:), 512); % Left 1
pLeftOneC8 = abs(leftFFTOneC8);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC8);
xMaxLeftOneC8 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC8];

leftFFTTwoC8 = fft(leftTwo(8,:), 512); % Left 2
pLeftTwoC8 = abs(leftFFTTwoC8);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC8);
xMaxLeftTwoC8 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC8];

leftFFTThreeC8 = fft(leftThree(8,:), 512); % Left 3
pLeftThreeC8 = abs(leftFFTThreeC8);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC8);
xMaxLeftThreeC8 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC8];

leftFFTFourC8 = fft(leftFour(8,:), 512); % Left 4
pLeftFourC8 = abs(leftFFTFourC8);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC8);
xMaxLeftFourC8 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC8];

leftFFTFiveC8 = fft(leftFive(8,:), 512); % Left 5
pLeftFiveC8 = abs(leftFFTFiveC8);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC8);
xMaxLeftFiveC8 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC8];

%Channel 9
leftFFTOneC9 = fft(leftOne(9,:), 512); % Left 1
pLeftOneC9 = abs(leftFFTOneC9);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC9);
xMaxLeftOneC9 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC9];

leftFFTTwoC9 = fft(leftTwo(9,:), 512); % Left 2
pLeftTwoC9 = abs(leftFFTTwoC9);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC9);
xMaxLeftTwoC9 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC9];

leftFFTThreeC9 = fft(leftThree(9,:), 512); % Left 3
pLeftThreeC9 = abs(leftFFTThreeC9);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC9);
xMaxLeftThreeC9 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC9];

leftFFTFourC9 = fft(leftFour(9,:), 512); % Left 4
pLeftFourC9 = abs(leftFFTFourC9);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC9);
xMaxLeftFourC9 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC9];

leftFFTFiveC9 = fft(leftFive(9,:), 512); % Left 5
pLeftFiveC9 = abs(leftFFTFiveC9);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC9);
xMaxLeftFiveC9 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC9];

%Channel 10
leftFFTOneC10 = fft(leftOne(10,:), 512); % Left 1
pLeftOneC10 = abs(leftFFTOneC10);
[maxLeftOne, indexMaxLeftOne] = max(pLeftOneC10);
xMaxLeftOneC10 = f(indexMaxLeftOne);
maxAvgLeft = [maxAvgLeft xMaxLeftOneC10];

leftFFTTwoC10 = fft(leftTwo(10,:), 512); % Left 2
pLeftTwoC10 = abs(leftFFTTwoC10);
[maxLeftTwo, indexMaxLeftTwo] = max(pLeftTwoC10);
xMaxLeftTwoC10 = f(indexMaxLeftTwo);
maxAvgLeft = [maxAvgLeft xMaxLeftTwoC10];

leftFFTThreeC10 = fft(leftThree(10,:), 512); % Left 3
pLeftThreeC10 = abs(leftFFTThreeC10);
[maxLeftThree, indexMaxLeftThree] = max(pLeftThreeC10);
xMaxLeftThreeC10 = f(indexMaxLeftThree);
maxAvgLeft = [maxAvgLeft xMaxLeftThreeC10];

leftFFTFourC10 = fft(leftFour(10,:), 512); % Left 4
pLeftFourC10 = abs(leftFFTFourC10);
[maxLeftFour, indexMaxLeftFour] = max(pLeftFourC10);
xMaxLeftFourC10 = f(indexMaxLeftFour);
maxAvgLeft = [maxAvgLeft xMaxLeftFourC10];

leftFFTFiveC10 = fft(leftFive(10,:), 512); % Left 5
pLeftFiveC10 = abs(leftFFTFiveC10);
[maxLeftFive, indexMaxLeftFive] = max(pLeftFiveC10);
xMaxLeftFiveC10 = f(indexMaxLeftFive);
maxAvgLeft = [maxAvgLeft xMaxLeftFiveC10];

meanMaxLeft = mean(nonzeros(maxAvgLeft));
leftAvgFreq = sprintf('Avg frequency Left = %.3f' , meanMaxLeft);
disp(leftAvgFreq);

% Right

maxAvgRight = zeros(0);

%Channel 1
rightFFTOneC1 = fft(rightOne(1,:), 512); % Left 1
pRightOneC1 = abs(rightFFTOneC1);
[maxRightOne, indexMaxRightOne] = max(pRightOneC1);
xMaxRightOneC1 = f(indexMaxRightOne); % (1) for first instance
maxAvgRight = [maxAvgRight xMaxRightOneC1];

rightFFTTwoC1 = fft(rightTwo(1,:), 512); % Left 2
pRightTwoC1 = abs(rightFFTTwoC1);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC1);
xMaxRightTwoC1 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC1];

rightFFTThreeC1 = fft(rightThree(1,:), 512); % Left 3
pRightThreeC1 = abs(rightFFTThreeC1);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC1);
xMaxRightThreeC1 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC1];

rightFFTFourC1 = fft(rightFour(1,:), 512); % Left 4
pRightFourC1 = abs(rightFFTFourC1);
[maxRightFour, indexMaxRightFour] = max(pRightFourC1);
xMaxRightFourC1 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC1];

rightFFTFiveC1 = fft(rightFive(1,:), 512); % Left 5
pRightFiveC1 = abs(rightFFTFiveC1);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC1);
xMaxRightFiveC1 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC1];

%Channel 2
rightFFTOneC2 = fft(rightOne(2,:), 512); % Left 1
pRightOneC2 = abs(rightFFTOneC2);
[maxRightOne, indexMaxRightOne] = max(pRightOneC2);
xMaxRightOneC2 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC2];

rightFFTTwoC2 = fft(rightTwo(2,:), 512); % Left 2
pRightTwoC2 = abs(rightFFTTwoC2);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC2);
xMaxRightTwoC2 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC2];

rightFFTThreeC2 = fft(rightThree(2,:), 512); % Left 3
pRightThreeC2 = abs(rightFFTThreeC2);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC2);
xMaxRightThreeC2 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC2];

rightFFTFourC2 = fft(rightFour(2,:), 512); % Left 4
pRightFourC2 = abs(rightFFTFourC2);
[maxRightFour, indexMaxRightFour] = max(pRightFourC2);
xMaxRightFourC2 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC2];

rightFFTFiveC2 = fft(rightFive(2,:), 512); % Left 5
pRightFiveC2 = abs(rightFFTFiveC2);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC2);
xMaxRightFiveC2 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC2];

%Channel 3
rightFFTOneC3 = fft(rightOne(3,:), 512); % Left 1
pRightOneC3 = abs(rightFFTOneC3);
[maxRightOne, indexMaxRightOne] = max(pRightOneC3);
xMaxRightOneC3 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC3];

rightFFTTwoC3 = fft(rightTwo(3,:), 512); % Left 2
pRightTwoC3 = abs(rightFFTTwoC3);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC3);
xMaxRightTwoC3 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC3];

rightFFTThreeC3 = fft(rightThree(3,:), 512); % Left 3
pRightThreeC3 = abs(rightFFTThreeC3);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC3);
xMaxRightThreeC3 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC3];

rightFFTFourC3 = fft(rightFour(3,:), 512); % Left 4
pRightFourC3 = abs(rightFFTFourC3);
[maxRightFour, indexMaxRightFour] = max(pRightFourC3);
xMaxRightFourC3 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC3];

rightFFTFiveC3 = fft(rightFive(3,:), 512); % Left 5
pRightFiveC3 = abs(rightFFTFiveC3);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC3);
xMaxRightFiveC3 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC3];

%Channel 4
rightFFTOneC4 = fft(rightOne(4,:), 512); % Left 1
pRightOneC4 = abs(rightFFTOneC4);
[maxRightOne, indexMaxRightOne] = max(pRightOneC4);
xMaxRightOneC4 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC4];

rightFFTTwoC4 = fft(rightTwo(4,:), 512); % Left 2
pRightTwoC4 = abs(rightFFTTwoC4);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC4);
xMaxRightTwoC4 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC4];

rightFFTThreeC4 = fft(rightThree(4,:), 512); % Left 3
pRightThreeC4 = abs(rightFFTThreeC4);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC4);
xMaxRightThreeC4 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC4];

rightFFTFourC4 = fft(rightFour(4,:), 512); % Left 4
pRightFourC4 = abs(rightFFTFourC4);
[maxRightFour, indexMaxRightFour] = max(pRightFourC4);
xMaxRightFourC4 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC4];

rightFFTFiveC4 = fft(rightFive(4,:), 512); % Left 5
pRightFiveC4 = abs(rightFFTFiveC4);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC4);
xMaxRightFiveC4 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC4];

%Channel 5
rightFFTOneC5 = fft(rightOne(5,:), 512); % Left 1
pRightOneC5 = abs(rightFFTOneC5);
[maxRightOne, indexMaxRightOne] = max(pRightOneC5);
xMaxRightOneC5 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC5];

rightFFTTwoC5 = fft(rightTwo(5,:), 512); % Left 2
pRightTwoC5 = abs(rightFFTTwoC5);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC5);
xMaxRightTwoC5 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC5];

rightFFTThreeC5 = fft(rightThree(5,:), 512); % Left 3
pRightThreeC5 = abs(rightFFTThreeC5);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC5);
xMaxRightThreeC5 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC5];

rightFFTFourC5 = fft(rightFour(5,:), 512); % Left 4
pRightFourC5 = abs(rightFFTFourC5);
[maxRightFour, indexMaxRightFour] = max(pRightFourC5);
xMaxRightFourC5 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC5];

rightFFTFiveC5 = fft(rightFive(5,:), 512); % Left 5
pRightFiveC5 = abs(rightFFTFiveC5);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC5);
xMaxRightFiveC5 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC5];

%Channel 6
rightFFTOneC6 = fft(rightOne(6,:), 512); % Left 1
pRightOneC6 = abs(rightFFTOneC6);
[maxRightOne, indexMaxRightOne] = max(pRightOneC6);
xMaxRightOneC6 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC6];

rightFFTTwoC6 = fft(rightTwo(6,:), 512); % Left 2
pRightTwoC6 = abs(rightFFTTwoC6);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC6);
xMaxRightTwoC6 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC6];

rightFFTThreeC6 = fft(rightThree(6,:), 512); % Left 3
pRightThreeC6 = abs(rightFFTThreeC6);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC6);
xMaxRightThreeC6 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC6];

rightFFTFourC6 = fft(rightFour(6,:), 512); % Left 4
pRightFourC6 = abs(rightFFTFourC6);
[maxRightFour, indexMaxRightFour] = max(pRightFourC6);
xMaxRightFourC6 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC6];

rightFFTFiveC6 = fft(rightFive(6,:), 512); % Left 5
pRightFiveC6 = abs(rightFFTFiveC6);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC6);
xMaxRightFiveC6 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC6];

%Channel 7
rightFFTOneC7 = fft(rightOne(7,:), 512); % Left 1
pRightOneC7 = abs(rightFFTOneC7);
[maxRightOne, indexMaxRightOne] = max(pRightOneC7);
xMaxRightOneC7 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC7];

rightFFTTwoC7 = fft(rightTwo(7,:), 512); % Left 2
pRightTwoC7 = abs(rightFFTTwoC7);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC7);
xMaxRightTwoC7 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC7];

rightFFTThreeC7 = fft(rightThree(7,:), 512); % Left 3
pRightThreeC7 = abs(rightFFTThreeC7);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC7);
xMaxRightThreeC7 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC7];

rightFFTFourC7 = fft(rightFour(7,:), 512); % Left 4
pRightFourC7 = abs(rightFFTFourC7);
[maxRightFour, indexMaxRightFour] = max(pRightFourC7);
xMaxRightFourC7 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC7];

rightFFTFiveC7 = fft(rightFive(7,:), 512); % Left 5
pRightFiveC7 = abs(rightFFTFiveC7);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC7);
xMaxRightFiveC7 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC7];

%Channel 8
rightFFTOneC8 = fft(rightOne(8,:), 512); % Left 1
pRightOneC8 = abs(rightFFTOneC8);
[maxRightOne, indexMaxRightOne] = max(pRightOneC8);
xMaxRightOneC8 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC8];

rightFFTTwoC8 = fft(rightTwo(8,:), 512); % Left 2
pRightTwoC8 = abs(rightFFTTwoC8);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC8);
xMaxRightTwoC8 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC8];

rightFFTThreeC8 = fft(rightThree(8,:), 512); % Left 3
pRightThreeC8 = abs(rightFFTThreeC8);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC8);
xMaxRightThreeC8 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC8];

rightFFTFourC8 = fft(rightFour(8,:), 512); % Left 4
pRightFourC8 = abs(rightFFTFourC8);
[maxRightFour, indexMaxRightFour] = max(pRightFourC8);
xMaxRightFourC8 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC8];

rightFFTFiveC8 = fft(rightFive(8,:), 512); % Left 5
pRightFiveC8 = abs(rightFFTFiveC8);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC8);
xMaxRightFiveC8 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC8];

%Channel 9
rightFFTOneC9 = fft(rightOne(9,:), 512); % Left 1
pRightOneC9 = abs(rightFFTOneC9);
[maxRightOne, indexMaxRightOne] = max(pRightOneC9);
xMaxRightOneC9 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC9];

rightFFTTwoC9 = fft(rightTwo(9,:), 512); % Left 2
pRightTwoC9 = abs(rightFFTTwoC9);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC9);
xMaxRightTwoC9 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC9];

rightFFTThreeC9 = fft(rightThree(9,:), 512); % Left 3
pRightThreeC9 = abs(rightFFTThreeC9);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC9);
xMaxRightThreeC9 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC9];

rightFFTFourC9 = fft(rightFour(9,:), 512); % Left 4
pRightFourC9 = abs(rightFFTFourC9);
[maxRightFour, indexMaxRightFour] = max(pRightFourC9);
xMaxRightFourC9 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC9];

rightFFTFiveC9 = fft(rightFive(9,:), 512); % Left 5
pRightFiveC9 = abs(rightFFTFiveC9);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC9);
xMaxRightFiveC9 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC9];

%Channel 10
rightFFTOneC10 = fft(rightOne(10,:), 512); % Left 1
pRightOneC10 = abs(rightFFTOneC10);
[maxRightOne, indexMaxRightOne] = max(pRightOneC10);
xMaxRightOneC10 = f(indexMaxRightOne);
maxAvgRight = [maxAvgRight xMaxRightOneC10];

rightFFTTwoC10 = fft(rightTwo(10,:), 512); % Left 2
pRightTwoC10 = abs(rightFFTTwoC10);
[maxRightTwo, indexMaxRightTwo] = max(pRightTwoC10);
xMaxRightTwoC10 = f(indexMaxRightTwo);
maxAvgRight = [maxAvgRight xMaxRightTwoC10];

rightFFTThreeC10 = fft(rightThree(10,:), 512); % Left 3
pRightThreeC10 = abs(rightFFTThreeC10);
[maxRightThree, indexMaxRightThree] = max(pRightThreeC10);
xMaxRightThreeC10 = f(indexMaxRightThree);
maxAvgRight = [maxAvgRight xMaxRightThreeC10];

rightFFTFourC10 = fft(rightFour(10,:), 512); % Left 4
pRightFourC10 = abs(rightFFTFourC10);
[maxRightFour, indexMaxRightFour] = max(pRightFourC10);
xMaxRightFourC10 = f(indexMaxRightFour);
maxAvgRight = [maxAvgRight xMaxRightFourC10];

rightFFTFiveC10 = fft(rightFive(10,:), 512); % Left 5
pRightFiveC10 = abs(rightFFTFiveC10);
[maxRightFive, indexMaxRightFive] = max(pRightFiveC10);
xMaxRightFiveC10 = f(indexMaxRightFive);
maxAvgRight = [maxAvgRight xMaxRightFiveC10];

meanMaxRight = mean(nonzeros(maxAvgRight));
rightAvgFreq = sprintf('Avg frequency Right = %.3f' , meanMaxRight);
disp(rightAvgFreq);

% Up

maxAvgUp = zeros(0);

%Channel 1
upFFTOneC1 = fft(upOne(1,:), 512); % Up 1
pUpOneC1 = abs(upFFTOneC1);
[maxUpOne, indexMaxUpOne] = max(pUpOneC1);
xMaxUpOneC1 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC1];

upFFTTwoC1 = fft(upTwo(1,:), 512); % Up 2
pUpTwoC1 = abs(upFFTTwoC1);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC1);
xMaxUpTwoC1 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC1];

upFFTThreeC1 = fft(upThree(1,:), 512); % Up 3
pUpThreeC1 = abs(upFFTThreeC1);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC1);
xMaxUpThreeC1 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC1];

upFFTFourC1 = fft(upFour(1,:), 512); % Up 4
pUpFourC1 = abs(upFFTFourC1);
[maxUpFour, indexMaxUpFour] = max(pUpFourC1);
xMaxUpFourC1 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC1];

upFFTFiveC1 = fft(upFive(1,:), 512); % Up 5
pUpFiveC1 = abs(upFFTFiveC1);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC1);
xMaxUpFiveC1 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC1];

%Channel 2
upFFTOneC2 = fft(upOne(2,:), 512); % Up 1
pUpOneC2 = abs(upFFTOneC2);
[maxUpOne, indexMaxUpOne] = max(pUpOneC2);
xMaxUpOneC2 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC2];

upFFTTwoC2 = fft(upTwo(2,:), 512); % Up 2
pUpTwoC2 = abs(upFFTTwoC2);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC2);
xMaxUpTwoC2 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC2];

upFFTThreeC2 = fft(upThree(2,:), 512); % Up 3
pUpThreeC2 = abs(upFFTThreeC2);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC2);
xMaxUpThreeC2 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC2];

upFFTFourC2 = fft(upFour(2,:), 512); % Up 4
pUpFourC2 = abs(upFFTFourC2);
[maxUpFour, indexMaxUpFour] = max(pUpFourC2);
xMaxUpFourC2 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC2];

upFFTFiveC2 = fft(upFive(2,:), 512); % Up 5
pUpFiveC2 = abs(upFFTFiveC2);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC2);
xMaxUpFiveC2 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC2];

%Channel 3
upFFTOneC3 = fft(upOne(3,:), 512); % Up 1
pUpOneC3 = abs(upFFTOneC3);
[maxUpOne, indexMaxUpOne] = max(pUpOneC3);
xMaxUpOneC3 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC3];

upFFTTwoC3 = fft(upTwo(3,:), 512); % Up 2
pUpTwoC3 = abs(upFFTTwoC3);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC3);
xMaxUpTwoC3 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC3];

upFFTThreeC3 = fft(upThree(3,:), 512); % Up 3
pUpThreeC3 = abs(upFFTThreeC3);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC3);
xMaxUpThreeC3 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC3];

upFFTFourC3 = fft(upFour(3,:), 512); % Up 4
pUpFourC3 = abs(upFFTFourC3);
[maxUpFour, indexMaxUpFour] = max(pUpFourC3);
xMaxUpFourC3 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC3];

upFFTFiveC3 = fft(upFive(3,:), 512); % Up 5
pUpFiveC3 = abs(upFFTFiveC3);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC3);
xMaxUpFiveC3 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC3];

%Channel 4
upFFTOneC4 = fft(upOne(4,:), 512); % Up 1
pUpOneC4 = abs(upFFTOneC4);
[maxUpOne, indexMaxUpOne] = max(pUpOneC4);
xMaxUpOneC4 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC4];

upFFTTwoC4 = fft(upTwo(4,:), 512); % Up 2
pUpTwoC4 = abs(upFFTTwoC4);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC4);
xMaxUpTwoC4 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC4];

upFFTThreeC4 = fft(upThree(4,:), 512); % Up 3
pUpThreeC4 = abs(upFFTThreeC4);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC4);
xMaxUpThreeC4 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC4];

upFFTFourC4 = fft(upFour(4,:), 512); % Up 4
pUpFourC4 = abs(upFFTFourC4);
[maxUpFour, indexMaxUpFour] = max(pUpFourC4);
xMaxUpFourC4 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC4];

upFFTFiveC4 = fft(upFive(4,:), 512); % Up 5
pUpFiveC4 = abs(upFFTFiveC4);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC4);
xMaxUpFiveC4 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC4];

%Channel 5
upFFTOneC5 = fft(upOne(5,:), 512); % Up 1
pUpOneC5 = abs(upFFTOneC5);
[maxUpOne, indexMaxUpOne] = max(pUpOneC5);
xMaxUpOneC5 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC5];

upFFTTwoC5 = fft(upTwo(5,:), 512); % Up 2
pUpTwoC5 = abs(upFFTTwoC5);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC5);
xMaxUpTwoC5 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC5];

upFFTThreeC5 = fft(upThree(5,:), 512); % Up 3
pUpThreeC5 = abs(upFFTThreeC5);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC5);
xMaxUpThreeC5 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC5];

upFFTFourC5 = fft(upFour(5,:), 512); % Up 4
pUpFourC5 = abs(upFFTFourC5);
[maxUpFour, indexMaxUpFour] = max(pUpFourC5);
xMaxUpFourC5 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC5];

upFFTFiveC5 = fft(upFive(5,:), 512); % Up 5
pUpFiveC5 = abs(upFFTFiveC5);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC5);
xMaxUpFiveC5 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC5];

%Channel 6
upFFTOneC6 = fft(upOne(6,:), 512); % Up 1
pUpOneC6 = abs(upFFTOneC6);
[maxUpOne, indexMaxUpOne] = max(pUpOneC6);
xMaxUpOneC6 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC6];

upFFTTwoC6 = fft(upTwo(6,:), 512); % Up 2
pUpTwoC6 = abs(upFFTTwoC6);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC6);
xMaxUpTwoC6 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC6];

upFFTThreeC6 = fft(upThree(6,:), 512); % Up 3
pUpThreeC6 = abs(upFFTThreeC6);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC6);
xMaxUpThreeC6 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC6];

upFFTFourC6 = fft(upFour(6,:), 512); % Up 4
pUpFourC6 = abs(upFFTFourC6);
[maxUpFour, indexMaxUpFour] = max(pUpFourC6);
xMaxUpFourC6 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC6];

upFFTFiveC6 = fft(upFive(6,:), 512); % Up 5
pUpFiveC6 = abs(upFFTFiveC6);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC6);
xMaxUpFiveC6 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC6];

%Channel 7
upFFTOneC7 = fft(upOne(7,:), 512); % Up 1
pUpOneC7 = abs(upFFTOneC7);
[maxUpOne, indexMaxUpOne] = max(pUpOneC7);
xMaxUpOneC7 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC7];

upFFTTwoC7 = fft(upTwo(7,:), 512); % Up 2
pUpTwoC7 = abs(upFFTTwoC7);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC7);
xMaxUpTwoC7 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC7];

upFFTThreeC7 = fft(upThree(7,:), 512); % Up 3
pUpThreeC7 = abs(upFFTThreeC7);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC7);
xMaxUpThreeC7 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC7];

upFFTFourC7 = fft(upFour(7,:), 512); % Up 4
pUpFourC7 = abs(upFFTFourC7);
[maxUpFour, indexMaxUpFour] = max(pUpFourC7);
xMaxUpFourC7 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC7];

upFFTFiveC7 = fft(upFive(7,:), 512); % Up 5
pUpFiveC7 = abs(upFFTFiveC7);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC7);
xMaxUpFiveC7 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC7];

%Channel 8
upFFTOneC8 = fft(upOne(8,:), 512); % Up 1
pUpOneC8 = abs(upFFTOneC8);
[maxUpOne, indexMaxUpOne] = max(pUpOneC8);
xMaxUpOneC8 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC8];

upFFTTwoC8 = fft(upTwo(8,:), 512); % Up 2
pUpTwoC8 = abs(upFFTTwoC8);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC8);
xMaxUpTwoC8 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC8];

upFFTThreeC8 = fft(upThree(8,:), 512); % Up 3
pUpThreeC8 = abs(upFFTThreeC8);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC8);
xMaxUpThreeC8 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC8];

upFFTFourC8 = fft(upFour(8,:), 512); % Up 4
pUpFourC8 = abs(upFFTFourC8);
[maxUpFour, indexMaxUpFour] = max(pUpFourC8);
xMaxUpFourC8 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC8];

upFFTFiveC8 = fft(upFive(8,:), 512); % Up 5
pUpFiveC8 = abs(upFFTFiveC8);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC8);
xMaxUpFiveC8 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC8];

%Channel 9
upFFTOneC9 = fft(upOne(9,:), 512); % Up 1
pUpOneC9 = abs(upFFTOneC9);
[maxUpOne, indexMaxUpOne] = max(pUpOneC9);
xMaxUpOneC9 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC9];

upFFTTwoC9 = fft(upTwo(9,:), 512); % Up 2
pUpTwoC9 = abs(upFFTTwoC9);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC9);
xMaxUpTwoC9 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC9];

upFFTThreeC9 = fft(upThree(9,:), 512); % Up 3
pUpThreeC9 = abs(upFFTThreeC9);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC9);
xMaxUpThreeC9 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC9];

upFFTFourC9 = fft(upFour(9,:), 512); % Up 4
pUpFourC9 = abs(upFFTFourC9);
[maxUpFour, indexMaxUpFour] = max(pUpFourC9);
xMaxUpFourC9 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC9];

upFFTFiveC9 = fft(upFive(9,:), 512); % Up 5
pUpFiveC9 = abs(upFFTFiveC9);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC9);
xMaxUpFiveC9 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC9];

%Channel 10
upFFTOneC10 = fft(upOne(10,:), 512); % Up 1
pUpOneC10 = abs(upFFTOneC10);
[maxUpOne, indexMaxUpOne] = max(pUpOneC10);
xMaxUpOneC10 = f(indexMaxUpOne);
maxAvgUp = [maxAvgUp xMaxUpOneC10];

upFFTTwoC10 = fft(upTwo(10,:), 512); % Up 2
pUpTwoC10 = abs(upFFTTwoC10);
[maxUpTwo, indexMaxUpTwo] = max(pUpTwoC10);
xMaxUpTwoC10 = f(indexMaxUpTwo);
maxAvgUp = [maxAvgUp xMaxUpTwoC10];

upFFTThreeC10 = fft(upThree(10,:), 512); % Up 3
pUpThreeC10 = abs(upFFTThreeC10);
[maxUpThree, indexMaxUpThree] = max(pUpThreeC10);
xMaxUpThreeC10 = f(indexMaxUpThree);
maxAvgUp = [maxAvgUp xMaxUpThreeC10];

upFFTFourC10 = fft(upFour(10,:), 512); % Up 4
pUpFourC10 = abs(upFFTFourC10);
[maxUpFour, indexMaxUpFour] = max(pUpFourC10);
xMaxUpFourC10 = f(indexMaxUpFour);
maxAvgUp = [maxAvgUp xMaxUpFourC10];

upFFTFiveC10 = fft(upFive(10,:), 512); % Up 5
pUpFiveC10 = abs(upFFTFiveC10);
[maxUpFive, indexMaxUpFive] = max(pUpFiveC10);
xMaxUpFiveC10 = f(indexMaxUpFive);
maxAvgUp = [maxAvgUp xMaxUpFiveC10];

meanMaxUp = mean(nonzeros(maxAvgUp));
upAvgFreq = sprintf('Avg frequency Up = %.3f' , meanMaxUp);
disp(upAvgFreq);

% Down

maxAvgDown = zeros(0);

%Channel 1
downFFTOneC1 = fft(downOne(1,:), 512); % Down 1
pDownOneC1 = abs(downFFTOneC1);
[maxDownOne, indexMaxDownOne] = max(pDownOneC1);
xMaxDownOneC1 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC1];

downFFTTwoC1 = fft(downTwo(1,:), 512); % Down 2
pDownTwoC1 = abs(downFFTTwoC1);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC1);
xMaxDownTwoC1 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC1];

downFFTThreeC1 = fft(downThree(1,:), 512); % Down 3
pDownThreeC1 = abs(downFFTThreeC1);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC1);
xMaxDownThreeC1 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC1];

downFFTFourC1 = fft(downFour(1,:), 512); % Down 4
pDownFourC1 = abs(downFFTFourC1);
[maxDownFour, indexMaxDownFour] = max(pDownFourC1);
xMaxDownFourC1 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC1];

downFFTFiveC1 = fft(downFive(1,:), 512); % Down 5
pDownFiveC1 = abs(downFFTFiveC1);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC1);
xMaxDownFiveC1 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC1];

%Channel 2
downFFTOneC2 = fft(downOne(2,:), 512); % Down 1
pDownOneC2 = abs(downFFTOneC2);
[maxDownOne, indexMaxDownOne] = max(pDownOneC2);
xMaxDownOneC2 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC2];

downFFTTwoC2 = fft(downTwo(2,:), 512); % Down 2
pDownTwoC2 = abs(downFFTTwoC2);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC2);
xMaxDownTwoC2 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC2];

downFFTThreeC2 = fft(downThree(2,:), 512); % Down 3
pDownThreeC2 = abs(downFFTThreeC2);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC2);
xMaxDownThreeC2 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC2];

downFFTFourC2 = fft(downFour(2,:), 512); % Down 4
pDownFourC2 = abs(downFFTFourC2);
[maxDownFour, indexMaxDownFour] = max(pDownFourC2);
xMaxDownFourC2 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC2];

downFFTFiveC2 = fft(downFive(2,:), 512); % Down 5
pDownFiveC2 = abs(downFFTFiveC2);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC2);
xMaxDownFiveC2 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC2];

%Channel 3
downFFTOneC3 = fft(downOne(3,:), 512); % Down 1
pDownOneC3 = abs(downFFTOneC3);
[maxDownOne, indexMaxDownOne] = max(pDownOneC3);
xMaxDownOneC3 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC3];

downFFTTwoC3 = fft(downTwo(3,:), 512); % Down 2
pDownTwoC3 = abs(downFFTTwoC3);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC3);
xMaxDownTwoC3 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC3];

downFFTThreeC3 = fft(downThree(3,:), 512); % Down 3
pDownThreeC3 = abs(downFFTThreeC3);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC3);
xMaxDownThreeC3 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC3];

downFFTFourC3 = fft(downFour(3,:), 512); % Down 4
pDownFourC3 = abs(downFFTFourC3);
[maxDownFour, indexMaxDownFour] = max(pDownFourC3);
xMaxDownFourC3 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC3];

downFFTFiveC3 = fft(downFive(3,:), 512); % Down 5
pDownFiveC3 = abs(downFFTFiveC3);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC3);
xMaxDownFiveC3 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC3];

%Channel 4
downFFTOneC4 = fft(downOne(4,:), 512); % Down 1
pDownOneC4 = abs(downFFTOneC4);
[maxDownOne, indexMaxDownOne] = max(pDownOneC4);
xMaxDownOneC4 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC4];

downFFTTwoC4 = fft(downTwo(4,:), 512); % Down 2
pDownTwoC4 = abs(downFFTTwoC4);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC4);
xMaxDownTwoC4 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC4];

downFFTThreeC4 = fft(downThree(4,:), 512); % Down 3
pDownThreeC4 = abs(downFFTThreeC4);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC4);
xMaxDownThreeC4 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC4];

downFFTFourC4 = fft(downFour(4,:), 512); % Down 4
pDownFourC4 = abs(downFFTFourC4);
[maxDownFour, indexMaxDownFour] = max(pDownFourC4);
xMaxDownFourC4 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC4];

downFFTFiveC4 = fft(downFive(4,:), 512); % Down 5
pDownFiveC4 = abs(downFFTFiveC4);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC4);
xMaxDownFiveC4 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC4];

%Channel 5
downFFTOneC5 = fft(downOne(5,:), 512); % Down 1
pDownOneC5 = abs(downFFTOneC5);
[maxDownOne, indexMaxDownOne] = max(pDownOneC5);
xMaxDownOneC5 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC5];

downFFTTwoC5 = fft(downTwo(5,:), 512); % Down 2
pDownTwoC5 = abs(downFFTTwoC5);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC5);
xMaxDownTwoC5 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC5];

downFFTThreeC5 = fft(downThree(5,:), 512); % Down 3
pDownThreeC5 = abs(downFFTThreeC5);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC5);
xMaxDownThreeC5 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC5];

downFFTFourC5 = fft(downFour(5,:), 512); % Down 4
pDownFourC5 = abs(downFFTFourC5);
[maxDownFour, indexMaxDownFour] = max(pDownFourC5);
xMaxDownFourC5 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC5];

downFFTFiveC5 = fft(downFive(5,:), 512); % Down 5
pDownFiveC5 = abs(downFFTFiveC5);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC5);
xMaxDownFiveC5 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC5];

%Channel 6
downFFTOneC6 = fft(downOne(6,:), 512); % Down 1
pDownOneC6 = abs(downFFTOneC6);
[maxDownOne, indexMaxDownOne] = max(pDownOneC6);
xMaxDownOneC6 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC6];

downFFTTwoC6 = fft(downTwo(6,:), 512); % Down 2
pDownTwoC6 = abs(downFFTTwoC6);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC6);
xMaxDownTwoC6 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC6];

downFFTThreeC6 = fft(downThree(6,:), 512); % Down 3
pDownThreeC6 = abs(downFFTThreeC6);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC6);
xMaxDownThreeC6 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC6];

downFFTFourC6 = fft(downFour(6,:), 512); % Down 4
pDownFourC6 = abs(downFFTFourC6);
[maxDownFour, indexMaxDownFour] = max(pDownFourC6);
xMaxDownFourC6 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC6];

downFFTFiveC6 = fft(downFive(6,:), 512); % Down 5
pDownFiveC6 = abs(downFFTFiveC6);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC6);
xMaxDownFiveC6 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC6];

%Channel 7
downFFTOneC7 = fft(downOne(7,:), 512); % Down 1
pDownOneC7 = abs(downFFTOneC7);
[maxDownOne, indexMaxDownOne] = max(pDownOneC7);
xMaxDownOneC7 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC7];

downFFTTwoC7 = fft(downTwo(7,:), 512); % Down 2
pDownTwoC7 = abs(downFFTTwoC7);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC7);
xMaxDownTwoC7 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC7];

downFFTThreeC7 = fft(downThree(7,:), 512); % Down 3
pDownThreeC7 = abs(downFFTThreeC7);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC7);
xMaxDownThreeC7 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC7];

downFFTFourC7 = fft(downFour(7,:), 512); % Down 4
pDownFourC7 = abs(downFFTFourC7);
[maxDownFour, indexMaxDownFour] = max(pDownFourC7);
xMaxDownFourC7 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC7];

downFFTFiveC7 = fft(downFive(7,:), 512); % Down 5
pDownFiveC7 = abs(downFFTFiveC7);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC7);
xMaxDownFiveC7 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC7];

%Channel 8
downFFTOneC8 = fft(downOne(8,:), 512); % Down 1
pDownOneC8 = abs(downFFTOneC8);
[maxDownOne, indexMaxDownOne] = max(pDownOneC8);
xMaxDownOneC8 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC8];

downFFTTwoC8 = fft(downTwo(8,:), 512); % Down 2
pDownTwoC8 = abs(downFFTTwoC8);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC8);
xMaxDownTwoC8 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC8];

downFFTThreeC8 = fft(downThree(8,:), 512); % Down 3
pDownThreeC8 = abs(downFFTThreeC8);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC8);
xMaxDownThreeC8 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC8];

downFFTFourC8 = fft(downFour(8,:), 512); % Down 4
pDownFourC8 = abs(downFFTFourC8);
[maxDownFour, indexMaxDownFour] = max(pDownFourC8);
xMaxDownFourC8 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC8];

downFFTFiveC8 = fft(downFive(8,:), 512); % Down 5
pDownFiveC8 = abs(downFFTFiveC8);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC8);
xMaxDownFiveC8 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC8];

%Channel 9
downFFTOneC9 = fft(downOne(9,:), 512); % Down 1
pDownOneC9 = abs(downFFTOneC9);
[maxDownOne, indexMaxDownOne] = max(pDownOneC9);
xMaxDownOneC9 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC9];

downFFTTwoC9 = fft(downTwo(9,:), 512); % Down 2
pDownTwoC9 = abs(downFFTTwoC9);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC9);
xMaxDownTwoC9 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC9];

downFFTThreeC9 = fft(downThree(9,:), 512); % Down 3
pDownThreeC9 = abs(downFFTThreeC9);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC9);
xMaxDownThreeC9 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC9];

downFFTFourC9 = fft(downFour(9,:), 512); % Down 4
pDownFourC9 = abs(downFFTFourC9);
[maxDownFour, indexMaxDownFour] = max(pDownFourC9);
xMaxDownFourC9 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC9];

downFFTFiveC9 = fft(downFive(9,:), 512); % Down 5
pDownFiveC9 = abs(downFFTFiveC9);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC9);
xMaxDownFiveC9 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC9];

%Channel 10
downFFTOneC10 = fft(downOne(10,:), 512); % Down 1
pDownOneC10 = abs(downFFTOneC10);
[maxDownOne, indexMaxDownOne] = max(pDownOneC10);
xMaxDownOneC10 = f(indexMaxDownOne);
maxAvgDown = [maxAvgDown xMaxDownOneC10];

downFFTTwoC10 = fft(downTwo(10,:), 512); % Down 2
pDownTwoC10 = abs(downFFTTwoC10);
[maxDownTwo, indexMaxDownTwo] = max(pDownTwoC10);
xMaxDownTwoC10 = f(indexMaxDownTwo);
maxAvgDown = [maxAvgDown xMaxDownTwoC10];

downFFTThreeC10 = fft(downThree(10,:), 512); % Down 3
pDownThreeC10 = abs(downFFTThreeC10);
[maxDownThree, indexMaxDownThree] = max(pDownThreeC10);
xMaxDownThreeC10 = f(indexMaxDownThree);
maxAvgDown = [maxAvgDown xMaxDownThreeC10];

downFFTFourC10 = fft(downFour(10,:), 512); % Down 4
pDownFourC10 = abs(downFFTFourC10);
[maxDownFour, indexMaxDownFour] = max(pDownFourC10);
xMaxDownFourC10 = f(indexMaxDownFour);
maxAvgDown = [maxAvgDown xMaxDownFourC10];

downFFTFiveC10 = fft(downFive(10,:), 512); % Down 5
pDownFiveC10 = abs(downFFTFiveC10);
[maxDownFive, indexMaxDownFive] = max(pDownFiveC10);
xMaxDownFiveC10 = f(indexMaxDownFive);
maxAvgDown = [maxAvgDown xMaxDownFiveC10];

meanMaxDown = mean(nonzeros(maxAvgDown));
downAvgFreq = sprintf('Avg frequency Down = %.3f' , meanMaxDown);
disp(downAvgFreq);

% In

maxAvgIn = zeros(0);

%Channel 1
inFFTOneC1 = fft(inOne(1,:), 512); % In 1
pInOneC1 = abs(inFFTOneC1);
[maxInOne, indexMaxInOne] = max(pInOneC1);
xMaxInOneC1 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC1];

inFFTTwoC1 = fft(inTwo(1,:), 512); % In 2
pInTwoC1 = abs(inFFTTwoC1);
[maxInTwo, indexMaxInTwo] = max(pInTwoC1);
xMaxInTwoC1 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC1];

inFFTThreeC1 = fft(inThree(1,:), 512); % In 3
pInThreeC1 = abs(inFFTThreeC1);
[maxInThree, indexMaxInThree] = max(pInThreeC1);
xMaxInThreeC1 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC1];

inFFTFourC1 = fft(inFour(1,:), 512); % In 4
pInFourC1 = abs(inFFTFourC1);
[maxInFour, indexMaxInFour] = max(pInFourC1);
xMaxInFourC1 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC1];

inFFTFiveC1 = fft(inFive(1,:), 512); % In 5
pInFiveC1 = abs(inFFTFiveC1);
[maxInFive, indexMaxInFive] = max(pInFiveC1);
xMaxInFiveC1 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC1];

%Channel 2
inFFTOneC2 = fft(inOne(2,:), 512); % In 1
pInOneC2 = abs(inFFTOneC2);
[maxInOne, indexMaxInOne] = max(pInOneC2);
xMaxInOneC2 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC2];

inFFTTwoC2 = fft(inTwo(2,:), 512); % In 2
pInTwoC2 = abs(inFFTTwoC2);
[maxInTwo, indexMaxInTwo] = max(pInTwoC2);
xMaxInTwoC2 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC2];

inFFTThreeC2 = fft(inThree(2,:), 512); % In 3
pInThreeC2 = abs(inFFTThreeC2);
[maxInThree, indexMaxInThree] = max(pInThreeC2);
xMaxInThreeC2 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC2];

inFFTFourC2 = fft(inFour(2,:), 512); % In 4
pInFourC2 = abs(inFFTFourC2);
[maxInFour, indexMaxInFour] = max(pInFourC2);
xMaxInFourC2 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC2];

inFFTFiveC2 = fft(inFive(2,:), 512); % In 5
pInFiveC2 = abs(inFFTFiveC2);
[maxInFive, indexMaxInFive] = max(pInFiveC2);
xMaxInFiveC2 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC2];

%Channel 3
inFFTOneC3 = fft(inOne(3,:), 512); % In 1
pInOneC3 = abs(inFFTOneC3);
[maxInOne, indexMaxInOne] = max(pInOneC3);
xMaxInOneC3 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC3];

inFFTTwoC3 = fft(inTwo(3,:), 512); % In 2
pInTwoC3 = abs(inFFTTwoC3);
[maxInTwo, indexMaxInTwo] = max(pInTwoC3);
xMaxInTwoC3 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC3];

inFFTThreeC3 = fft(inThree(3,:), 512); % In 3
pInThreeC3 = abs(inFFTThreeC3);
[maxInThree, indexMaxInThree] = max(pInThreeC3);
xMaxInThreeC3 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC3];

inFFTFourC3 = fft(inFour(3,:), 512); % In 4
pInFourC3 = abs(inFFTFourC3);
[maxInFour, indexMaxInFour] = max(pInFourC3);
xMaxInFourC3 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC3];

inFFTFiveC3 = fft(inFive(3,:), 512); % In 5
pInFiveC3 = abs(inFFTFiveC3);
[maxInFive, indexMaxInFive] = max(pInFiveC3);
xMaxInFiveC3 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC3];

%Channel 4
inFFTOneC4 = fft(inOne(4,:), 512); % In 1
pInOneC4 = abs(inFFTOneC4);
[maxInOne, indexMaxInOne] = max(pInOneC4);
xMaxInOneC4 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC4];

inFFTTwoC4 = fft(inTwo(4,:), 512); % In 2
pInTwoC4 = abs(inFFTTwoC4);
[maxInTwo, indexMaxInTwo] = max(pInTwoC4);
xMaxInTwoC4 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC4];

inFFTThreeC4 = fft(inThree(4,:), 512); % In 3
pInThreeC4 = abs(inFFTThreeC4);
[maxInThree, indexMaxInThree] = max(pInThreeC4);
xMaxInThreeC4 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC4];

inFFTFourC4 = fft(inFour(4,:), 512); % In 4
pInFourC4 = abs(inFFTFourC4);
[maxInFour, indexMaxInFour] = max(pInFourC4);
xMaxInFourC4 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC4];

inFFTFiveC4 = fft(inFive(4,:), 512); % In 5
pInFiveC4 = abs(inFFTFiveC4);
[maxInFive, indexMaxInFive] = max(pInFiveC4);
xMaxInFiveC4 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC4];

%Channel 5
inFFTOneC5 = fft(inOne(5,:), 512); % In 1
pInOneC5 = abs(inFFTOneC5);
[maxInOne, indexMaxInOne] = max(pInOneC5);
xMaxInOneC5 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC5];

inFFTTwoC5 = fft(inTwo(5,:), 512); % In 2
pInTwoC5 = abs(inFFTTwoC5);
[maxLInTwo, indexMaxInTwo] = max(pInTwoC5);
xMaxInTwoC5 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC5];

inFFTThreeC5 = fft(inThree(5,:), 512); % In 3
pInThreeC5 = abs(inFFTThreeC5);
[maxInThree, indexMaxInThree] = max(pInThreeC5);
xMaxInThreeC5 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC5];

inFFTFourC5 = fft(inFour(5,:), 512); % In 4
pInFourC5 = abs(inFFTFourC5);
[maxInFour, indexMaxInFour] = max(pInFourC5);
xMaxInFourC5 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC5];

inFFTFiveC5 = fft(inFive(5,:), 512); % In 5
pInFiveC5 = abs(inFFTFiveC5);
[maxInFive, indexMaxInFive] = max(pInFiveC5);
xMaxInFiveC5 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC5];

%Channel 6
inFFTOneC6 = fft(inOne(6,:), 512); % In 1
pInOneC6 = abs(inFFTOneC6);
[maxInOne, indexMaxInOne] = max(pInOneC6);
xMaxInOneC6 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC6];

inFFTTwoC6 = fft(inTwo(6,:), 512); % In 2
pInTwoC6 = abs(inFFTTwoC6);
[maxInTwo, indexMaxInTwo] = max(pInTwoC6);
xMaxInTwoC6 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC6];

inFFTThreeC6 = fft(inThree(6,:), 512); % In 3
pInThreeC6 = abs(inFFTThreeC6);
[maxInThree, indexMaxInThree] = max(pInThreeC6);
xMaxInThreeC6 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC6];

inFFTFourC6 = fft(inFour(6,:), 512); % In 4
pInFourC6 = abs(inFFTFourC6);
[maxInFour, indexMaxInFour] = max(pInFourC6);
xMaxInFourC6 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC6];

inFFTFiveC6 = fft(inFive(6,:), 512); % In 5
pInFiveC6 = abs(inFFTFiveC6);
[maxInFive, indexMaxInFive] = max(pInFiveC6);
xMaxInFiveC6 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC6];

%Channel 7
inFFTOneC7 = fft(inOne(7,:), 512); % In 1
pInOneC7 = abs(inFFTOneC7);
[maxLeftOne, indexMaxLeftOne] = max(pInOneC7);
xMaxInOneC7 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC7];

inFFTTwoC7 = fft(inTwo(7,:), 512); % In 2
pInTwoC7 = abs(inFFTTwoC7);
[maxInTwo, indexMaxInTwo] = max(pInTwoC7);
xMaxInTwoC7 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC7];

inFFTThreeC7 = fft(inThree(7,:), 512); % In 3
pInThreeC7 = abs(inFFTThreeC7);
[maxInThree, indexMaxInThree] = max(pInThreeC7);
xMaxInThreeC7 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC7];

inFFTFourC7 = fft(inFour(7,:), 512); % In 4
pInFourC7 = abs(inFFTFourC7);
[maxInFour, indexMaxInFour] = max(pInFourC7);
xMaxInFourC7 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC7];

inFFTFiveC7 = fft(inFive(7,:), 512); % In 5
pInFiveC7 = abs(inFFTFiveC7);
[maxInFive, indexMaxInFive] = max(pInFiveC7);
xMaxInFiveC7 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC7];

%Channel 8
inFFTOneC8 = fft(inOne(8,:), 512); % In 1
pInOneC8 = abs(inFFTOneC8);
[maxInOne, indexMaxInOne] = max(pInOneC8);
xMaxInOneC8 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC8];

inFFTTwoC8 = fft(inTwo(8,:), 512); % In 2
pInTwoC8 = abs(inFFTTwoC8);
[maxInTwo, indexMaxInTwo] = max(pInTwoC8);
xMaxInTwoC8 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC8];

inFFTThreeC8 = fft(inThree(8,:), 512); % In 3
pInThreeC8 = abs(inFFTThreeC8);
[maxInThree, indexMaxInThree] = max(pInThreeC8);
xMaxInThreeC8 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC8];

inFFTFourC8 = fft(inFour(8,:), 512); % In 4
pInFourC8 = abs(inFFTFourC8);
[maxLInFour, indexMaxInFour] = max(pInFourC8);
xMaxInFourC8 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC8];

inFFTFiveC8 = fft(inFive(8,:), 512); % In 5
pInFiveC8 = abs(inFFTFiveC8);
[maxInFive, indexMaxInFive] = max(pInFiveC8);
xMaxInFiveC8 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC8];

%Channel 9
inFFTOneC9 = fft(inOne(9,:), 512); % In 1
pInOneC9 = abs(inFFTOneC9);
[maxInOne, indexMaxInOne] = max(pInOneC9);
xMaxInOneC9 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC9];

inFFTTwoC9 = fft(inTwo(9,:), 512); % In 2
pInTwoC9 = abs(inFFTTwoC9);
[maxInTwo, indexMaxInTwo] = max(pInTwoC9);
xMaxInTwoC9 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC9];

inFFTThreeC9 = fft(inThree(9,:), 512); % In 3
pInThreeC9 = abs(inFFTThreeC9);
[maxInThree, indexMaxInThree] = max(pInThreeC9);
xMaxInThreeC9 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC9];

inFFTFourC9 = fft(inFour(9,:), 512); % In 4
pInFourC9 = abs(inFFTFourC9);
[maxInFour, indexMaxInFour] = max(pInFourC9);
xMaxInFourC9 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC9];

inFFTFiveC9 = fft(inFive(9,:), 512); % In 5
pInFiveC9 = abs(inFFTFiveC9);
[maxInFive, indexMaxInFive] = max(pInFiveC9);
xMaxInFiveC9 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC9];

%Channel 10
inFFTOneC10 = fft(inOne(10,:), 512); % In 1
pInOneC10 = abs(inFFTOneC10);
[maxInOne, indexMaxInOne] = max(pInOneC10);
xMaxInOneC10 = f(indexMaxInOne);
maxAvgIn = [maxAvgIn xMaxInOneC10];

inFFTTwoC10 = fft(inTwo(10,:), 512); % In 2
pInTwoC10 = abs(inFFTTwoC10);
[maxInTwo, indexMaxInTwo] = max(pInTwoC10);
xMaxInTwoC10 = f(indexMaxInTwo);
maxAvgIn = [maxAvgIn xMaxInTwoC10];

inFFTThreeC10 = fft(inThree(10,:), 512); % In 3
pInThreeC10 = abs(inFFTThreeC10);
[maxInThree, indexMaxInThree] = max(pInThreeC10);
xMaxInThreeC10 = f(indexMaxInThree);
maxAvgIn = [maxAvgIn xMaxInThreeC10];

inFFTFourC10 = fft(inFour(10,:), 512); % In 4
pInFourC10 = abs(inFFTFourC10);
[maxInFour, indexMaxInFour] = max(pInFourC10);
xMaxInFourC10 = f(indexMaxInFour);
maxAvgIn = [maxAvgIn xMaxInFourC10];

inFFTFiveC10 = fft(inFive(10,:), 512); % In 5
pInFiveC10 = abs(inFFTFiveC10);
[maxInFive, indexMaxInFive] = max(pInFiveC10);
xMaxInFiveC10 = f(indexMaxInFive);
maxAvgIn = [maxAvgIn xMaxInFiveC10];

meanMaxIn = mean(nonzeros(maxAvgIn));
inAvgFreq = sprintf('Avg frequency In = %.3f' , meanMaxIn);
disp(inAvgFreq);

% Out

maxAvgOut = zeros(0);

%Channel 1
outFFTOneC1 = fft(outOne(1,:), 512); % Out 1
pOutOneC1 = abs(outFFTOneC1);
[maxOutOne, indexMaxOutOne] = max(pOutOneC1);
xMaxOutOneC1 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC1];

outFFTTwoC1 = fft(outTwo(1,:), 512); % Out 2
pOutTwoC1 = abs(outFFTTwoC1);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC1);
xMaxOutTwoC1 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC1];

outFFTThreeC1 = fft(outThree(1,:), 512); % Out 3
pOutThreeC1 = abs(outFFTThreeC1);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC1);
xMaxOutThreeC1 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC1];

outFFTFourC1 = fft(outFour(1,:), 512); % Out 4
pOutFourC1 = abs(outFFTFourC1);
[maxOutFour, indexMaxOutFour] = max(pOutFourC1);
xMaxOutFourC1 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC1];

outFFTFiveC1 = fft(outFive(1,:), 512); % Out 5
pOutFiveC1 = abs(outFFTFiveC1);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC1);
xMaxOutFiveC1 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC1];

%Channel 2
outFFTOneC2 = fft(outOne(2,:), 512); % Out 1
pOutOneC2 = abs(outFFTOneC2);
[maxOutOne, indexMaxOutOne] = max(pOutOneC2);
xMaxOutOneC2 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC2];

outFFTTwoC2 = fft(outTwo(2,:), 512); % Out 2
pOutTwoC2 = abs(outFFTTwoC2);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC2);
xMaxOutTwoC2 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC2];

outFFTThreeC2 = fft(outThree(2,:), 512); % Out 3
pOutThreeC2 = abs(outFFTThreeC2);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC2);
xMaxOutThreeC2 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC2];

outFFTFourC2 = fft(outFour(2,:), 512); % Out 4
pOutFourC2 = abs(outFFTFourC2);
[maxOutFour, indexMaxOutFour] = max(pOutFourC2);
xMaxOutFourC2 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC2];

outFFTFiveC2 = fft(outFive(2,:), 512); % Out 5
pOutFiveC2 = abs(outFFTFiveC2);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC2);
xMaxOutFiveC2 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC2];

%Channel 3
outFFTOneC3 = fft(outOne(3,:), 512); % Out 1
pOutOneC3 = abs(outFFTOneC3);
[maxOutOne, indexMaxOutOne] = max(pOutOneC3);
xMaxOutOneC3 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC3];

outFFTTwoC3 = fft(outTwo(3,:), 512); % Out 2
pOutTwoC3 = abs(outFFTTwoC3);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC3);
xMaxOutTwoC3 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC3];

outFFTThreeC3 = fft(outThree(3,:), 512); % Out 3
pOutThreeC3 = abs(outFFTThreeC3);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC3);
xMaxOutThreeC3 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC3];

outFFTFourC3 = fft(outFour(3,:), 512); % Out 4
pOutFourC3 = abs(outFFTFourC3);
[maxOutFour, indexMaxOutFour] = max(pOutFourC3);
xMaxOutFourC3 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC3];

outFFTFiveC3 = fft(outFive(3,:), 512); % Out 5
pOutFiveC3 = abs(outFFTFiveC3);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC3);
xMaxOutFiveC3 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC3];

%Channel 4
outFFTOneC4 = fft(outOne(4,:), 512); % Out 1
pOutOneC4 = abs(outFFTOneC4);
[maxOutOne, indexMaxOutOne] = max(pOutOneC4);
xMaxOutOneC4 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC4];

outFFTTwoC4 = fft(outTwo(4,:), 512); % Out 2
pOutTwoC4 = abs(outFFTTwoC4);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC4);
xMaxOutTwoC4 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC4];

outFFTThreeC4 = fft(outThree(4,:), 512); % Out 3
pOutThreeC4 = abs(outFFTThreeC4);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC4);
xMaxOutThreeC4 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC4];

outFFTFourC4 = fft(outFour(4,:), 512); % Out 4
pOutFourC4 = abs(outFFTFourC4);
[maxOutFour, indexMaxOutFour] = max(pOutFourC4);
xMaxOutFourC4 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC4];

outFFTFiveC4 = fft(outFive(4,:), 512); % Out 5
pOutFiveC4 = abs(outFFTFiveC4);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC4);
xMaxOutFiveC4 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC4];

%Channel 5
outFFTOneC5 = fft(outOne(5,:), 512); % Out 1
pOutOneC5 = abs(outFFTOneC5);
[maxOutOne, indexMaxOutOne] = max(pOutOneC5);
xMaxOutOneC5 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC5];

outFFTTwoC5 = fft(outTwo(5,:), 512); % Out 2
pOutTwoC5 = abs(outFFTTwoC5);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC5);
xMaxOutTwoC5 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC5];

outFFTThreeC5 = fft(outThree(5,:), 512); % Out 3
pOutThreeC5 = abs(outFFTThreeC5);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC5);
xMaxOutThreeC5 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC5];

outFFTFourC5 = fft(outFour(5,:), 512); % Out 4
pOutFourC5 = abs(outFFTFourC5);
[maxOutFour, indexMaxOutFour] = max(pOutFourC5);
xMaxOutFourC5 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC5];

outFFTFiveC5 = fft(outFive(5,:), 512); % Out 5
pOutFiveC5 = abs(outFFTFiveC5);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC5);
xMaxOutFiveC5 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC5];

%Channel 6
outFFTOneC6 = fft(outOne(6,:), 512); % Out 1
pOutOneC6 = abs(outFFTOneC6);
[maxOutOne, indexMaxOutOne] = max(pOutOneC6);
xMaxOutOneC6 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC6];

outFFTTwoC6 = fft(outTwo(6,:), 512); % Out 2
pOutTwoC6 = abs(outFFTTwoC6);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC6);
xMaxOutTwoC6 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC6];

outFFTThreeC6 = fft(outThree(6,:), 512); % Out 3
pOutThreeC6 = abs(outFFTThreeC6);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC6);
xMaxOutThreeC6 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC6];

outFFTFourC6 = fft(outFour(6,:), 512); % Out 4
pOutFourC6 = abs(outFFTFourC6);
[maxOutFour, indexMaxOutFour] = max(pOutFourC6);
xMaxOutFourC6 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC6];

outFFTFiveC6 = fft(outFive(6,:), 512); % Out 5
pOutFiveC6 = abs(outFFTFiveC6);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC6);
xMaxOutFiveC6 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC6];

%Channel 7
outFFTOneC7 = fft(outOne(7,:), 512); % Out 1
pOutOneC7 = abs(outFFTOneC7);
[maxOutOne, indexMaxOutOne] = max(pOutOneC7);
xMaxOutOneC7 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC7];

outFFTTwoC7 = fft(outTwo(7,:), 512); % Out 2
pOutTwoC7 = abs(outFFTTwoC7);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC7);
xMaxOutTwoC7 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC7];

outFFTThreeC7 = fft(outThree(7,:), 512); % Out 3
pOutThreeC7 = abs(outFFTThreeC7);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC7);
xMaxOutThreeC7 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC7];

outFFTFourC7 = fft(outFour(7,:), 512); % Out 4
pOutFourC7 = abs(outFFTFourC7);
[maxOutFour, indexMaxOutFour] = max(pOutFourC7);
xMaxOutFourC7 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC7];

outFFTFiveC7 = fft(outFive(7,:), 512); % Out 5
pOutFiveC7 = abs(outFFTFiveC7);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC7);
xMaxOutFiveC7 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC7];

%Channel 8
outFFTOneC8 = fft(outOne(8,:), 512); % Out 1
pOutOneC8 = abs(outFFTOneC8);
[maxOutOne, indexMaxOutOne] = max(pOutOneC8);
xMaxOutOneC8 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC8];

outFFTTwoC8 = fft(outTwo(8,:), 512); % Out 2
pOutTwoC8 = abs(outFFTTwoC8);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC8);
xMaxOutTwoC8 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC8];

outFFTThreeC8 = fft(outThree(8,:), 512); % Out 3
pOutThreeC8 = abs(outFFTThreeC8);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC8);
xMaxOutThreeC8 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC8];

outFFTFourC8 = fft(outFour(8,:), 512); % Out 4
pOutFourC8 = abs(outFFTFourC8);
[maxOutFour, indexMaxOutFour] = max(pOutFourC8);
xMaxOutFourC8 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC8];

outFFTFiveC8 = fft(outFive(8,:), 512); % Out 5
pOutFiveC8 = abs(outFFTFiveC8);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC8);
xMaxOutFiveC8 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC8];

%Channel 9
outFFTOneC9 = fft(outOne(9,:), 512); % Out 1
pOutOneC9 = abs(outFFTOneC9);
[maxOutOne, indexMaxOutOne] = max(pOutOneC9);
xMaxOutOneC9 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC9];

outFFTTwoC9 = fft(outTwo(9,:), 512); % Out 2
pOutTwoC9 = abs(outFFTTwoC9);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC9);
xMaxOutTwoC9 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgOut xMaxOutTwoC9];

outFFTThreeC9 = fft(outThree(9,:), 512); % Out 3
pOutThreeC9 = abs(outFFTThreeC9);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC9);
xMaxOutThreeC9 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC9];

outFFTFourC9 = fft(outFour(9,:), 512); % Out 4
pOutFourC9 = abs(outFFTFourC9);
[maxOutFour, indexMaxOutFour] = max(pOutFourC9);
xMaxOutFourC9 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC9];

outFFTFiveC9 = fft(outFive(9,:), 512); % Out 5
pOutFiveC9 = abs(outFFTFiveC9);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC9);
xMaxOutFiveC9 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC9];

%Channel 10
outFFTOneC10 = fft(outOne(10,:), 512); % Out 1
pOutOneC10 = abs(outFFTOneC10);
[maxOutOne, indexMaxOutOne] = max(pOutOneC10);
xMaxOutOneC10 = f(indexMaxOutOne);
maxAvgOut = [maxAvgOut xMaxOutOneC10];

outFFTTwoC10 = fft(outTwo(10,:), 512); % Out 2
pOutTwoC10 = abs(outFFTTwoC10);
[maxOutTwo, indexMaxOutTwo] = max(pOutTwoC10);
xMaxOutTwoC10 = f(indexMaxOutTwo);
maxAvgOut = [maxAvgLeft xMaxOutTwoC10];

outFFTThreeC10 = fft(outThree(10,:), 512); % Out 3
pOutThreeC10 = abs(outFFTThreeC10);
[maxOutThree, indexMaxOutThree] = max(pOutThreeC10);
xMaxOutThreeC10 = f(indexMaxOutThree);
maxAvgOut = [maxAvgOut xMaxOutThreeC10];

outFFTFourC10 = fft(outFour(10,:), 512); % Out 4
pOutFourC10 = abs(outFFTFourC10);
[maxOutFour, indexMaxOutFour] = max(pOutFourC10);
xMaxOutFourC10 = f(indexMaxOutFour);
maxAvgOut = [maxAvgOut xMaxOutFourC10];

outFFTFiveC10 = fft(outFive(10,:), 512); % Out 5
pOutFiveC10 = abs(outFFTFiveC10);
[maxOutFive, indexMaxOutFive] = max(pOutFiveC10);
xMaxOutFiveC10 = f(indexMaxOutFive);
maxAvgOut = [maxAvgOut xMaxOutFiveC10];

meanMaxOut = mean(nonzeros(maxAvgOut));
outAvgFreq = sprintf('Avg frequency Out = %.3f' , meanMaxOut);
disp(outAvgFreq);

% Stop

maxAvgStop = zeros(0);

%Channel 1
stopFFTOneC1 = fft(stopOne(1,:), 512); % Stop 1
pStopOneC1 = abs(stopFFTOneC1);
[maxStopOne, indexMaxStopOne] = max(pStopOneC1);
xMaxStopOneC1 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC1];

stopFFTTwoC1 = fft(stopTwo(1,:), 512); % Stop 2
pStopTwoC1 = abs(stopFFTTwoC1);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC1);
xMaxStopTwoC1 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC1];

stopFFTThreeC1 = fft(stopThree(1,:), 512); % Stop 3
pStopThreeC1 = abs(stopFFTThreeC1);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC1);
xMaxStopThreeC1 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC1];

stopFFTFourC1 = fft(stopFour(1,:), 512); % Stop 4
pStopFourC1 = abs(stopFFTFourC1);
[maxStopFour, indexMaxStopFour] = max(pStopFourC1);
xMaxStopFourC1 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC1];

stopFFTFiveC1 = fft(stopFive(1,:), 512); % Stop 5
pStopFiveC1 = abs(stopFFTFiveC1);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC1);
xMaxStopFiveC1 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC1];

%Channel 2
stopFFTOneC2 = fft(stopOne(2,:), 512); % Stop 1
pStopOneC2 = abs(stopFFTOneC2);
[maxStopOne, indexMaxStopOne] = max(pStopOneC2);
xMaxStopOneC2 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC2];

stopFFTTwoC2 = fft(stopTwo(2,:), 512); % Stop 2
pStopTwoC2 = abs(stopFFTTwoC2);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC2);
xMaxStopTwoC2 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC2];

stopFFTThreeC2 = fft(stopThree(2,:), 512); % Stop 3
pStopThreeC2 = abs(stopFFTThreeC2);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC2);
xMaxStopThreeC2 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC2];

stopFFTFourC2 = fft(stopFour(2,:), 512); % Stop 4
pStopFourC2 = abs(stopFFTFourC2);
[maxStopFour, indexMaxStopFour] = max(pStopFourC2);
xMaxStopFourC2 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC2];

stopFFTFiveC2 = fft(stopFive(2,:), 512); % Stop 5
pStopFiveC2 = abs(stopFFTFiveC2);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC2);
xMaxStopFiveC2 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC2];

%Channel 3
stopFFTOneC3 = fft(stopOne(3,:), 512); % Stop 1
pStopOneC3 = abs(stopFFTOneC3);
[maxStopOne, indexMaxStopOne] = max(pStopOneC3);
xMaxStopOneC3 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC3];

stopFFTTwoC3 = fft(stopTwo(3,:), 512); % Stop 2
pStopTwoC3 = abs(stopFFTTwoC3);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC3);
xMaxStopTwoC3 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC3];

stopFFTThreeC3 = fft(stopThree(3,:), 512); % Stop 3
pStopThreeC3 = abs(stopFFTThreeC3);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC3);
xMaxStopThreeC3 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC3];

stopFFTFourC3 = fft(stopFour(3,:), 512); % Stop 4
pStopFourC3 = abs(stopFFTFourC3);
[maxStopFour, indexMaxStopFour] = max(pStopFourC3);
xMaxStopFourC3 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC3];

stopFFTFiveC3 = fft(stopFive(3,:), 512); % Stop 5
pStopFiveC3 = abs(stopFFTFiveC3);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC3);
xMaxStopFiveC3 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC3];

%Channel 4
stopFFTOneC4 = fft(stopOne(4,:), 512); % Stop 1
pStopOneC4 = abs(stopFFTOneC4);
[maxStopOne, indexMaxStopOne] = max(pStopOneC4);
xMaxStopOneC4 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC4];

stopFFTTwoC4 = fft(stopTwo(4,:), 512); % Stop 2
pStopTwoC4 = abs(stopFFTTwoC4);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC4);
xMaxStopTwoC4 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC4];

stopFFTThreeC4 = fft(stopThree(4,:), 512); % Stop 3
pStopThreeC4 = abs(stopFFTThreeC4);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC4);
xMaxStopThreeC4 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC4];

stopFFTFourC4 = fft(stopFour(4,:), 512); % Stop 4
pStopFourC4 = abs(stopFFTFourC4);
[maxStopFour, indexMaxStopFour] = max(pStopFourC4);
xMaxStopFourC4 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC4];

stopFFTFiveC4 = fft(stopFive(4,:), 512); % Stop 5
pStopFiveC4 = abs(stopFFTFiveC4);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC4);
xMaxStopFiveC4 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC4];

%Channel 5
stopFFTOneC5 = fft(stopOne(5,:), 512); % Stop 1
pStopOneC5 = abs(stopFFTOneC5);
[maxStopOne, indexMaxStopOne] = max(pStopOneC5);
xMaxStopOneC5 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC5];

stopFFTTwoC5 = fft(stopTwo(5,:), 512); % Stop 2
pStopTwoC5 = abs(stopFFTTwoC5);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC5);
xMaxStopTwoC5 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC5];

stopFFTThreeC5 = fft(stopThree(5,:), 512); % Stop 3
pStopThreeC5 = abs(stopFFTThreeC5);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC5);
xMaxStopThreeC5 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC5];

stopFFTFourC5 = fft(stopFour(5,:), 512); % Stop 4
pStopFourC5 = abs(stopFFTFourC5);
[maxStopFour, indexMaxStopFour] = max(pStopFourC5);
xMaxStopFourC5 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC5];

stopFFTFiveC5 = fft(stopFive(5,:), 512); % Stop 5
pStopFiveC5 = abs(stopFFTFiveC5);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC5);
xMaxStopFiveC5 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC5];

%Channel 6
stopFFTOneC6 = fft(stopOne(6,:), 512); % Stop 1
pStopOneC6 = abs(stopFFTOneC6);
[maxStopOne, indexMaxStopOne] = max(pStopOneC6);
xMaxStopOneC6 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC6];

stopFFTTwoC6 = fft(stopTwo(6,:), 512); % Stop 2
pStopTwoC6 = abs(stopFFTTwoC6);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC6);
xMaxStopTwoC6 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC6];

stopFFTThreeC6 = fft(stopThree(6,:), 512); % Stop 3
pStopThreeC6 = abs(stopFFTThreeC6);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC6);
xMaxStopThreeC6 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC6];

stopFFTFourC6 = fft(stopFour(6,:), 512); % Stop 4
pStopFourC6 = abs(stopFFTFourC6);
[maxStopFour, indexMaxStopFour] = max(pStopFourC6);
xMaxStopFourC6 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC6];

stopFFTFiveC6 = fft(stopFive(6,:), 512); % Stop 5
pStopFiveC6 = abs(stopFFTFiveC6);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC6);
xMaxStopFiveC6 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC6];

%Channel 7
stopFFTOneC7 = fft(stopOne(7,:), 512); % Stop 1
pStopOneC7 = abs(stopFFTOneC7);
[maxStopOne, indexMaxStopOne] = max(pStopOneC7);
xMaxStopOneC7 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC7];

stopFFTTwoC7 = fft(stopTwo(7,:), 512); % Stop 2
pStopTwoC7 = abs(stopFFTTwoC7);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC7);
xMaxStopTwoC7 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC7];

stopFFTThreeC7 = fft(stopThree(7,:), 512); % Stop 3
pStopThreeC7 = abs(stopFFTThreeC7);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC7);
xMaxStopThreeC7 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC7];

stopFFTFourC7 = fft(stopFour(7,:), 512); % Stop 4
pStopFourC7 = abs(stopFFTFourC7);
[maxStopFour, indexMaxStopFour] = max(pStopFourC7);
xMaxStopFourC7 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC7];

stopFFTFiveC7 = fft(stopFive(7,:), 512); % Stop 5
pStopFiveC7 = abs(stopFFTFiveC7);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC7);
xMaxStopFiveC7 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC7];

%Channel 8
stopFFTOneC8 = fft(stopOne(8,:), 512); % Stop 1
pStopOneC8 = abs(stopFFTOneC8);
[maxStopOne, indexMaxStopOne] = max(pStopOneC8);
xMaxStopOneC8 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC8];

stopFFTTwoC8 = fft(stopTwo(8,:), 512); % Stop 2
pStopTwoC8 = abs(stopFFTTwoC8);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC8);
xMaxStopTwoC8 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC8];

stopFFTThreeC8 = fft(stopThree(8,:), 512); % Stop 3
pStopThreeC8 = abs(stopFFTThreeC8);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC8);
xMaxStopThreeC8 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC8];

stopFFTFourC8 = fft(stopFour(8,:), 512); % Stop 4
pStopFourC8 = abs(stopFFTFourC8);
[maxStopFour, indexMaxStopFour] = max(pStopFourC8);
xMaxStopFourC8 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC8];

stopFFTFiveC8 = fft(stopFive(8,:), 512); % Stop 5
pStopFiveC8 = abs(stopFFTFiveC8);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC8);
xMaxStopFiveC8 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC8];

%Channel 9
stopFFTOneC9 = fft(stopOne(9,:), 512); % Stop 1
pStopOneC9 = abs(stopFFTOneC9);
[maxStopOne, indexMaxStopOne] = max(pStopOneC9);
xMaxStopOneC9 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC9];

stopFFTTwoC9 = fft(stopTwo(9,:), 512); % Stop 2
pStopTwoC9 = abs(stopFFTTwoC9);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC9);
xMaxStopTwoC9 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC9];

stopFFTThreeC9 = fft(stopThree(9,:), 512); % Stop 3
pStopThreeC9 = abs(stopFFTThreeC9);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC9);
xMaxStopThreeC9 = f(indexMaxLeftThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC9];

stopFFTFourC9 = fft(stopFour(9,:), 512); % Stop 4
pStopFourC9 = abs(stopFFTFourC9);
[maxStopFour, indexMaxStopFour] = max(pStopFourC9);
xMaxStopFourC9 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC9];

stopFFTFiveC9 = fft(stopFive(9,:), 512); % Stop 5
pStopFiveC9 = abs(stopFFTFiveC9);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC9);
xMaxStopFiveC9 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC9];

%Channel 10
stopFFTOneC10 = fft(stopOne(10,:), 512); % Stop 1
pStopOneC10 = abs(stopFFTOneC10);
[maxStopOne, indexMaxStopOne] = max(pStopOneC10);
xMaxStopOneC10 = f(indexMaxStopOne);
maxAvgStop = [maxAvgStop xMaxStopOneC10];

stopFFTTwoC10 = fft(stopTwo(10,:), 512); % Stop 2
pStopTwoC10 = abs(stopFFTTwoC10);
[maxStopTwo, indexMaxStopTwo] = max(pStopTwoC10);
xMaxStopTwoC10 = f(indexMaxStopTwo);
maxAvgStop = [maxAvgStop xMaxStopTwoC10];

stopFFTThreeC10 = fft(stopThree(10,:), 512); % Stop 3
pStopThreeC10 = abs(stopFFTThreeC10);
[maxStopThree, indexMaxStopThree] = max(pStopThreeC10);
xMaxStopThreeC10 = f(indexMaxStopThree);
maxAvgStop = [maxAvgStop xMaxStopThreeC10];

stopFFTFourC10 = fft(stopFour(10,:), 512); % Stop 4
pStopFourC10 = abs(stopFFTFourC10);
[maxStopFour, indexMaxStopFour] = max(pStopFourC10);
xMaxStopFourC10 = f(indexMaxStopFour);
maxAvgStop = [maxAvgStop xMaxStopFourC10];

stopFFTFiveC10 = fft(stopFive(10,:), 512); % Stop 5
pStopFiveC10 = abs(stopFFTFiveC10);
[maxStopFive, indexMaxStopFive] = max(pStopFiveC10);
xMaxStopFiveC10 = f(indexMaxStopFive);
maxAvgStop = [maxAvgStop xMaxStopFiveC10];

meanMaxStop = mean(nonzeros(maxAvgStop));
stopAvgFreq = sprintf('Avg frequency Stop = %.3f' , meanMaxStop);
disp(stopAvgFreq);

figure(1);
plot(f,pLeftOneC1(1:length(f)), 'r');
title('Left One C1');

figure(6);
%Left
subplot(5,10,1); % Channel 1
plot(f,pLeftOneC1(1:length(f)), 'r');
title('Left One C1');
subplot(5,10,11);
plot(f,pLeftTwoC1(1:length(f)), 'r');
title('Left Two C1');
subplot(5,10,21);
plot(f,pLeftThreeC1(1:length(f)), 'r');
title('Left Three C1');
subplot(5,10,31);
plot(f,pLeftFourC1(1:length(f)), 'r');
title('Left Four C1');
subplot(5,10,41);
plot(f,pLeftFiveC1(1:length(f)), 'r');
title('Left Five C1');

subplot(5,10,2); % Channel 2
plot(f,pLeftOneC2(1:length(f)), 'r');
title('Left One C2');
subplot(5,10,12);
plot(f,pLeftTwoC2(1:length(f)), 'r');
title('Left Two C2');
subplot(5,10,22);
plot(f,pLeftThreeC2(1:length(f)), 'r');
title('Left Three C2');
subplot(5,10,32);
plot(f,pLeftFourC2(1:length(f)), 'r');
title('Left Four C2');
subplot(5,10,42);
plot(f,pLeftFiveC2(1:length(f)), 'r');
title('Left Five C2');

subplot(5,10,3); % Channel 3
plot(f,pLeftOneC3(1:length(f)), 'r');
title('Left One C3');
subplot(5,10,13);
plot(f,pLeftTwoC3(1:length(f)), 'r');
title('Left Two C3');
subplot(5,10,23);
plot(f,pLeftThreeC3(1:length(f)), 'r');
title('Left Three C3');
subplot(5,10,33);
plot(f,pLeftFourC3(1:length(f)), 'r');
title('Left Four C3');
subplot(5,10,43);
plot(f,pLeftFiveC3(1:length(f)), 'r');
title('Left Five C3');

subplot(5,10,4); % Channel 4
plot(f,pLeftOneC4(1:length(f)), 'r');
title('Left One C4');
subplot(5,10,14);
plot(f,pLeftTwoC4(1:length(f)), 'r');
title('Left Two C4');
subplot(5,10,24);
plot(f,pLeftThreeC4(1:length(f)), 'r');
title('Left Three C4');
subplot(5,10,34);
plot(f,pLeftFourC4(1:length(f)), 'r');
title('Left Four C4');
subplot(5,10,44);
plot(f,pLeftFiveC4(1:length(f)), 'r');
title('Left Five C4');

subplot(5,10,5); % Channel 5
plot(f,pLeftOneC5(1:length(f)), 'r');
title('Left One C5');
subplot(5,10,15);
plot(f,pLeftTwoC1(1:length(f)), 'r');
title('Left Two C5');
subplot(5,10,25);
plot(f,pLeftThreeC5(1:length(f)), 'r');
title('Left Three C5');
subplot(5,10,35);
plot(f,pLeftFourC5(1:length(f)), 'r');
title('Left Four C5');
subplot(5,10,45);
plot(f,pLeftFiveC5(1:length(f)), 'r');
title('Left Five C5');

subplot(5,10,6); % Channel 6
plot(f,pLeftOneC6(1:length(f)), 'r');
title('Left One C6');
subplot(5,10,16);
plot(f,pLeftTwoC6(1:length(f)), 'r');
title('Left Two C6');
subplot(5,10,26);
plot(f,pLeftThreeC6(1:length(f)), 'r');
title('Left Three C6');
subplot(5,10,36);
plot(f,pLeftFourC6(1:length(f)), 'r');
title('Left Four C6');
subplot(5,10,46);
plot(f,pLeftFiveC6(1:length(f)), 'r');
title('Left Five C6');

subplot(5,10,7); % Channel 7
plot(f,pLeftOneC7(1:length(f)), 'r');
title('Left One C7');
subplot(5,10,17);
plot(f,pLeftTwoC7(1:length(f)), 'r');
title('Left Two C7');
subplot(5,10,27);
plot(f,pLeftThreeC7(1:length(f)), 'r');
title('Left Three C7');
subplot(5,10,37);
plot(f,pLeftFourC7(1:length(f)), 'r');
title('Left Four C7');
subplot(5,10,47);
plot(f,pLeftFiveC7(1:length(f)), 'r');
title('Left Five C7');

subplot(5,10,8); % Channel 8
plot(f,pLeftOneC8(1:length(f)), 'r');
title('Left One C8');
subplot(5,10,18);
plot(f,pLeftTwoC8(1:length(f)), 'r');
title('Left Two C8');
subplot(5,10,28);
plot(f,pLeftThreeC8(1:length(f)), 'r');
title('Left Three C8');
subplot(5,10,38);
plot(f,pLeftFourC8(1:length(f)), 'r');
title('Left Four C8');
subplot(5,10,48);
plot(f,pLeftFiveC8(1:length(f)), 'r');
title('Left Five C8');

subplot(5,10,9); % Channel 9
plot(f,pLeftOneC9(1:length(f)), 'r');
title('Left One C9');
subplot(5,10,19);
plot(f,pLeftTwoC9(1:length(f)), 'r');
title('Left Two C9');
subplot(5,10,29);
plot(f,pLeftThreeC9(1:length(f)), 'r');
title('Left Three C9');
subplot(5,10,39);
plot(f,pLeftFourC9(1:length(f)), 'r');
title('Left Four C9');
subplot(5,10,49);
plot(f,pLeftFiveC9(1:length(f)), 'r');
title('Left Five C9');

subplot(5,10,10); % Channel 10
plot(f,pLeftOneC10(1:length(f)), 'r');
title('Left One C10');
subplot(5,10,20);
plot(f,pLeftTwoC10(1:length(f)), 'r');
title('Left Two C10');
subplot(5,10,30);
plot(f,pLeftThreeC10(1:length(f)), 'r');
title('Left Three C10');
subplot(5,10,40);
plot(f,pLeftFourC10(1:length(f)), 'r');
title('Left Four C10');
subplot(5,10,50);
plot(f,pLeftFiveC10(1:length(f)), 'r');
title('Left Five C10');

figure(7);
%Right
subplot(5,10,1); % Channel 1
plot(f,pRightOneC1(1:length(f)), 'r');
title('Right One C1');
subplot(5,10,11);
plot(f,pRightTwoC1(1:length(f)), 'r');
title('Right Two C1');
subplot(5,10,21);
plot(f,pRightThreeC1(1:length(f)), 'r');
title('Right Three C1');
subplot(5,10,31);
plot(f,pRightFourC1(1:length(f)), 'r');
title('Right Four C1');
subplot(5,10,41);
plot(f,pRightFiveC1(1:length(f)), 'r');
title('Right Five C1');

subplot(5,10,2); % Channel 2
plot(f,pRightOneC2(1:length(f)), 'r');
title('Right One C2');
subplot(5,10,12);
plot(f,pRightTwoC2(1:length(f)), 'r');
title('Right Two C2');
subplot(5,10,22);
plot(f,pRightThreeC2(1:length(f)), 'r');
title('Right Three C2');
subplot(5,10,32);
plot(f,pRightFourC2(1:length(f)), 'r');
title('Right Four C2');
subplot(5,10,42);
plot(f,pRightFiveC2(1:length(f)), 'r');
title('Right Five C2');

subplot(5,10,3); % Channel 3
plot(f,pRightOneC3(1:length(f)), 'r');
title('Right One C3');
subplot(5,10,13);
plot(f,pRightTwoC3(1:length(f)), 'r');
title('Right Two C3');
subplot(5,10,23);
plot(f,pRightThreeC3(1:length(f)), 'r');
title('Right Three C3');
subplot(5,10,33);
plot(f,pRightFourC3(1:length(f)), 'r');
title('Right Four C3');
subplot(5,10,43);
plot(f,pRightFiveC3(1:length(f)), 'r');
title('Right Five C3');

subplot(5,10,4); % Channel 4
plot(f,pRightOneC4(1:length(f)), 'r');
title('Right One C4');
subplot(5,10,14);
plot(f,pRightTwoC4(1:length(f)), 'r');
title('Right Two C4');
subplot(5,10,24);
plot(f,pRightThreeC4(1:length(f)), 'r');
title('Right Three C4');
subplot(5,10,34);
plot(f,pRightFourC4(1:length(f)), 'r');
title('Right Four C4');
subplot(5,10,44);
plot(f,pRightFiveC4(1:length(f)), 'r');
title('Right Five C4');

subplot(5,10,5); % Channel 5
plot(f,pRightOneC5(1:length(f)), 'r');
title('Right One C5');
subplot(5,10,15);
plot(f,pRightTwoC1(1:length(f)), 'r');
title('Right Two C5');
subplot(5,10,25);
plot(f,pRightThreeC5(1:length(f)), 'r');
title('Right Three C5');
subplot(5,10,35);
plot(f,pRightFourC5(1:length(f)), 'r');
title('Right Four C5');
subplot(5,10,45);
plot(f,pRightFiveC5(1:length(f)), 'r');
title('Right Five C5');

subplot(5,10,6); % Channel 6
plot(f,pRightOneC6(1:length(f)), 'r');
title('Right One C6');
subplot(5,10,16);
plot(f,pRightTwoC6(1:length(f)), 'r');
title('Right Two C6');
subplot(5,10,26);
plot(f,pRightThreeC6(1:length(f)), 'r');
title('Right Three C6');
subplot(5,10,36);
plot(f,pRightFourC6(1:length(f)), 'r');
title('Right Four C6');
subplot(5,10,46);
plot(f,pRightFiveC6(1:length(f)), 'r');
title('Right Five C6');

subplot(5,10,7); % Channel 7
plot(f,pRightOneC7(1:length(f)), 'r');
title('Right One C7');
subplot(5,10,17);
plot(f,pRightTwoC7(1:length(f)), 'r');
title('Right Two C7');
subplot(5,10,27);
plot(f,pRightThreeC7(1:length(f)), 'r');
title('Right Three C7');
subplot(5,10,37);
plot(f,pRightFourC7(1:length(f)), 'r');
title('Right Four C7');
subplot(5,10,47);
plot(f,pRightFiveC7(1:length(f)), 'r');
title('Right Five C7');

subplot(5,10,8); % Channel 8
plot(f,pRightOneC8(1:length(f)), 'r');
title('Right One C8');
subplot(5,10,18);
plot(f,pRightTwoC8(1:length(f)), 'r');
title('Right Two C8');
subplot(5,10,28);
plot(f,pRightThreeC8(1:length(f)), 'r');
title('Right Three C8');
subplot(5,10,38);
plot(f,pRightFourC8(1:length(f)), 'r');
title('Right Four C8');
subplot(5,10,48);
plot(f,pRightFiveC8(1:length(f)), 'r');
title('Right Five C8');

subplot(5,10,9); % Channel 9
plot(f,pRightOneC9(1:length(f)), 'r');
title('Right One C9');
subplot(5,10,19);
plot(f,pRightTwoC9(1:length(f)), 'r');
title('Right Two C9');
subplot(5,10,29);
plot(f,pRightThreeC9(1:length(f)), 'r');
title('Right Three C9');
subplot(5,10,39);
plot(f,pRightFourC9(1:length(f)), 'r');
title('Right Four C9');
subplot(5,10,49);
plot(f,pRightFiveC9(1:length(f)), 'r');
title('Right Five C9');

subplot(5,10,10); % Channel 10
plot(f,pRightOneC10(1:length(f)), 'r');
title('Right One C10');
subplot(5,10,20);
plot(f,pRightTwoC10(1:length(f)), 'r');
title('Right Two C10');
subplot(5,10,30);
plot(f,pRightThreeC10(1:length(f)), 'r');
title('Right Three C10');
subplot(5,10,40);
plot(f,pRightFourC10(1:length(f)), 'r');
title('Right Four C10');
subplot(5,10,50);
plot(f,pRightFiveC10(1:length(f)), 'r');
title('Right Five C10');

figure(8);
%Up
subplot(5,10,1); % Channel 1
plot(f,pUpOneC1(1:length(f)), 'r');
title('Up One C1');
subplot(5,10,11);
plot(f,pUpTwoC1(1:length(f)), 'r');
title('Up Two C1');
subplot(5,10,21);
plot(f,pUpThreeC1(1:length(f)), 'r');
title('Up Three C1');
subplot(5,10,31);
plot(f,pUpFourC1(1:length(f)), 'r');
title('Up Four C1');
subplot(5,10,41);
plot(f,pUpFiveC1(1:length(f)), 'r');
title('Up Five C1');

subplot(5,10,2); % Channel 2
plot(f,pUpOneC2(1:length(f)), 'r');
title('Up One C2');
subplot(5,10,12);
plot(f,pUpTwoC2(1:length(f)), 'r');
title('Up Two C2');
subplot(5,10,22);
plot(f,pUpThreeC2(1:length(f)), 'r');
title('Up Three C2');
subplot(5,10,32);
plot(f,pUpFourC2(1:length(f)), 'r');
title('Up Four C2');
subplot(5,10,42);
plot(f,pUpFiveC2(1:length(f)), 'r');
title('Up Five C2');

subplot(5,10,3); % Channel 3
plot(f,pUpOneC3(1:length(f)), 'r');
title('Up One C3');
subplot(5,10,13);
plot(f,pUpTwoC3(1:length(f)), 'r');
title('Up Two C3');
subplot(5,10,23);
plot(f,pUpThreeC3(1:length(f)), 'r');
title('Up Three C3');
subplot(5,10,33);
plot(f,pUpFourC3(1:length(f)), 'r');
title('Up Four C3');
subplot(5,10,43);
plot(f,pUpFiveC3(1:length(f)), 'r');
title('Up Five C3');

subplot(5,10,4); % Channel 4
plot(f,pUpOneC4(1:length(f)), 'r');
title('Up One C4');
subplot(5,10,14);
plot(f,pUpTwoC4(1:length(f)), 'r');
title('Up Two C4');
subplot(5,10,24);
plot(f,pUpThreeC4(1:length(f)), 'r');
title('Up Three C4');
subplot(5,10,34);
plot(f,pUpFourC4(1:length(f)), 'r');
title('Up Four C4');
subplot(5,10,44);
plot(f,pUpFiveC4(1:length(f)), 'r');
title('Up Five C4');

subplot(5,10,5); % Channel 5
plot(f,pUpOneC5(1:length(f)), 'r');
title('Up One C5');
subplot(5,10,15);
plot(f,pUpTwoC1(1:length(f)), 'r');
title('Up Two C5');
subplot(5,10,25);
plot(f,pUpThreeC5(1:length(f)), 'r');
title('Up Three C5');
subplot(5,10,35);
plot(f,pUpFourC5(1:length(f)), 'r');
title('Up Four C5');
subplot(5,10,45);
plot(f,pUpFiveC5(1:length(f)), 'r');
title('Up Five C5');

subplot(5,10,6); % Channel 6
plot(f,pUpOneC6(1:length(f)), 'r');
title('Up One C6');
subplot(5,10,16);
plot(f,pUpTwoC6(1:length(f)), 'r');
title('Up Two C6');
subplot(5,10,26);
plot(f,pUpThreeC6(1:length(f)), 'r');
title('Up Three C6');
subplot(5,10,36);
plot(f,pUpFourC6(1:length(f)), 'r');
title('Up Four C6');
subplot(5,10,46);
plot(f,pUpFiveC6(1:length(f)), 'r');
title('Up Five C6');

subplot(5,10,7); % Channel 7
plot(f,pUpOneC7(1:length(f)), 'r');
title('Up One C7');
subplot(5,10,17);
plot(f,pUpTwoC7(1:length(f)), 'r');
title('Up Two C7');
subplot(5,10,27);
plot(f,pUpThreeC7(1:length(f)), 'r');
title('Up Three C7');
subplot(5,10,37);
plot(f,pUpFourC7(1:length(f)), 'r');
title('Up Four C7');
subplot(5,10,47);
plot(f,pUpFiveC7(1:length(f)), 'r');
title('Up Five C7');

subplot(5,10,8); % Channel 8
plot(f,pUpOneC8(1:length(f)), 'r');
title('Up One C8');
subplot(5,10,18);
plot(f,pUpTwoC8(1:length(f)), 'r');
title('Up Two C8');
subplot(5,10,28);
plot(f,pUpThreeC8(1:length(f)), 'r');
title('Up Three C8');
subplot(5,10,38);
plot(f,pUpFourC8(1:length(f)), 'r');
title('Up Four C8');
subplot(5,10,48);
plot(f,pUpFiveC8(1:length(f)), 'r');
title('Up Five C8');

subplot(5,10,9); % Channel 9
plot(f,pUpOneC9(1:length(f)), 'r');
title('Up One C9');
subplot(5,10,19);
plot(f,pUpTwoC9(1:length(f)), 'r');
title('Up Two C9');
subplot(5,10,29);
plot(f,pUpThreeC9(1:length(f)), 'r');
title('Up Three C9');
subplot(5,10,39);
plot(f,pUpFourC9(1:length(f)), 'r');
title('Up Four C9');
subplot(5,10,49);
plot(f,pUpFiveC9(1:length(f)), 'r');
title('Up Five C9');

subplot(5,10,10); % Channel 10
plot(f,pUpOneC10(1:length(f)), 'r');
title('Up One C10');
subplot(5,10,20);
plot(f,pUpTwoC10(1:length(f)), 'r');
title('Up Two C10');
subplot(5,10,30);
plot(f,pUpThreeC10(1:length(f)), 'r');
title('Up Three C10');
subplot(5,10,40);
plot(f,pUpFourC10(1:length(f)), 'r');
title('Up Four C10');
subplot(5,10,50);
plot(f,pUpFiveC10(1:length(f)), 'r');
title('Up Five C10');

figure(9);
%Down
subplot(5,10,1); % Channel 1
plot(f,pDownOneC1(1:length(f)), 'r');
title('Down One C1');
subplot(5,10,11);
plot(f,pDownTwoC1(1:length(f)), 'r');
title('Down Two C1');
subplot(5,10,21);
plot(f,pDownThreeC1(1:length(f)), 'r');
title('Down Three C1');
subplot(5,10,31);
plot(f,pDownFourC1(1:length(f)), 'r');
title('Down Four C1');
subplot(5,10,41);
plot(f,pDownFiveC1(1:length(f)), 'r');
title('Down Five C1');

subplot(5,10,2); % Channel 2
plot(f,pDownOneC2(1:length(f)), 'r');
title('Down One C2');
subplot(5,10,12);
plot(f,pDownTwoC2(1:length(f)), 'r');
title('Down Two C2');
subplot(5,10,22);
plot(f,pDownThreeC2(1:length(f)), 'r');
title('Down Three C2');
subplot(5,10,32);
plot(f,pDownFourC2(1:length(f)), 'r');
title('Down Four C2');
subplot(5,10,42);
plot(f,pDownFiveC2(1:length(f)), 'r');
title('Down Five C2');

subplot(5,10,3); % Channel 3
plot(f,pDownOneC3(1:length(f)), 'r');
title('Down One C3');
subplot(5,10,13);
plot(f,pDownTwoC3(1:length(f)), 'r');
title('Down Two C3');
subplot(5,10,23);
plot(f,pDownThreeC3(1:length(f)), 'r');
title('Down Three C3');
subplot(5,10,33);
plot(f,pDownFourC3(1:length(f)), 'r');
title('Down Four C3');
subplot(5,10,43);
plot(f,pDownFiveC3(1:length(f)), 'r');
title('Down Five C3');

subplot(5,10,4); % Channel 4
plot(f,pDownOneC4(1:length(f)), 'r');
title('Down One C4');
subplot(5,10,14);
plot(f,pDownTwoC4(1:length(f)), 'r');
title('Down Two C4');
subplot(5,10,24);
plot(f,pDownThreeC4(1:length(f)), 'r');
title('Down Three C4');
subplot(5,10,34);
plot(f,pDownFourC4(1:length(f)), 'r');
title('Down Four C4');
subplot(5,10,44);
plot(f,pDownFiveC4(1:length(f)), 'r');
title('Down Five C4');

subplot(5,10,5); % Channel 5
plot(f,pDownOneC5(1:length(f)), 'r');
title('Down One C5');
subplot(5,10,15);
plot(f,pDownTwoC1(1:length(f)), 'r');
title('Down Two C5');
subplot(5,10,25);
plot(f,pDownThreeC5(1:length(f)), 'r');
title('Down Three C5');
subplot(5,10,35);
plot(f,pDownFourC5(1:length(f)), 'r');
title('Down Four C5');
subplot(5,10,45);
plot(f,pDownFiveC5(1:length(f)), 'r');
title('Down Five C5');

subplot(5,10,6); % Channel 6
plot(f,pDownOneC6(1:length(f)), 'r');
title('Down One C6');
subplot(5,10,16);
plot(f,pDownTwoC6(1:length(f)), 'r');
title('Down Two C6');
subplot(5,10,26);
plot(f,pDownThreeC6(1:length(f)), 'r');
title('Down Three C6');
subplot(5,10,36);
plot(f,pDownFourC6(1:length(f)), 'r');
title('Down Four C6');
subplot(5,10,46);
plot(f,pDownFiveC6(1:length(f)), 'r');
title('Down Five C6');

subplot(5,10,7); % Channel 7
plot(f,pDownOneC7(1:length(f)), 'r');
title('Down One C7');
subplot(5,10,17);
plot(f,pDownTwoC7(1:length(f)), 'r');
title('Down Two C7');
subplot(5,10,27);
plot(f,pDownThreeC7(1:length(f)), 'r');
title('Down Three C7');
subplot(5,10,37);
plot(f,pDownFourC7(1:length(f)), 'r');
title('Down Four C7');
subplot(5,10,47);
plot(f,pDownFiveC7(1:length(f)), 'r');
title('Down Five C7');

subplot(5,10,8); % Channel 8
plot(f,pDownOneC8(1:length(f)), 'r');
title('Down One C8');
subplot(5,10,18);
plot(f,pDownTwoC8(1:length(f)), 'r');
title('Down Two C8');
subplot(5,10,28);
plot(f,pDownThreeC8(1:length(f)), 'r');
title('Down Three C8');
subplot(5,10,38);
plot(f,pDownFourC8(1:length(f)), 'r');
title('Down Four C8');
subplot(5,10,48);
plot(f,pDownFiveC8(1:length(f)), 'r');
title('Down Five C8');

subplot(5,10,9); % Channel 9
plot(f,pDownOneC9(1:length(f)), 'r');
title('Down One C9');
subplot(5,10,19);
plot(f,pDownTwoC9(1:length(f)), 'r');
title('Down Two C9');
subplot(5,10,29);
plot(f,pDownThreeC9(1:length(f)), 'r');
title('Down Three C9');
subplot(5,10,39);
plot(f,pDownFourC9(1:length(f)), 'r');
title('Down Four C9');
subplot(5,10,49);
plot(f,pDownFiveC9(1:length(f)), 'r');
title('Down Five C9');

subplot(5,10,10); % Channel 10
plot(f,pDownOneC10(1:length(f)), 'r');
title('Down One C10');
subplot(5,10,20);
plot(f,pDownTwoC10(1:length(f)), 'r');
title('Down Two C10');
subplot(5,10,30);
plot(f,pDownThreeC10(1:length(f)), 'r');
title('Down Three C10');
subplot(5,10,40);
plot(f,pDownFourC10(1:length(f)), 'r');
title('Down Four C10');
subplot(5,10,50);
plot(f,pDownFiveC10(1:length(f)), 'r');
title('Down Five C10');

figure(10);
%In
subplot(5,10,1); % Channel 1
plot(f,pInOneC1(1:length(f)), 'r');
title('In One C1');
subplot(5,10,11);
plot(f,pInTwoC1(1:length(f)), 'r');
title('In Two C1');
subplot(5,10,21);
plot(f,pInThreeC1(1:length(f)), 'r');
title('In Three C1');
subplot(5,10,31);
plot(f,pInFourC1(1:length(f)), 'r');
title('In Four C1');
subplot(5,10,41);
plot(f,pInFiveC1(1:length(f)), 'r');
title('In Five C1');

subplot(5,10,2); % Channel 2
plot(f,pInOneC2(1:length(f)), 'r');
title('In One C2');
subplot(5,10,12);
plot(f,pInTwoC2(1:length(f)), 'r');
title('In Two C2');
subplot(5,10,22);
plot(f,pInThreeC2(1:length(f)), 'r');
title('In Three C2');
subplot(5,10,32);
plot(f,pInFourC2(1:length(f)), 'r');
title('In Four C2');
subplot(5,10,42);
plot(f,pInFiveC2(1:length(f)), 'r');
title('In Five C2');

subplot(5,10,3); % Channel 3
plot(f,pInOneC3(1:length(f)), 'r');
title('In One C3');
subplot(5,10,13);
plot(f,pInTwoC3(1:length(f)), 'r');
title('In Two C3');
subplot(5,10,23);
plot(f,pInThreeC3(1:length(f)), 'r');
title('In Three C3');
subplot(5,10,33);
plot(f,pInFourC3(1:length(f)), 'r');
title('In Four C3');
subplot(5,10,43);
plot(f,pInFiveC3(1:length(f)), 'r');
title('In Five C3');

subplot(5,10,4); % Channel 4
plot(f,pInOneC4(1:length(f)), 'r');
title('In One C4');
subplot(5,10,14);
plot(f,pInTwoC4(1:length(f)), 'r');
title('In Two C4');
subplot(5,10,24);
plot(f,pInThreeC4(1:length(f)), 'r');
title('In Three C4');
subplot(5,10,34);
plot(f,pInFourC4(1:length(f)), 'r');
title('In Four C4');
subplot(5,10,44);
plot(f,pInFiveC4(1:length(f)), 'r');
title('In Five C4');

subplot(5,10,5); % Channel 5
plot(f,pInOneC5(1:length(f)), 'r');
title('In One C5');
subplot(5,10,15);
plot(f,pInTwoC1(1:length(f)), 'r');
title('In Two C5');
subplot(5,10,25);
plot(f,pInThreeC5(1:length(f)), 'r');
title('In Three C5');
subplot(5,10,35);
plot(f,pInFourC5(1:length(f)), 'r');
title('In Four C5');
subplot(5,10,45);
plot(f,pInFiveC5(1:length(f)), 'r');
title('In Five C5');

subplot(5,10,6); % Channel 6
plot(f,pInOneC6(1:length(f)), 'r');
title('In One C6');
subplot(5,10,16);
plot(f,pInTwoC6(1:length(f)), 'r');
title('In Two C6');
subplot(5,10,26);
plot(f,pInThreeC6(1:length(f)), 'r');
title('In Three C6');
subplot(5,10,36);
plot(f,pInFourC6(1:length(f)), 'r');
title('In Four C6');
subplot(5,10,46);
plot(f,pInFiveC6(1:length(f)), 'r');
title('In Five C6');

subplot(5,10,7); % Channel 7
plot(f,pInOneC7(1:length(f)), 'r');
title('In One C7');
subplot(5,10,17);
plot(f,pInTwoC7(1:length(f)), 'r');
title('In Two C7');
subplot(5,10,27);
plot(f,pInThreeC7(1:length(f)), 'r');
title('In Three C7');
subplot(5,10,37);
plot(f,pInFourC7(1:length(f)), 'r');
title('In Four C7');
subplot(5,10,47);
plot(f,pInFiveC7(1:length(f)), 'r');
title('In Five C7');

subplot(5,10,8); % Channel 8
plot(f,pInOneC8(1:length(f)), 'r');
title('In One C8');
subplot(5,10,18);
plot(f,pInTwoC8(1:length(f)), 'r');
title('In Two C8');
subplot(5,10,28);
plot(f,pInThreeC8(1:length(f)), 'r');
title('In Three C8');
subplot(5,10,38);
plot(f,pInFourC8(1:length(f)), 'r');
title('In Four C8');
subplot(5,10,48);
plot(f,pInFiveC8(1:length(f)), 'r');
title('In Five C8');

subplot(5,10,9); % Channel 9
plot(f,pInOneC9(1:length(f)), 'r');
title('In One C9');
subplot(5,10,19);
plot(f,pInTwoC9(1:length(f)), 'r');
title('In Two C9');
subplot(5,10,29);
plot(f,pInThreeC9(1:length(f)), 'r');
title('In Three C9');
subplot(5,10,39);
plot(f,pInFourC9(1:length(f)), 'r');
title('In Four C9');
subplot(5,10,49);
plot(f,pInFiveC9(1:length(f)), 'r');
title('In Five C9');

subplot(5,10,10); % Channel 10
plot(f,pInOneC10(1:length(f)), 'r');
title('In One C10');
subplot(5,10,20);
plot(f,pInTwoC10(1:length(f)), 'r');
title('In Two C10');
subplot(5,10,30);
plot(f,pInThreeC10(1:length(f)), 'r');
title('In Three C10');
subplot(5,10,40);
plot(f,pInFourC10(1:length(f)), 'r');
title('In Four C10');
subplot(5,10,50);
plot(f,pInFiveC10(1:length(f)), 'r');
title('In Five C10');

figure(11);
%Out
subplot(5,10,1); % Channel 1
plot(f,pOutOneC1(1:length(f)), 'r');
title('Out One C1');
subplot(5,10,11);
plot(f,pOutTwoC1(1:length(f)), 'r');
title('Out Two C1');
subplot(5,10,21);
plot(f,pOutThreeC1(1:length(f)), 'r');
title('Out Three C1');
subplot(5,10,31);
plot(f,pOutFourC1(1:length(f)), 'r');
title('Out Four C1');
subplot(5,10,41);
plot(f,pOutFiveC1(1:length(f)), 'r');
title('Out Five C1');

subplot(5,10,2); % Channel 2
plot(f,pOutOneC2(1:length(f)), 'r');
title('Out One C2');
subplot(5,10,12);
plot(f,pOutTwoC2(1:length(f)), 'r');
title('Out Two C2');
subplot(5,10,22);
plot(f,pOutThreeC2(1:length(f)), 'r');
title('Out Three C2');
subplot(5,10,32);
plot(f,pOutFourC2(1:length(f)), 'r');
title('Out Four C2');
subplot(5,10,42);
plot(f,pOutFiveC2(1:length(f)), 'r');
title('Out Five C2');

subplot(5,10,3); % Channel 3
plot(f,pOutOneC3(1:length(f)), 'r');
title('Out One C3');
subplot(5,10,13);
plot(f,pOutTwoC3(1:length(f)), 'r');
title('Out Two C3');
subplot(5,10,23);
plot(f,pOutThreeC3(1:length(f)), 'r');
title('Out Three C3');
subplot(5,10,33);
plot(f,pOutFourC3(1:length(f)), 'r');
title('Out Four C3');
subplot(5,10,43);
plot(f,pOutFiveC3(1:length(f)), 'r');
title('Out Five C3');

subplot(5,10,4); % Channel 4
plot(f,pOutOneC4(1:length(f)), 'r');
title('Out One C4');
subplot(5,10,14);
plot(f,pOutTwoC4(1:length(f)), 'r');
title('Out Two C4');
subplot(5,10,24);
plot(f,pOutThreeC4(1:length(f)), 'r');
title('Out Three C4');
subplot(5,10,34);
plot(f,pOutFourC4(1:length(f)), 'r');
title('Out Four C4');
subplot(5,10,44);
plot(f,pOutFiveC4(1:length(f)), 'r');
title('Out Five C4');

subplot(5,10,5); % Channel 5
plot(f,pOutOneC5(1:length(f)), 'r');
title('Out One C5');
subplot(5,10,15);
plot(f,pOutTwoC1(1:length(f)), 'r');
title('Out Two C5');
subplot(5,10,25);
plot(f,pOutThreeC5(1:length(f)), 'r');
title('Out Three C5');
subplot(5,10,35);
plot(f,pOutFourC5(1:length(f)), 'r');
title('Out Four C5');
subplot(5,10,45);
plot(f,pOutFiveC5(1:length(f)), 'r');
title('Out Five C5');

subplot(5,10,6); % Channel 6
plot(f,pOutOneC6(1:length(f)), 'r');
title('Out One C6');
subplot(5,10,16);
plot(f,pOutTwoC6(1:length(f)), 'r');
title('Out Two C6');
subplot(5,10,26);
plot(f,pOutThreeC6(1:length(f)), 'r');
title('Out Three C6');
subplot(5,10,36);
plot(f,pOutFourC6(1:length(f)), 'r');
title('Out Four C6');
subplot(5,10,46);
plot(f,pOutFiveC6(1:length(f)), 'r');
title('Out Five C6');

subplot(5,10,7); % Channel 7
plot(f,pOutOneC7(1:length(f)), 'r');
title('Out One C7');
subplot(5,10,17);
plot(f,pOutTwoC7(1:length(f)), 'r');
title('Out Two C7');
subplot(5,10,27);
plot(f,pOutThreeC7(1:length(f)), 'r');
title('Out Three C7');
subplot(5,10,37);
plot(f,pOutFourC7(1:length(f)), 'r');
title('Out Four C7');
subplot(5,10,47);
plot(f,pOutFiveC7(1:length(f)), 'r');
title('Out Five C7');

subplot(5,10,8); % Channel 8
plot(f,pOutOneC8(1:length(f)), 'r');
title('Out One C8');
subplot(5,10,18);
plot(f,pOutTwoC8(1:length(f)), 'r');
title('Out Two C8');
subplot(5,10,28);
plot(f,pOutThreeC8(1:length(f)), 'r');
title('Out Three C8');
subplot(5,10,38);
plot(f,pOutFourC8(1:length(f)), 'r');
title('Out Four C8');
subplot(5,10,48);
plot(f,pOutFiveC8(1:length(f)), 'r');
title('Out Five C8');

subplot(5,10,9); % Channel 9
plot(f,pOutOneC9(1:length(f)), 'r');
title('Out One C9');
subplot(5,10,19);
plot(f,pOutTwoC9(1:length(f)), 'r');
title('Out Two C9');
subplot(5,10,29);
plot(f,pOutThreeC9(1:length(f)), 'r');
title('Out Three C9');
subplot(5,10,39);
plot(f,pOutFourC9(1:length(f)), 'r');
title('Out Four C9');
subplot(5,10,49);
plot(f,pOutFiveC9(1:length(f)), 'r');
title('Out Five C9');

subplot(5,10,10); % Channel 10
plot(f,pOutOneC10(1:length(f)), 'r');
title('StoOutp One C10');
subplot(5,10,20);
plot(f,pOutTwoC10(1:length(f)), 'r');
title('Out Two C10');
subplot(5,10,30);
plot(f,pOutThreeC10(1:length(f)), 'r');
title('Out Three C10');
subplot(5,10,40);
plot(f,pOutFourC10(1:length(f)), 'r');
title('Out Four C10');
subplot(5,10,50);
plot(f,pOutFiveC10(1:length(f)), 'r');
title('Out Five C10');

figure(12);
%Stop
subplot(5,10,1); % Channel 1
plot(f,pStopOneC1(1:length(f)), 'r');
title('Stop One C1');
subplot(5,10,11);
plot(f,pStopTwoC1(1:length(f)), 'r');
title('Stop Two C1');
subplot(5,10,21);
plot(f,pStopThreeC1(1:length(f)), 'r');
title('Stop Three C1');
subplot(5,10,31);
plot(f,pStopFourC1(1:length(f)), 'r');
title('Stop Four C1');
subplot(5,10,41);
plot(f,pStopFiveC1(1:length(f)), 'r');
title('Stop Five C1');

subplot(5,10,2); % Channel 2
plot(f,pStopOneC2(1:length(f)), 'r');
title('Stop One C2');
subplot(5,10,12);
plot(f,pStopTwoC2(1:length(f)), 'r');
title('Stop Two C2');
subplot(5,10,22);
plot(f,pStopThreeC2(1:length(f)), 'r');
title('Stop Three C2');
subplot(5,10,32);
plot(f,pStopFourC2(1:length(f)), 'r');
title('Stop Four C2');
subplot(5,10,42);
plot(f,pStopFiveC2(1:length(f)), 'r');
title('Stop Five C2');

subplot(5,10,3); % Channel 3
plot(f,pStopOneC3(1:length(f)), 'r');
title('Stop One C3');
subplot(5,10,13);
plot(f,pStopTwoC3(1:length(f)), 'r');
title('Stop Two C3');
subplot(5,10,23);
plot(f,pStopThreeC3(1:length(f)), 'r');
title('Stop Three C3');
subplot(5,10,33);
plot(f,pStopFourC3(1:length(f)), 'r');
title('Stop Four C3');
subplot(5,10,43);
plot(f,pStopFiveC3(1:length(f)), 'r');
title('Stop Five C3');

subplot(5,10,4); % Channel 4
plot(f,pStopOneC4(1:length(f)), 'r');
title('Stop One C4');
subplot(5,10,14);
plot(f,pStopTwoC4(1:length(f)), 'r');
title('Stop Two C4');
subplot(5,10,24);
plot(f,pStopThreeC4(1:length(f)), 'r');
title('Stop Three C4');
subplot(5,10,34);
plot(f,pStopFourC4(1:length(f)), 'r');
title('Stop Four C4');
subplot(5,10,44);
plot(f,pStopFiveC4(1:length(f)), 'r');
title('Stop Five C4');

subplot(5,10,5); % Channel 5
plot(f,pStopOneC5(1:length(f)), 'r');
title('Stop One C5');
subplot(5,10,15);
plot(f,pStopTwoC1(1:length(f)), 'r');
title('Stop Two C5');
subplot(5,10,25);
plot(f,pStopThreeC5(1:length(f)), 'r');
title('Stop Three C5');
subplot(5,10,35);
plot(f,pStopFourC5(1:length(f)), 'r');
title('Stop Four C5');
subplot(5,10,45);
plot(f,pStopFiveC5(1:length(f)), 'r');
title('Stop Five C5');

subplot(5,10,6); % Channel 6
plot(f,pStopOneC6(1:length(f)), 'r');
title('Stop One C6');
subplot(5,10,16);
plot(f,pStopTwoC6(1:length(f)), 'r');
title('Stop Two C6');
subplot(5,10,26);
plot(f,pStopThreeC6(1:length(f)), 'r');
title('Stop Three C6');
subplot(5,10,36);
plot(f,pStopFourC6(1:length(f)), 'r');
title('Stop Four C6');
subplot(5,10,46);
plot(f,pStopFiveC6(1:length(f)), 'r');
title('Stop Five C6');

subplot(5,10,7); % Channel 7
plot(f,pStopOneC7(1:length(f)), 'r');
title('Stop One C7');
subplot(5,10,17);
plot(f,pStopTwoC7(1:length(f)), 'r');
title('Stop Two C7');
subplot(5,10,27);
plot(f,pStopThreeC7(1:length(f)), 'r');
title('Stop Three C7');
subplot(5,10,37);
plot(f,pStopFourC7(1:length(f)), 'r');
title('Stop Four C7');
subplot(5,10,47);
plot(f,pStopFiveC7(1:length(f)), 'r');
title('Stop Five C7');

subplot(5,10,8); % Channel 8
plot(f,pStopOneC8(1:length(f)), 'r');
title('Stop One C8');
subplot(5,10,18);
plot(f,pStopTwoC8(1:length(f)), 'r');
title('Stop Two C8');
subplot(5,10,28);
plot(f,pStopThreeC8(1:length(f)), 'r');
title('Stop Three C8');
subplot(5,10,38);
plot(f,pStopFourC8(1:length(f)), 'r');
title('Stop Four C8');
subplot(5,10,48);
plot(f,pStopFiveC8(1:length(f)), 'r');
title('Stop Five C8');

subplot(5,10,9); % Channel 9
plot(f,pStopOneC9(1:length(f)), 'r');
title('Stop One C9');
subplot(5,10,19);
plot(f,pStopTwoC9(1:length(f)), 'r');
title('Stop Two C9');
subplot(5,10,29);
plot(f,pStopThreeC9(1:length(f)), 'r');
title('Stop Three C9');
subplot(5,10,39);
plot(f,pStopFourC9(1:length(f)), 'r');
title('Stop Four C9');
subplot(5,10,49);
plot(f,pStopFiveC9(1:length(f)), 'r');
title('Stop Five C9');

subplot(5,10,10); % Channel 10
plot(f,pStopOneC10(1:length(f)), 'r');
title('Stop One C10');
subplot(5,10,20);
plot(f,pStopTwoC10(1:length(f)), 'r');
title('Stop Two C10');
subplot(5,10,30);
plot(f,pStopThreeC10(1:length(f)), 'r');
title('Stop Three C10');
subplot(5,10,40);
plot(f,pStopFourC10(1:length(f)), 'r');
title('Stop Four C10');
subplot(5,10,50);
plot(f,pStopFiveC10(1:length(f)), 'r');
title('Stop Five C10');
