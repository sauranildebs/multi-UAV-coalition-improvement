% This is the main file for generating Monte-Carlo Simulations

clear all;
close all;
clc;

numSims = 1;
targets = [ 50 100];

for i = 1:numSims
    for j = 1:length(targets)
        [tartime, pconvg] = mainSim(i, targets(j));
        monte(i).tarLength(j).targetTime = tartime;
        monte(i).tarLength(j).covgTime = pconvg;
        %disp([i j samePerformanceMonte(i).tarLength(j).targetTime - tartime]);
    end
    %save('monteDataTrustInit_tempPerformance','monte');
end
