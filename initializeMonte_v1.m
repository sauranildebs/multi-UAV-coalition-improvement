function [uav,target,l,b] = initializeMonte_v1(tarIndex, nTargets)
% initializations
% 13/3/16 Adding % variation of the initialization of the trust values.

global actualPerformance updatedTargetResources
% search space dimensions
l = 1000; % length in units
b = 1000; % breadth in units

xMin = -l/2; xMax = l/2;
yMin = -b/2; yMax = b/2;
load mdata1000


%agentPerformance = [0.7 0.85 0.62 0.41 0.65];
agentPerformance =      [0.7 0.85 0.62 0.41 0.55 0.72 0.85 0.56 0.43 0.67];
%tempAgentPerformance =  [0.6 0.7   0.5 0.5  0.66 0.65  0.75 0.68 0.59 0.85 ];

%load tarAgentData

for iTarget = 1:nTargets
    target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1)*l yMin+data(tarIndex).targetLocs(iTarget,2)*b];
    target(iTarget).Resources = [ceil(data(tarIndex).targetResources(iTarget)*10) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
    target(iTarget).visit = 0;
    targetResources(iTarget,:) = target(iTarget).Resources;
end
updatedTargetResources = targetResources;
% create uavs
nUavs = 10;

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
    uav(iUav).actualPerformance = agentPerformance(iUav);
    uav(iUav).coalitionTrust = 0;
    uav(iUav).coalitionPerformance = 0;
    actualPerformance(iUav) = uav(iUav).actualPerformance;
    uav(iUav).alpha = 0;
    uav(iUav).coalitionMembers = [];
end
end
% plotscene(uav,target,l,b)

function priorTrustValues = findPriorTrust(agentPerformance, numAgents, trustRand)

priorTrustValues = zeros(numAgents,1);
for i = 1:numAgents
    lbtrustRand = agentPerformance(i)-trustRand*agentPerformance(i);
    ubtrustRand = agentPerformance(i)+trustRand*agentPerformance(i);
    trustRandValue = (ubtrustRand - lbtrustRand)*rand;
    priorTrustValues(i) = lbtrustRand + trustRandValue;
end
end






