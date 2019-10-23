function [uav,target,l,b] = initializeMonte_Central(tarIndex, nTargets)
% initializations
% 13/3/16 Adding % variation of the initialization of the trust values.

global actualPerformance updatedTargetResources Phat
% search space dimensions
l = 1000; % length in units
b = 1000; % breadth in units

xMin = -l/2; xMax = l/2;
yMin = -b/2; yMax = b/2;
load mdata1000

% create uavs
nUavs = 10;

% agentPerformance = [0.7 0.85 0.62 0.41 0.55];
 agentPerformance1 =      [0.7 0.85 0.62 0.41 0.55 0.72 0.85 0.56 0.43 0.67];
 agentPerformance1 =[agentPerformance1  agentPerformance1 ];
% tempAgentPerformance =  [0.6 0.7   0.5 0.5  0.66 0.65  0.75 0.68 0.59 0.85 ];
agentPerformance = agentPerformance1(1:nUavs);

%load tarAgentData

for iTarget = 1:nTargets
    
    if iTarget == 20
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-100 yMin+data(tarIndex).targetLocs(iTarget,2)*b-100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
    
    elseif iTarget == 32
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+100 yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
    elseif iTarget == 32
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+100 yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
    
    elseif iTarget == 12
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-100 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
    elseif iTarget == 10
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-50 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;

    elseif iTarget == 33
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+150 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 18 && nTargets == 20
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-150 yMin+data(tarIndex).targetLocs(iTarget,2)*b-200];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 34
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+150 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
     elseif iTarget == 18 && nTargets == 30
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-150 yMin+data(tarIndex).targetLocs(iTarget,2)*b-200];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0; 
        
        
        
        elseif iTarget == 13 && nTargets == 30
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-200 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0; 
        
         elseif iTarget == 13 && nTargets == 30
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-200 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0; 
        
        
    elseif iTarget == 24 && nTargets == 30
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-150 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        
        elseif iTarget == 26 && nTargets == 30
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
     
        
    elseif iTarget == 13 && nTargets == 20
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-150 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
       elseif iTarget == 18 && nTargets == 40
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-300 yMin+data(tarIndex).targetLocs(iTarget,2)*b-100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 39 && nTargets == 40
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-300 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 13 && nTargets == 40
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-200 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 26 && nTargets == 40
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        
        elseif iTarget == 24 && nTargets == 40
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-100 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 47 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 46 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b-100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 18 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-300 yMin+data(tarIndex).targetLocs(iTarget,2)*b-100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 39 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-300 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 13 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-300 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 34 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-30 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 24 && nTargets == 50
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-200 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        
    elseif iTarget == 40
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+100 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        elseif iTarget == 22
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+100 yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        

        
        
    elseif iTarget == 9
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l-100 yMin+data(tarIndex).targetLocs(iTarget,2)*b+100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
    elseif iTarget == 3
        
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l+100 yMin+data(tarIndex).targetLocs(iTarget,2)*b-100];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
        
        
    else   
        target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b];
        target(iTarget).Resources = [max(4,ceil(data(tarIndex).targetResources(iTarget)*9)) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
        target(iTarget).visit = 0;
        targetResources(iTarget,:) = target(iTarget).Resources;
        target(iTarget).allocatedTime = 0;
        target(iTarget).estimatedHitTime = 0;
        target(iTarget).releaseTime = 0;
    end
end
updatedTargetResources = targetResources;


trustRand = 0.25;
for iUav = 1:nUavs
    uav(iUav).Position = [xMin+data(tarIndex).agentLocs(iUav,1)*l yMin+data(tarIndex).agentLocs(iUav,2)*b];%[xMin+l*rand yMin+b*rand];
    uav(iUav).Velocity = 10;
    uav(iUav).Heading = data(tarIndex).agentLocs(iUav,3)*pi;
    % single type of resource for the uav and target
    uav(iUav).Resources = [3 0 0];%3 resources are used in updateTargetResources function.
    uav(iUav).Id = iUav;
    uav(iUav).Status = 'InSearch***';
    uav(iUav).CoalitionLeader = [];
    uav(iUav).InvitationWaitTime = [];
    uav(iUav).RequestWaitTime = [];
    uav(iUav).Target = [];
    uav(iUav).TargetLocation = [];
    uav(iUav).TurnRadius = [];
    uav(iUav).TurnDirection = [];
    uav(iUav).CoalitionTime = 0;
    uav(iUav).DestroyedTargets = [];
    % initializing the priori trust within trustRand% of the true value
    %   uav(iUav).trustValues = tempAgentPerformance;%agentPerformance+agentPerformance*0.25;  %findPriorTrust(agentPerformance, nUavs, trustRand); %ones(nUavs,1);
    uav(iUav).trustValues =  ones(nUavs,1);
    Phat(iUav) = 1;%agentPerformance(iUav)+0.13;%1;
    uav(iUav).actualPerformance = agentPerformance(iUav);
    uav(iUav).coalitionTrust = 0;
    uav(iUav).coalitionPerformance = 0;
    actualPerformance(iUav) = uav(iUav).actualPerformance;
    uav(iUav).alpha = 0;
    uav(iUav).coalitionMembers = [];
    uav(iUav).tempPosition = [];
end
end
% % plotscene(uav,target,l,b)
% 
% function priorTrustValues = findPriorTrust(agentPerformance, numAgents, trustRand)
% 
% priorTrustValues = zeros(numAgents,1);
% for i = 1:numAgents
%     lbtrustRand = agentPerformance(i)-trustRand*agentPerformance(i);
%     ubtrustRand = agentPerformance(i)+trustRand*agentPerformance(i);
%     trustRandValue = (ubtrustRand - lbtrustRand)*rand;
%     priorTrustValues(i) = lbtrustRand + trustRandValue;
% end
% end






