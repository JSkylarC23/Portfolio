clc
clear all
close all

data = importdata('E:\BCIs\session1.mat');

timeBefore = .1;
timeAfter = .7;
idOne = 1; %A
idTwo = 22; %V
idThree = 29; %3
idFour = 26; %Z

time = data(1,1:end);
amplitude = data(2,1:end);
sampleRate = time(2) - time(1);
cellsBefore = round((1/sampleRate)*timeBefore);
cellsAfter = round((1/sampleRate)*timeAfter);
t = -.1:sampleRate:.7;

a = zeros(5,0);
v = zeros(5,0);
three = zeros(5,0);
z = zeros(5,0);

countA = 0;
countV = 0;
countThree = 0;
countZ = 0;

%a
for  c = 1:length(data)
    if data(4,c) == 1 && data(3,c) == idOne && data(3,c+3) == idOne && data(3,c+4) ~= idOne
        countA = countA + 1;
        for e = -cellsBefore:cellsAfter 
            a = [a(1,:) time(c+e) ; a(2,:) amplitude(c+e) ; a(3,:) data(3,c+e) ; a(4,:) data(4,c+e); a(5,:) countA];
        end
    end
end

%v
for  c = 1:length(data)
    if data(4,c) == 1 && data(3,c) == idTwo && data(3,c+3) == idTwo && data(3,c+4) ~= idTwo
        countV = countV + 1;
        for e = -cellsBefore:cellsAfter 
            v = [v(1,:) time(c+e) ; v(2,:) amplitude(c+e) ; v(3,:) data(3,c+e) ; v(4,:) data(4,c+e); v(5,:) countV];
        end
    end
end

%3
for  c = 1:length(data)
    if data(4,c) == 1 && data(3,c) == idThree && data(3,c+3) == idThree && data(3,c+4) ~= idThree
        countThree = countThree + 1;
        for e = -cellsBefore:cellsAfter 
            three = [three(1,:) time(c+e) ; three(2,:) amplitude(c+e) ; three(3,:) data(3,c+e) ; three(4,:) data(4,c+e); three(5,1:end) countThree];
        end
    end
end

%z
for  c = 1:length(data)
    if data(4,c) == 1 && data(3,c) == idFour && data(3,c+3) == idFour && data(3,c+4) ~= idFour
        countZ = countZ + 1;
        for e = -cellsBefore:cellsAfter 
            z = [z(1,:) time(c+e) ; z(2,:) amplitude(c+e) ; z(3,:) data(3,c+e) ; z(4,:) data(4,c+e); z(5,:) countZ];
        end
    end
end

aAvgOne = zeros(length(countA));
aAvgTwo = zeros(length(countA));
aAvgThree = zeros(length(countA));
aAvgFour = zeros(length(countA));
aAvgFive = zeros(length(countA));
aAvgSix = zeros(length(countA));
aAvgSeven = zeros(length(countA));
aAvgEight = zeros(length(countA));

vAvgOne = zeros(length(countA));
vAvgTwo = zeros(length(countA));
vAvgThree = zeros(length(countA));
vAvgFour = zeros(length(countA));
vAvgFive = zeros(length(countA));
vAvgSix = zeros(length(countA));
vAvgSeven = zeros(length(countA));
vAvgEight = zeros(length(countA));

threeAvgOne = zeros(length(countA));
threeAvgTwo = zeros(length(countA));
threeAvgThree = zeros(length(countA));
threeAvgFour = zeros(length(countA));
threeAvgFive = zeros(length(countA));
threeAvgSix = zeros(length(countA));
threeAvgSeven = zeros(length(countA));
threeAvgEight = zeros(length(countA));

zAvgOne = zeros(length(countA));
zAvgTwo = zeros(length(countA));
zAvgThree = zeros(length(countA));
zAvgFour = zeros(length(countA));
zAvgFive = zeros(length(countA));
zAvgSix = zeros(length(countA));
zAvgSeven = zeros(length(countA));
zAvgEight = zeros(length(countA));

