% clear all
% 
% load monteData
% monte_new = monte;
% load monteData20
% for i = 93:100
%     monte_new(i) = monte(i);
% end
% 
% load monteData1
% monte2 = monte1;
% load monteData2
% 
% for j = 58:75
%     monte2(j) = monte1(j);
% end
% 
% load monteData3
% 
% for k = 76:100
%     monte2(k) = monte1(k);
% end
% 
% monte = monte_new;
% monte1 = monte2;
% %close all;
% 
% % plotting data from multiple places
% % this is for 10 agents and 20 agents. These two simulations ran at a
% % single shot
% 
% % mlength = 0;
% % 
% % load monteDataTplusnoT2_final
% % mlength = length(monte);
% % monteTem= monte;
% % 
% % load monteDataTplusnoT2_final1
% % for i = 1:mlength-1
% %     monte(i) = monteTem(i);
% % end
% % monteTem= monte;
% % mlength1 = length(monte);
% % 
% % load monteDataTplusnoT2_final2
% % for i = 1:mlength1-1
% %     monte(i) = monteTem(i);
% % end
% % monteTem= monte;
% % mlength2 = length(monte);
% % 
% % load monteDataTplusnoT2_final3
% % for i = 1:mlength2-1
% %     monte(i) = monteTem(i);
% % end
% 
% % load monteData20.mat
% %load monteData1
% %  load monteData5_51_100.mat
% % load monteData5_1_50.mat
% % monte1 = monte;
% % load monteData5_51_100.mat
% % for i = 1:50
% %     monte(i) = monte1(i);
% % end
% %%% now the plotting part
% % Effect of increas in number of targets
% agentPerformance1 = [0.7 0.85 0.62 0.41 0.55 0.72 0.85 0.56 0.43 0.67];
% agentPerformance1 =[agentPerformance1  agentPerformance1 ];
% numAgents = size(monte(51).tarLength(1).covgTime(2).ctime,2);
% agentPerformance = agentPerformance1(1:numAgents);
% 
% for i = 1:100
%     for j = 1:5
%         monte(i).tarLength(j).targetTime(1) = monte1(i).tarLength(j).targetTime;
%         monte(i).tarLength(j).covgTime(1) = monte1(i).tarLength(j).covgTime;
%         monte(i).tarLength(j).numCoalitions(1) = monte1(i).tarLength(j).numCoalitions;
%         monte(i).tarLength(j).numResources(1) = monte1(i).tarLength(j).numResources;
%     end
% end
% 
% 
% for j = 1:5
%     for k = 1:2        
%         for i = 1:100
%             missionTime(i,k) = monte(i).tarLength(j).targetTime(k);
%             numCoalitions(i,k) = monte(i).tarLength(j).numCoalitions(k);
%             numResources(i,k) = monte(i).tarLength(j).numResources(k);
%             
%             for l = 1:length(monte(i).tarLength(j).covgTime(k).ctime)
%                 error = (abs(agentPerformance - monte(i).tarLength(j).covgTime(k).ctime(l,:)))./agentPerformance;
%                 v(l) = length(find(error < 0.05));
% %                 if error < 0.01*size(monte(i).tarLength(j).covgTime(k).ctime,2)
% %                     numA = numA + 1;
% %                     break
% %                 end
%                 
%             end
%             convgTime(i,k) = l;
%             numCoalitionsConvg(i,k) = mean(findNumCoalition(monte(i).tarLength(j).covgTime(k).ctime));            
%             coalitionFormed(i,k) = max(v);
%         end
%     end
% %      v = find(missionTime(:,1) == 20000);
% %      v1 = find(missionTime(:,2) == 20000);
% %      missionTime = setdiff(missionTime,missionTime([v ;v1],:),'rows');
% %      numCoalitions = setdiff(numCoalitions,numCoalitions([v ;v1],:),'rows');
% %     numResources = setdiff(numResources,numResources([v; v1],:),'rows');
% %     numCoalitionsConvg = setdiff(numCoalitionsConvg,numCoalitionsConvg([v; v1],:),'rows');
% %     coalitionsConvgTime = setdiff(convgTime,convgTime([v; v1],:),'rows');
%     
%      numTargetsTime(j,:) = [mean(missionTime(:,1)) std(missionTime(:,1)) mean(missionTime(:,2)) std(missionTime(:,2))];
%     numTargetsCoalitions(j,:) = [mean(numCoalitions(:,1)) std(numCoalitions(:,1)) mean(numCoalitions(:,2)) std(numCoalitions(:,2))];
%     numTargetsResources(j,:) = [mean(numResources(:,1)) std(numResources(:,1)) mean(numResources(:,2)) std(numResources(:,2))];
%     numTargetsCC(j,:) = [mean(numCoalitionsConvg(:,1)) std(numCoalitionsConvg(:,1)) mean(numCoalitionsConvg(:,2)) std(numCoalitionsConvg(:,2))];
%     %numCoalitionConvgTime(j,:) = [mean(coalitionsConvgTime(:,1)) std(coalitionsConvgTime(:,1)) mean(coalitionsConvgTime(:,2)) std(coalitionsConvgTime(:,2))];
%     numAgentsConvg(j,:) = [ mean(coalitionFormed(:,1)./numAgents) std(coalitionFormed(:,1)./numAgents) mean(coalitionFormed(:,2)./numAgents) std(coalitionFormed(:,2)./numAgents)];
% end
    hold on;
%errorbar(numAgentsConvg(:,1), numAgentsConvg(:,2))
%errorbar(numAgentsConvg(:,3), numAgentsConvg(:,4))
%errorbar(numTargetsResources(:,1), numTargetsResources(:,2))
%errorbar(numTargetsResources(:,3), numTargetsResources(:,4))
%errorbar(numTargetsCoalitions(:,1), numTargetsCoalitions(:,2))
%errorbar(numTargetsCoalitions(:,3), numTargetsCoalitions(:,4))
errorbar(numTargetsTime(:,1), numTargetsTime(:,2))
errorbar(numTargetsTime(:,3), numTargetsTime(:,4))
%errorbar(numTargetsCC(:,1), numTargetsCC(:,2))
%errorbar(numTargetsCC(:,3), numTargetsCC(:,4))

            