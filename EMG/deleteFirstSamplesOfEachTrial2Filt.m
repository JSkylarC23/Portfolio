%7 class 5 trials

fs = 200;
seconds = 3;
samples = seconds*fs;
trialTime = 12;
trialSamples = trialTime*fs;
trials = 5;
classes = 7;

nFeatures = 96;
rows = size(Features,1);
newFeatures = Features;

for i = 1:length(Features)
    for e = 1:trials*classes
        if e*trialSamples <= i && i < e*trialSamples+samples
            newFeatures(:,i) = zeros(rows,1);
        end
    end
end

newFeatures(:,all(newFeatures == 0)) = [];

%arrange

thumb = zeros(rows,length(newFeatures));
index = zeros(rows,length(newFeatures));
middle = zeros(rows,length(newFeatures));
ring = zeros(rows,length(newFeatures));
pinky = zeros(rows,length(newFeatures));
fist = zeros(rows,length(newFeatures));
rest = zeros(rows,length(newFeatures));

for i = 1:length(newFeatures)
    if newFeatures(nFeatures+2,i) == 1
        thumb(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+3,i) == 1
        index(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+4,i) == 1
        middle(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+5,i) == 1
        ring(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+6,i) == 1
        pinky(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+7,i) == 1
        fist(:,i) = newFeatures(:,i);
    elseif newFeatures(nFeatures+8,i) == 1
        rest(:,i) = newFeatures(:,i);
    end
end

arrange = [thumb index middle ring pinky fist rest];

arrange(:,all(arrange == 0)) = [];

trainData = arrange(2:nFeatures+1,:);
trainLabels = arrange(rows-classes+1:rows,:);

%{
% One Hot
newLabels = zeros(2,length(trainLabels));
for i = 1:length(trainLabels)
    [~,M] = max(trainLabels(:,i));
    newLabels(2,i) = M;
end
%}

writematrix(arrange(1:49,:), 'trainData7ClassTest2FiltNo1.csv');
writematrix(trainLabels, 'trainLabels7ClassTest2FiltNo1.csv');

