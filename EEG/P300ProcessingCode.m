clc
clear all
close all

data = importdata('E:\BCIs\session3.mat'); %Change location

idOne = input('enter the ID of the first letter '); %L 12
idTwo = input('Enter the ID of the second letter '); %8 34
idThree = input('Enter the ID of the third letter '); %T 20 
idFour = input('Enter the ID of the fourth letter '); %T 20

timeBefore = .1;
timeAfter = .7;
nFlashes = 8;
ending = 0;

time = data(1,1:end);
amplitude = data(2,1:end);
sampleRate = time(2) - time(1);
cellsBefore = round((1/sampleRate)*timeBefore);
cellsAfter = round((1/sampleRate)*timeAfter);
t = -.1:sampleRate:.7;

idOneArray = zeros(5,0);
idTwoArray = zeros(5,0);
idThreeArray = zeros(5,0);
idFourArray = zeros(5,0);

countIdOne = 0;
countIdTwo = 0;
countIdThree = 0;
countIdFour = 0;

%idOne
for  c = 1:length(data)
    if data(4,c) == 1 && data(3,c) == idOne && data(3,c+3) == idOne && data(3,c+4) ~= idOne
        countIdOne = countIdOne + 1;
        if countIdOne <= nFlashes
            for e = -cellsBefore:cellsAfter 
                idOneArray = [idOneArray(1,:) time(c+e) ; idOneArray(2,:) amplitude(c+e) ; idOneArray(3,:) data(3,c+e) ; idOneArray(4,:) data(4,c+e); idOneArray(5,:) countIdOne];
                ending = c + e;
            end
        end
    end
end

%idTwo
for  c = ending:length(data)
    if data(4,c) == 1 && data(3,c) == idTwo && data(3,c+3) == idTwo && data(3,c+4) ~= idTwo
        countIdTwo = countIdTwo + 1;
        if countIdTwo <= nFlashes
            for e = -cellsBefore:cellsAfter 
                idTwoArray = [idTwoArray(1,:) time(c+e) ; idTwoArray(2,:) amplitude(c+e) ; idTwoArray(3,:) data(3,c+e) ; idTwoArray(4,:) data(4,c+e); idTwoArray(5,:) countIdTwo];
                ending = c+e;
            end
        end
    end
end

%idThree
for  c = ending:length(data)
    if data(4,c) == 1 && data(3,c) == idThree && data(3,c+3) == idThree && data(3,c+4) ~= idThree
        countIdThree = countIdThree + 1;
        if countIdThree <= nFlashes
            for e = -cellsBefore:cellsAfter 
                idThreeArray = [idThreeArray(1,:) time(c+e) ; idThreeArray(2,:) amplitude(c+e) ; idThreeArray(3,:) data(3,c+e) ; idThreeArray(4,:) data(4,c+e); idThreeArray(5,1:end) countIdThree];
                ending = c+e;
            end
        end
    end
end

%idFour
for  c = ending:length(data)
    if data(4,c) == 1 && data(3,c) == idFour && data(3,c+3) == idFour && data(3,c+4) ~= idFour
        countIdFour = countIdFour + 1;
        if countIdFour <= nFlashes
            for e = -cellsBefore:cellsAfter 
                idFourArray = [idFourArray(1,:) time(c+e) ; idFourArray(2,:) amplitude(c+e) ; idFourArray(3,:) data(3,c+e) ; idFourArray(4,:) data(4,c+e); idFourArray(5,:) countIdFour];
                ending = c + e;
            end
        end
    end
end

idOneAvgOne = zeros(1,0);
idOneAvgTwo = zeros(1,0);
idOneAvgThree = zeros(1,0);
idOneAvgFour = zeros(1,0);
idOneAvgFive = zeros(1,0);
idOneAvgSix = zeros(1,0);
idOneAvgSeven = zeros(1,0);
idOneAvgEight = zeros(1,0);

idTwoAvgOne = zeros(1,0);
idTwoAvgTwo = zeros(1,0);
idTwoAvgThree = zeros(1,0);
idTwoAvgFour = zeros(1,0);
idTwoAvgFive = zeros(1,0);
idTwoAvgSix = zeros(1,0);
idTwoAvgSeven = zeros(1,0);
idTwoAvgEight = zeros(1,0);

idThreeAvgOne = zeros(1,0);
idThreeAvgTwo = zeros(1,0);
idThreeAvgThree = zeros(1,0);
idThreeAvgFour = zeros(1,0);
idThreeAvgFive = zeros(1,0);
idThreeAvgSix = zeros(1,0);
idThreeAvgSeven = zeros(1,0);
idThreeAvgEight = zeros(1,0);

idFourAvgOne = zeros(1,0);
idFourAvgTwo = zeros(1,0);
idFourAvgThree = zeros(1,0);
idFourAvgFour = zeros(1,0);
idFourAvgFive = zeros(1,0);
idFourAvgSix = zeros(1,0);
idFourAvgSeven = zeros(1,0);
idFourAvgEight = zeros(1,0);

