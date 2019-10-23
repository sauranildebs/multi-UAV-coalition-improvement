function [uav, nextBroadcast] = doifcoalitioncoordinator(uav,broadcast,nextBroadcast)
% function to execute if a uav is a coalition coordinator

    targetsToFollow = uav.CoalitionLeader(find(uav.RequestWaitTime==1));
    if ~isempty(targetsToFollow)
        for target = (targetsToFollow)
            nextBroadcast = formcoalitionCentral(uav,target,broadcast,nextBroadcast);            
            uav.RequestWaitTime(find(uav.CoalitionLeader==target)) = [];
            uav.CoalitionLeader(find(uav.CoalitionLeader==target)) = [];
        end
    end
    if ~isempty(uav.RequestWaitTime)
        uav.RequestWaitTime(find(uav.RequestWaitTime==0)) = uav.RequestWaitTime(find(uav.RequestWaitTime==0)) + 1;
    end
