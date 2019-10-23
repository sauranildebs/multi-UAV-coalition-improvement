function [uav, nextBroadcast] = search(uav,trackedTargets,targetLocations,targetResources,nextBroadcast)
% function to find if there are any untraced targets in the sensor range of
% it. if so, send a request for coalition formation

Rsen = 50; % sensor range
x = uav.Position(1);
y = uav.Position(2);

targetsInRange = find(sum((targetLocations-repmat([x y],length(targetLocations),1)).^2,2)<Rsen^2)';

targetsInRange = setdiff(targetsInRange,union(trackedTargets,uav.DestroyedTargets));

trange = find(sum(targetResources(targetsInRange,:)')>0);
targetsInRange = targetsInRange(trange);

if ~isempty(targetsInRange)    
    nextBroadcast = request_monte(uav,targetsInRange,targetLocations,targetResources,nextBroadcast);
    uav.CoalitionLeader = [uav.CoalitionLeader targetsInRange];
    uav.RequestWaitTime = [uav.RequestWaitTime zeros(1,length(targetsInRange))];    
end