% This file plots the data

clear all; close all

% load the data file
load monteData
montev2 = monte;
numTargets = length(monte(1).tarLength);
load monteData
montev21 = monte;
load monteData
montev22 = monte;
for i = 1:numTargets
    for j = 1:42
        ttime(j) = min([3500 montev2(j).tarLength(i).targetTime]);
        sttime(i,j) = ttime(j);
    end
    for j = 43:89
        ttime(j) = min([3500 montev21(j).tarLength(i).targetTime]);
        sttime(i,j) = ttime(j);
    end
    for j = 90:100
        ttime(j) = min([3500 montev22(j).tarLength(i).targetTime]);
        sttime(i,j) = ttime(j);
    end
    outliers = find (ttime > (mean(ttime)+std(ttime)));length(outliers)
    ntime = setdiff(1:100,outliers);
    mtime(i) = mean(ttime(ntime));
    stime(i) = std(ttime(ntime));
end
errorbar(mtime,stime)
hold on;


% load the data file
clear monte
load monteData

numSims = length(monte);
numTargets = length(monte(1).tarLength);

for i1 = 1:numTargets
    for j1 = 1:numSims
        ttime2(j1) = min([3500 monte(j1).tarLength(i1).targetTime]);
        sttime2(i1,j1) = ttime2(j1);
    end
    outliers = find (ttime2 > (mean(ttime2)+std(ttime2)));length(outliers)
    ntime = setdiff(1:numSims,outliers);
    mtime2(i1) = mean(ttime2(ntime));
    stime2(i1) = std(ttime2(ntime));
end
errorbar(mtime2,stime2,'m--');

% new update rule
% load the data file
load monteData
montenotv1 = monte;

load monteData
montenotv2 = monte;

numTargets = 5;
monte = montenotv1;
for i1 = 1:numTargets
    for j1 = 1:68
        ttime1(j1) = min([3500 montenotv1(j1).tarLength(i1).targetTime]);
        sttime1(i1,j1) = ttime1(j1);
    end
    for j1 = 69:100
        ttime1(j1) = min([3500 montenotv2(j1).tarLength(i1).targetTime]);
        sttime1(i1,j1) = ttime1(j1);
    end
    outliers = find (ttime1 > (mean(ttime1)+std(ttime1)));length(outliers)
    ntime = setdiff(1:numSims,outliers);
    mtime1(i1) = mean(ttime1(ntime));
    stime1(i1) = std(ttime1(ntime));
end

hold on;
h=errorbar(mtime1,stime1,'r--');
set(gca,'XTickLabel',{'','10',' ','25',' ','50', ' ','75', ' ','100'});
xlabel('Number of targets','FontName','Times','FontSize',14,'FontWeight','Bold')
ylabel('Average time to destroy all the targets','FontName','Times','FontSize',14,'FontWeight','Bold')
legend('With trust','Trust init','No trust')
figure(2)
hold on;
bar([mtime' mtime1' mtime2'],'FaceColor','none');
errorbar([0.85 1.85 2.85 3.85 4.85],mtime',stime','ko')
errorbar([1.15 2.15 3.15 4.15 5.15],mtime1',stime1','ko')
errorbar([1.15 2.15 3.15 4.15 5.15],mtime2',stime2','ko')
set(gca,'XTickLabel',{'','10',' ','25',' ','50', ' ','75', ' ','100'});
xlabel('Number of targets','FontName','Times','FontSize',14,'FontWeight','Bold')
ylabel('Average time to destroy all the targets','FontName','Times','FontSize',14,'FontWeight','Bold')
legend('With trust','No trust','New trust'); box