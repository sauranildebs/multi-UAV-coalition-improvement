function [uav, trackedTargets] = trackedtargets(uav,broadcast,targetResources)
% function to find which all targets are found 

trackedTargets = [];
for iBroadcast = 1:length(broadcast)
    switch broadcast(iBroadcast).Type
        case 'Request***'
            trackedTargets = union(trackedTargets,broadcast(iBroadcast).Target);
        case 'Response**'
            trackedTargets = union(trackedTargets,broadcast(iBroadcast).Target);
        case 'Invitation'
            trackedTargets = union(trackedTargets,broadcast(iBroadcast).Target);
            %trackedTargets = union(trackedTargets,find(targetResources(:,1)==0));
            uav.DestroyedTargets = [uav.DestroyedTargets broadcast(iBroadcast).Target];
    end
end

