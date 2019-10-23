function [uav, nextBroadcast, target] = doifcoalitioncoordinatorCentral(uav,broadcast,nextBroadcast,ctime, target)
% function to execute if a uav is a coalition coordinator

    targetsToFollow = uav.CoalitionLeader(find(uav.RequestWaitTime==1));
    if ~isempty(targetsToFollow)
        for targetid = (targetsToFollow)
            [nextBroadcast, target] = formcoalitionCentral_v1(uav,targetid,broadcast,nextBroadcast,ctime, target);            
            uav.RequestWaitTime(find(uav.CoalitionLeader==targetid)) = [];
            uav.CoalitionLeader(find(uav.CoalitionLeader==targetid)) = [];
        end
    end
    if ~isempty(uav.RequestWaitTime)
        uav.RequestWaitTime(find(uav.RequestWaitTime==0)) = uav.RequestWaitTime(find(uav.RequestWaitTime==0)) + 1;
    end
