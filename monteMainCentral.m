 % This is the main file for generating Monte-Carlo Simulations

clear all;
close all;
clc;

% global trustFlag numCoalitions numResources
% numSims = 100;
% targets = [10 20 30 40 50];
% % targets = [100];
% trustFlags = [0 1];
% for i = 1:numSims
%     for j = 1:length(targets)
%         for k = 1:1
%             trustFlag = trustFlags(k);
%             [tartime, pconvg] = mainSimCentralBDA(i, targets(j));
%             monte1(i).tarLength(j).targetTime(k) = tartime;
%             monte1(i).tarLength(j).covgTime(k).ctime = pconvg;
%             monte1(i).tarLength(j).numCoalitions(k) = numCoalitions;
%             monte1(i).tarLength(j).numResources(k) = numResources(1);
%             disp([i j k numResources(1)]);% samePerformanceMonte(i).tarLength(j).targetTime - tartime]);
%             save('monteData1','monte1');
%         end
%     end
% end

%%% plotting routine
load monteData1.mat
targetTimes5=[];
targetTimes10=[];
targetTimes20=[];
targetTimes30=[];
for i = 1:length(monte1)
    for j = 1:length(monte1(1).tarLength)
        tarTimeNP1(i,j) =  monte1(i).tarLength(j).targetTime;
        %tarTimeP1(i,j) =  monte1(i).tarLength(j).targetTime(1);
        numCoalitionsNP1(i,j) = monte1(i).tarLength(j).numCoalitions;
        %numCoalitionsP1(i,j) = monte1(i).tarLength(j).numCoalitions(1);
    end
end

m1 = mean(tarTimeNP1);
%m2 = mean(tarTimeP1);
n1 = mean(numCoalitionsNP1);
%n2 = mean(numCoalitionsP1);
