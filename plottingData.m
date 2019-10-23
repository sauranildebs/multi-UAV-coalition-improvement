clear all
close all;

% plotting data from multiple places

mlength = 0;

load monteDataTplusnoT2_final
mlength = length(monte);
monteTem= monte;

load monteDataTplusnoT2_final1
for i = 1:mlength-1
    monte(i) = monteTem(i);
end
monteTem= monte;
mlength1 = length(monte);

load monteDataTplusnoT2_final2
for i = 1:mlength1-1
    monte(i) = monteTem(i);
end
monteTem= monte;
mlength2 = length(monte);

load monteDataTplusnoT2_final3
for i = 1:mlength2-1
    monte(i) = monteTem(i);
end

%%% now the plotting part
% Effect of increas in number of targets
agentPerformance =      [0.7 0.85 0.62 0.41 0.55];
for j = 1:5
    for k = 1:2
        for i = 1:100
            missionTime(i,k) = monte(i).tarLength(j).targetTime(k);
            numCoalitions(i,k) = monte(i).tarLength(j).numCoalitions(k);
            numResources(i,k) = monte(i).tarLength(j).numResources(k);
            
            for l = 1:length(monte(i).tarLength(j).covgTime(k).ctime)
                error = abs(sum(agentPerformance - monte(i).tarLength(j).covgTime(k).ctime(l,:)));
                if error < 0.1
                    break
                end
            end
            convgTime(i,k) = l;
            numCoalitionsConvg(i,k) = mean(findNumCoalition(monte(i).tarLength(j).covgTime(k).ctime));
        end
    end
    v = find(missionTime(:,1) == 10000);
    v1 = find(missionTime(:,2) == 10000);
    missionTime = setdiff(missionTime,missionTime([v v1],:),'rows');
    numCoalitions = setdiff(numCoalitions,numCoalitions([v v1],:),'rows');
    numResources = setdiff(numResources,numResources([v v1],:),'rows');
    numCoalitionsConvg = setdiff(numCoalitionsConvg,numCoalitionsConvg([v v1],:),'rows');
    
    numTargetsTime(j,:) = [mean(missionTime(:,1)) std(missionTime(:,1)) mean(missionTime(:,2)) std(missionTime(:,2))];
    numTargetsCoalitions(j,:) = [mean(numCoalitions(:,1)) std(numCoalitions(:,1)) mean(numCoalitions(:,2)) std(numCoalitions(:,2))];
    numTargetsResources(j,:) = [mean(numResources(:,1)) std(numResources(:,1)) mean(numResources(:,2)) std(numResources(:,2))];
    numTargetsCC(j,:) = [mean(numCoalitionsConvg(:,1)) std(numCoalitionsConvg(:,1)) mean(numCoalitionsConvg(:,2)) std(numCoalitionsConvg(:,2))];
    numCoalitionConvgTime(j,:) = [mean(coalitionsConvgTime(:,1)) std(coalitionsConvgTime(:,1)) mean(coalitionsConvgTime(:,2)) std(coalitionsConvgTime(:,2))];
end
    
% missionTime after removing outliers
A = [1944 418 1363 313
    ];

           
%            monte(i).tarLength(j).covgTime(k).ctime = pconvg;
            