% the main and starting program for uav coalition formation
clear all; close all; clc

global trustGain targetMeasurements targetValue targetThreshold trustFlag st


% initialize the problem
[uav,target,l,b] = initializeproblem;
trustGain = 1/length(uav);

%targetMeasurements = rand(length(target),1);%0.7+rand(length(target),1)*0.3;
load targetMeasurements

targetMeasurements = max(0.3,targetMeasurements);


% target information
targetValue =0;
targetThreshold = 0.75; % target threshold for counting the value
trustFlag = 0; % 0 for trusting everyone, 1 for estimating trust
targetLocations = []; 
targetResources = [];
for iTarget = 1:length(target)
    targetLocations = [targetLocations; target(iTarget).Location];
    targetResources = [targetResources; target(iTarget).Resources];
end

dt =1; % time step
broadcast = [];
performance = zeros(1000*dt,length(uav));
pindex = 1;
st(1) = inf;

% the loop over time starts here
for t = 0:dt:10000
    nextBroadcast = [];
    for iUav = 1:length(uav)
        % for each uav execute the coalition logic
        [uav(iUav),target,targetResources,nextBroadcast] = uavlogicCentral(uav(iUav),target,dt,l,b,targetLocations,targetResources,broadcast,nextBroadcast);
        performance(pindex,iUav) = uav(iUav).trustValues(iUav);
    end
    % plot uav and target positions at each time step
     if mod(t,100) == 0
         disp([t st(end)])
    %   plotscene(uav,target,l,b)
     end
    % break the loop is all targets are destroyed
    if targetResources == 0
        break
    else
        st = [st; sum(targetResources(:,1))];
%         if st(end)5>st(end-1)
%             keyboard;
%         end
    end
    
    broadcast = nextBroadcast;
    pindex = pindex + 1;
    
    searchf = 0;
    for i = 1:length(uav)
        if uav(i).Status == 'InSearch***'
            searchf = searchf + 1;
        end
    end
    if searchf == length(uav)
        tarList = [];
        for i = 1:length(uav)
            utargets = unique(uav(i).DestroyedTargets);
            for j = 1:length(utargets)
                if sum(targetResources(utargets(j),:)) > 0
                    tarList = [tarList utargets(j)];
                end
            end
        end
        for i = 1:length(uav)
            uav(i).DestroyedTargets = setdiff(uav(i).DestroyedTargets, tarList);
        end
    end
end

 for i = 1:5
p(i,:) = [uav(i).actualPerformance uav(i).trustValues(i)];
end