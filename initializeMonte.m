function [uav,target,l,b] = initializeMonte(tarIndex, nTargets)
% initializations

global actualPerformance targetResoources
% search space dimensions
l = 1000; % length in units
b = 1000; % breadth in units

xMin = -l/2; xMax = l/2;
yMin = -b/2; yMax = b/2;
load mdata
%load tarAgentData

for iTarget = 1:nTargets
    target(iTarget).Location = [xMin+data(tarIndex).targetLocs(iTarget,1) yMin+data(tarIndex).targetLocs(iTarget,2)];
    target(iTarget).Resources = [ceil(data(tarIndex).targetResources(iTarget)*10) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
    target(iTarget).visit = 0;
    targetResoources(iTarget,:) = target(iTarget).Resources;
end

% create uavs
nUavs = 5;

agentPerformance = [0.7 0.85 0.62 0.41 0.65];
for iUav = 1:nUavs
    uav(iUav).Position = [xMin+data(tarIndex).agentLocs(iUav,1) yMin+data(tarIndex).agentLocs(iUav,2)];%[xMin+l*rand yMin+b*rand];
    uav(iUav).Velocity = 10;
    uav(iUav).Heading = data(tarIndex).agentLocs(iUav,3)*2*pi;
    % single type of resource for the uav and target 
    uav(iUav).Resources = [3 0 0];%[ceil(2*rand(1,1)) ceil(2*rand(1,1)) ceil(2*rand(1,1))];
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
    uav(iUav).trustValues = ones(nUavs,1);
    uav(iUav).actualPerformance = agentPerformance(iUav);
    uav(iUav).coalitionTrust = 0;
    uav(iUav).coalitionPerformance = 0;
    actualPerformance(iUav) = uav(iUav).actualPerformance;
    uav(iUav).alpha = 0;
    uav(iUav).coalitionMembers = [];
end

% plotscene(uav,target,l,b)