%a
for  c = 1:length(a)
%{
for e = 1:length(countA)
    for  c = 1:length(a)
        for o = 1:(length(cellsBefore)+length(cellsAfter))
            if a(5,c) == e
                aAvgOne(e,o) = a(2,c); % square brackets on left
            end
        end
    %}
    if a(5,c) == 1
        aAvgOne = [aAvgOne a(2,c)];
    end
    if a(5,c) == 2
        aAvgTwo = [aAvgTwo a(2,c)];
    end
    if a(5,c) == 3
        aAvgThree = [aAvgThree a(2,c)];
    end
    if a(5,c) == 4
        aAvgFour = [aAvgFour a(2,c)];
    end
    if a(5,c) == 5
        aAvgFive = [aAvgFive a(2,c)];
    end
    if a(5,c) == 6
        aAvgSix = [aAvgSix a(2,c)];
    end
    if a(5,c) == 7
        aAvgSeven = [aAvgSeven a(2,c)];
    end
    if a(5,c) == 8
        aAvgEight = [aAvgEight a(2,c)];
    end
end

%v
for c = 1:length(v)
    if v(5,c) == 1
        vAvgOne = [vAvgOne v(2,c)];
    end
    if v(5,c) == 2
        vAvgTwo = [vAvgTwo v(2,c)];
    end
    if v(5,c) == 3
        vAvgThree = [vAvgThree v(2,c)];
    end
    if v(5,c) == 4
        vAvgFour = [vAvgFour v(2,c)];
    end
    if v(5,c) == 5
        vAvgFive = [vAvgFive v(2,c)];
    end
    if v(5,c) == 6
        vAvgSix = [vAvgSix v(2,c)];
    end
    if v(5,c) == 7
        vAvgSeven = [vAvgSeven v(2,c)];
    end
    if v(5,c) == 8
        vAvgEight = [vAvgEight v(2,c)];
    end
end

%3
for c = 1:length(three)
    if three(5,c) == 1
        threeAvgOne = [threeAvgOne three(2,c)];
    end
    if three(5,c) == 2
        threeAvgTwo = [threeAvgTwo three(2,c)];
    end
    if three(5,c) == 3
        threeAvgThree = [threeAvgThree three(2,c)];
    end
    if three(5,c) == 4
        threeAvgFour = [threeAvgFour three(2,c)];
    end
    if three(5,c) == 5
        threeAvgFive = [threeAvgFive three(2,c)];
    end
    if three(5,c) == 6
        threeAvgSix = [threeAvgSix three(2,c)];
    end
    if three(5,c) == 7
        threeAvgSeven = [threeAvgSeven three(2,c)];
    end
    if three(5,c) == 8
        threeAvgEight = [threeAvgEight three(2,c)];
    end
end

%z
for c = 1:length(v)
    if z(5,c) == 1
        zAvgOne = [zAvgOne z(2,c)];
    end
    if z(5,c) == 2
        zAvgTwo = [zAvgTwo z(2,c)];
    end
    if z(5,c) == 3
        zAvgThree = [zAvgThree z(2,c)];
    end
    if z(5,c) == 4
        zAvgFour = [zAvgFour z(2,c)];
    end
    if z(5,c) == 5
        zAvgFive = [zAvgFive z(2,c)];
    end
    if z(5,c) == 6
        zAvgSix = [zAvgSix z(2,c)];
    end
    if z(5,c) == 7
        zAvgSeven = [zAvgSeven z(2,c)];
    end
    if z(5,c) == 8
        zAvgEight = [zAvgEight z(2,c)];
    end
end

aAvg = [aAvgOne; aAvgTwo; aAvgThree; aAvgFour; aAvgFive; aAvgSix; aAvgSeven; aAvgEight];
aAvg = mean(aAvg);

vAvg = [vAvgOne; vAvgTwo; vAvgThree; vAvgFour; vAvgFive; vAvgSix; vAvgSeven; vAvgEight];
vAvg = mean(vAvg);

threeAvg = [threeAvgOne; threeAvgTwo; threeAvgThree; threeAvgFour; threeAvgFive; threeAvgSix; threeAvgSeven; threeAvgEight];
threeAvg = mean(threeAvg);

zAvg = [zAvgOne; zAvgTwo; zAvgThree; zAvgFour; zAvgFive; zAvgSix; zAvgSeven; zAvgEight];
zAvg = mean(zAvg);

%all
figure(1);
plot(time, data(2,1:end), 'r');
xlabel('time (s)');
ylabel('Amplitude ()');

%a
figure(2);
subplot(2,2,1);
plot(t, aAvg(3:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter A');

%v
%figure(3);
subplot(2,2,2);
plot(t, vAvg(3:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter V');

%three
%figure(4);
subplot(2,2,3);
plot(t, threeAvg(3:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter 3');

%z
%figure(5);
subplot(2,2,4);
plot(t, zAvg(3:end), 'r');
xlabel('time (s)');
ylabel('Amplitude (mV)');
title('Letter Z');