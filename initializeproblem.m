function [uav,target,l,b] = initializeproblem
% initializations

global actualPerformance targetResoources
% search space dimensions
l = 1000; % length in units
b = 1000; % breadth in units

xMin = -l/2; xMax = l/2;
yMin = -b/2; yMax = b/2;
load tdata

% create targets
nTargets = 100;
% targetData = [targetData; targetData];
% targetResoources = [targetResoources; targetResoources];
for iTarget = 1:nTargets
    target(iTarget).Location = targetData(iTarget,:);%[xMin+l*rand yMin+b*rand];
    target(iTarget).Resources = [targetResoources(iTarget,1) 0 0];%[ceil(5*rand(1,1)) ceil(5*rand(1,1)) ceil(5*rand(1,1))];
    target(iTarget).visit = 0;
end

% create uavs
nUavs = 5;

load uavpositions
load uavheading
load agentPerformance
for iUav = 1:nUavs
    uav(iUav).Position = uavpositions(iUav,:)-500;%[xMin+l*rand yMin+b*rand];
    uav(iUav).Velocity = 10;
    uav(iUav).Heading = rand*2*pi;
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