%idOne
for  c = 1:length(idOneArray)
%{
for e = 1:length(countA)
    for  c = 1:length(a)
        for o = 1:(length(cellsBefore)+length(cellsAfter))
            if a(5,c) == e
                aAvgOne(e,o) = a(2,c); % square brackets on left
            end
        end
    %}
    if idOneArray(5,c) == 1
        idOneAvgOne = [idOneAvgOne idOneArray(2,c)];
    end
    if idOneArray(5,c) == 2
        idOneAvgTwo = [idOneAvgTwo idOneArray(2,c)];
    end
    if idOneArray(5,c) == 3
        idOneAvgThree = [idOneAvgThree idOneArray(2,c)];
    end
    if idOneArray(5,c) == 4
        idOneAvgFour = [idOneAvgFour idOneArray(2,c)];
    end
    if idOneArray(5,c) == 5
        idOneAvgFive = [idOneAvgFive idOneArray(2,c)];
    end
    if idOneArray(5,c) == 6
        idOneAvgSix = [idOneAvgSix idOneArray(2,c)];
    end
    if idOneArray(5,c) == 7
        idOneAvgSeven = [idOneAvgSeven idOneArray(2,c)];
    end
    if idOneArray(5,c) == 8
        idOneAvgEight = [idOneAvgEight idOneArray(2,c)];
    end
end

%idTwo
for c = 1:length(idTwoArray)
    if idTwoArray(5,c) == 1
        idTwoAvgOne = [idTwoAvgOne idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 2
        idTwoAvgTwo = [idTwoAvgTwo idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 3
        idTwoAvgThree = [idTwoAvgThree idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 4
        idTwoAvgFour = [idTwoAvgFour idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 5
        idTwoAvgFive = [idTwoAvgFive idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 6
        idTwoAvgSix = [idTwoAvgSix idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 7
        idTwoAvgSeven = [idTwoAvgSeven idTwoArray(2,c)];
    end
    if idTwoArray(5,c) == 8
        idTwoAvgEight = [idTwoAvgEight idTwoArray(2,c)];
    end
end

%idThree
for c = 1:length(idThreeArray)
    if idThreeArray(5,c) == 1
        idThreeAvgOne = [idThreeAvgOne idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 2
        idThreeAvgTwo = [idThreeAvgTwo idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 3
        idThreeAvgThree = [idThreeAvgThree idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 4
        idThreeAvgFour = [idThreeAvgFour idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 5
        idThreeAvgFive = [idThreeAvgFive idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 6
        idThreeAvgSix = [idThreeAvgSix idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 7
        idThreeAvgSeven = [idThreeAvgSeven idThreeArray(2,c)];
    end
    if idThreeArray(5,c) == 8
        idThreeAvgEight = [idThreeAvgEight idThreeArray(2,c)];
    end
end

%idFour
for c = 1:length(idFourArray)
    if idFourArray(5,c) == 1
        idFourAvgOne = [idFourAvgOne idFourArray(2,c)];
    end
    if idFourArray(5,c) == 2
        idFourAvgTwo = [idFourAvgTwo idFourArray(2,c)];
    end
    if idFourArray(5,c) == 3
        idFourAvgThree = [idFourAvgThree idFourArray(2,c)];
    end
    if idFourArray(5,c) == 4
        idFourAvgFour = [idFourAvgFour idFourArray(2,c)];
    end
    if idFourArray(5,c) == 5
        idFourAvgFive = [idFourAvgFive idFourArray(2,c)];
    end
    if idFourArray(5,c) == 6
        idFourAvgSix = [idFourAvgSix idFourArray(2,c)];
    end
    if idFourArray(5,c) == 7
        idFourAvgSeven = [idFourAvgSeven idFourArray(2,c)];
    end
    if idFourArray(5,c) == 8
        idFourAvgEight = [idFourAvgEight idFourArray(2,c)];
    end
end

idOneAvg = [idOneAvgOne; idOneAvgTwo; idOneAvgThree; idOneAvgFour; idOneAvgFive; idOneAvgSix; idOneAvgSeven; idOneAvgEight];
idOneAvg = mean(idOneAvg);

idTwoAvg = [idTwoAvgOne; idTwoAvgTwo; idTwoAvgThree; idTwoAvgFour; idTwoAvgFive; idTwoAvgSix; idTwoAvgSeven; idTwoAvgEight];
idTwoAvg = mean(idTwoAvg);

idThreeAvg = [idThreeAvgOne; idThreeAvgTwo; idThreeAvgThree; idThreeAvgFour; idThreeAvgFive; idThreeAvgSix; idThreeAvgSeven; idThreeAvgEight];
idThreeAvg = mean(idThreeAvg);

idFourAvg = [idFourAvgOne; idFourAvgTwo; idFourAvgThree; idFourAvgFour; idFourAvgFive; idFourAvgSix; idFourAvgSeven; idFourAvgEight];
idFourAvg = mean(idFourAvg);

%all
figure(1);
plot(time, data(2,1:end), 'r');
xlabel('time (s)');
ylabel('Amplitude ()');

%a
figure(2);
subplot(2,2,1);
plot(t, idOneAvg(2:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter L');

%v
%figure(3);
subplot(2,2,2);
plot(t, idTwoAvg(2:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter 8');

%three
%figure(4);
subplot(2,2,3);
plot(t, idThreeAvg(2:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter T');

%z
%figure(5);
subplot(2,2,4);
plot(t, idFourAvg(2:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter T');