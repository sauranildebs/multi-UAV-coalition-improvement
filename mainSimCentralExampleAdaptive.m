%function [t, performance] = mainSimCentral(tarIndex, nTargets)

% the main and starting program for uav coalition formation
% 16/9/16 -> Modified this code from the mainSimCetral file to take
% adaptive degarind of the agents performance after some time.
clear all;
global trustGain targetMeasurements targetValue targetThreshold trustFlag st Phat errorFlag
global numCoalitions numResources actualPerformance

% initialize the problem
tarIndex = 1;
nTargets = 20;
trustFlag = 1; % 0 for trusting everyone, 1 for estimating trust

[uav,target,l,b] = initializeMonte_Central(tarIndex,nTargets);
trustGain = 1/length(uav);

%targetMeasurements = rand(length(target),1);%0.7+rand(length(target),1)*0.3;
load targetMeasurements

targetMeasurements = max(0.3,targetMeasurements);

numCoalitions = 0;
numResources = 0;
% target information
targetValue =0;
targetThreshold = 0.75; % target threshold for counting the value

targetLocations = [];
targetResources = [];
for iTarget = 1:length(target)
        targetLocations = [targetLocations; target(iTarget).Location];
        targetResources = [targetResources; target(iTarget).Resources];
end

dt =.25; % time step
broadcast = [];
performance = zeros(1000*dt,length(uav));
pindex = 1;
st(1) = inf;
resourceTime = [];
aflag = 0;

% the loop over time starts here
for t = 0:dt:10000
    nextBroadcast = [];
    for iUav = 1:length(uav)
        % for each uav execute the coalition logic
        [uav(iUav),target,targetResources,nextBroadcast] = uavlogicCentral(uav(iUav),target,dt,l,b,targetLocations,targetResources,broadcast,nextBroadcast, t);
        %performance(pindex,iUav) = uav(iUav).trustValues(iUav);
    end
    performance(pindex,:) = Phat;
    % plot uav and target positions at each time step
   % if mod(t,10) == 0
    %    disp([t st(end)])
        plotscene(uav,target,l,b)
   % end
    % break the loop is all targets are destroyed
    if targetResources == 0
        break
    else
        st = [st; sum(targetResources(:,1))];
        %         if st(end)5>st(end-1)
        %             keyboard;
        %         end
    end
    %disp(sum(targetResources))
    broadcast = nextBroadcast;
    pindex = pindex + 1;
    
    searchf = 0;
    for i = 1:length(uav)
        if uav(i).Status == 'InSearch***'
            searchf = searchf + 1;
        end
        uav(i).Position = uav(i).tempPosition;
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
            if(norm(uav(i).Position))> (sqrt(2)*l/2 + 100)
                disp(i);
                uav(i).Position = [0 0];
            end
        end
    end
    
    %% update the target list after checking out the resources
    for itg = 1:length(target)
        if (target(itg).releaseTime > 0)
            if (t > target(itg).releaseTime)
                target(itg).Resources = [target(itg).leftResources 0 0];
                target(itg).allocatedTime = 0;
                target(itg).estimatedHitTime = 0;
                target(itg).releaseTime = 0;
                targetResources(itg,1) = target(itg).leftResources;
                
                % remove from the uav.destroyed target list
                for iuv = 1:length(uav)
                    uav(iuv).DestroyedTargets = setdiff(uav(iuv).DestroyedTargets,itg);
                end
            end
        end
    end
    %     if t > 600
    %         keyboard
    %     end
    %
    %Phat
    %targetResources(:,1)
    errorSum = 0;
    errorSumFlag = 0;
    for i = 1:length(uav)
        if abs(actualPerformance(i) - Phat(i))/actualPerformance(i) < 0.08
            errorSumFlag = errorSumFlag + 1;
        end
    end
    if errorSumFlag == length(actualPerformance)
        %if errorFlag == 0
            t
            numCoalitions
        %end
        errorFlag = 1;
    else
        errorFlag = 0;
    end
    
%         if numCoalitions > 30 && aflag == 0
%             actualPerformance = [0.63 0.8 0.5 0.4 0.5];
%             aflag = 1;
%             t    
%         end
    resourceTime = [resourceTime numResources(1)];
end
