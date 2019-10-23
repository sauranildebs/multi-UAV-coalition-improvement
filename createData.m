clear all;
close all;
clc;

numSims = 1000;
numUAVs = 100;
numTargets = 1000;

for i = 1:numSims
    data(i).targetLocs = rand(numTargets,2);
    data(i).agentLocs = rand(numUAVs,3);
    data(i).targetResources = rand(numTargets,1);
end
    