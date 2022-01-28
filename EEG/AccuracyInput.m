clear all;
clc;

y = importdata('E:\BCIs\Final\InputOutput.mat');

one = zeros(89,length(find(y==49)));
two = zeros(89,length(find(y==50)));
three = zeros(89,length(find(y==51)));
four = zeros(89,length(find(y==52)));
five = zeros(89,length(find(y==53)));
six = zeros(89,length(find(y==54)));
seven = zeros(89,length(find(y==55)));

oneC = 1;
twoC = 1;
threeC = 1;
fourC = 1;
fiveC = 1;
sixC = 1;
sevenC = 1;

%sort input matrix for each stim
for i = 1:length(y)
    if y(89,i) == 49
        one(:,oneC) = y(:,i);
        oneC = oneC + 1;
    elseif y(89,i) == 50
        two(:,twoC) = y(:,i);
        twoC = twoC + 1;
    elseif y(89,i) == 51
        three(:,threeC) = y(:,i);
        threeC = threeC + 1;
    elseif y(89,i) == 52
        four(:,fourC) = y(:,i);
        fourC = fourC + 1;
    elseif y(89,i) == 53
        five(:,fiveC) = y(:,i);
        fiveC = fiveC + 1;
    elseif y(89,i) == 54
        six(:,sixC) = y(:,i);
        sixC = sixC + 1;
    elseif y(89,i) == 55
        seven(:,sevenC) = y(:,i);
        sevenC = sevenC + 1;
    end
end

oneA = zeros(1,length(one));
twoA = zeros(1,length(two));
threeA = zeros(1,length(three));
fourA = zeros(1,length(four));
fiveA = zeros(1,length(five));
sixA = zeros(1,length(six));
sevenA = zeros(1,length(seven));

%check highest

%one
for i = 1:length(one)
    [M,I] = max(one(82:88,i));
    if I == 1
        oneA(i) = 1;
    else
        oneA(i) = 0;
    end
end

oneAcc = sum(oneA)/length(oneA);

%two
for i = 1:length(two)
    [M,I] = max(two(82:88,i));
    if I == 2
        twoA(i) = 1;
    else
        twoA(i) = 0;
    end
end

twoAcc = sum(twoA)/length(twoA);

%three
for i = 1:length(three)
    [M,I] = max(three(82:88,i));
    if I == 3
        threeA(i) = 1;
    else
        threeA(i) = 0;
    end
end

threeAcc = sum(threeA)/length(threeA);

%four
for i = 1:length(four)
    [M,I] = max(four(82:88,i));
    if I == 4
        fourA(i) = 1;
    else
        fourA(i) = 0;
    end
end

fourAcc = sum(fourA)/length(fourA);

%five
for i = 1:length(five)
    [M,I] = max(five(82:88,i));
    if I == 5
        fiveA(i) = 1;
    else
        fiveA(i) = 0;
    end
end

fiveAcc = sum(fiveA)/length(fiveA);

%six
for i = 1:length(six)
    [M,I] = max(six(82:88,i));
    if I == 6
        sixA(i) = 1;
    else
        sixA(i) = 0;
    end
end

sixAcc = sum(sixA)/length(sixA);

%seven
for i = 1:length(seven)
    [M,I] = max(seven(82:88,i));
    if I == 7
        sevenA(i) = 1;
    else
        sevenA(i) = 0;
    end
end

sevenAcc = sum(sevenA)/length(sevenA);





