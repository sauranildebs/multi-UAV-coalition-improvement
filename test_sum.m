clear all;
load monteData
monte_new = monte;
load monteData20
for i = 93:100
    monte_new(i) = monte(i);
end

load monteData1
monte2 = monte1;
load monteData2

for j = 58:75
    monte2(j) = monte1(j);
end

load monteData3

for k = 76:100
    monte2(k) = monte1(k);
end

monte = monte_new;
monte1 = monte2;

for i = 1:100
    for j = 1:5
        monte(i).tarLength(j).targetTime(1) = monte1(i).tarLength(j).targetTime;
        monte(i).tarLength(j).covgTime(1) = monte1(i).tarLength(j).covgTime;
        monte(i).tarLength(j).numCoalitions(1) = monte1(i).tarLength(j).numCoalitions;
        monte(i).tarLength(j).numResources(1) = monte1(i).tarLength(j).numResources;
    end
end

% sum1 = 0;
% sum2 = 0;
% count1 = 0;
% count2 = 0;
% wop = [];
% wp = [];
% for i = 1:100
%     if monte(i).tarLength(5).targetTime(2) == 20000 
%         %sum1 = sum1 + monte(i).tarLength(3).targetTime(2);
%         %sum2 = sum2 + monte1(i).tarLength(3).targetTime(1);
%         count1 = count1 + 1;
%         wp = [wp i];
%     end
%     if monte1(i).tarLength(5).targetTime(1) == 20000
%         count2 = count2 + 1;
%         wop = [wop  i];
%     end
% end
% count1;
% count2;
% sum1;
% sum2;

for j = 1:5
    for k = 1:2        
        for i = 1:100
            missionTime(i,k) = monte(i).tarLength(j).targetTime(k);
            
            v = find(missionTime(:,1) == 20000);
            v1 = find(missionTime(:,2) == 20000);
            missionTime = setdiff(missionTime,missionTime([v ;v1],:),'rows');
        end
    end

            
            numTargetsTime(j,:) = [mean(missionTime(:,1)) std(missionTime(:,1)) mean(missionTime(:,2)) std(missionTime(:,2))];
end