function [nextBroadcast, targetArray] = formcoalitionCentral(uav,target,broadcast,nextBroadcast,ctime, targetArray)
% function to form coalition. contains the coalition formation logic

global trustFlag actualPerformance Phat numCoalitions

% collect the responses to request for coalition
coalitionCandidates = [];
coalitionCandidateResources = [];
coalitionCandidateCost = [];
for iBroadcast = 1:length(broadcast)
    if broadcast(iBroadcast).Type == 'Response**'
        if broadcast(iBroadcast).Target == target && broadcast(iBroadcast).Id == uav.Id
            coalitionCandidates = [coalitionCandidates broadcast(iBroadcast).Uav];
            if trustFlag == 1
                coalitionCandidateResources = [coalitionCandidateResources; Phat(broadcast(iBroadcast).Uav)*broadcast(iBroadcast).Resources];
            else
                coalitionCandidateResources = [coalitionCandidateResources; broadcast(iBroadcast).Resources];
            end
            coalitionCandidateCost = [coalitionCandidateCost broadcast(iBroadcast).Cost];
            targetLocation = broadcast(iBroadcast).Location;
            targetResourceRequired = broadcast(iBroadcast).ResourceRequired;
        end
    end
end

% form coalition if the responded candidates together have enough resources
% to destroy the target. the coalition is formed based on the minimum
% dubins distance to target
if ~isempty(coalitionCandidateResources)
    
    if (sum(coalitionCandidateResources,1)-broadcast(iBroadcast).ResourceRequired)>=0
        [coalitionCandidateCost, sortOrder] = sort(coalitionCandidateCost);
        coalitionCandidates = coalitionCandidates(sortOrder);
        coalitionCandidateResources = coalitionCandidateResources(sortOrder,:);
        coalitionMembers = [];
        coalitionResources = [0 0 0];
        coalitionCost = [];
        iCandidate = 0;
        while sum(nonnegativeclip((broadcast(iBroadcast).ResourceRequired-sum(coalitionResources,1))))>0
            if coalitionResources == 0
                coalitionResources = [];
            end
            iCandidate = iCandidate + 1;
            coalitionMembers = [coalitionMembers coalitionCandidates(iCandidate)];
            coalitionResources = [coalitionResources; coalitionCandidateResources(iCandidate,:)];
            coalitionCost = [coalitionCost coalitionCandidateCost(iCandidate)];
        end
        
        % minimize the number of members in coalition by removing 'redundant' members
        while sum(coalitionResources,1)>=broadcast(iBroadcast).ResourceRequired
            toRemove = find(sum(coalitionResources,2)==min(sum(coalitionResources,2)));
            oldCoalitionMembers = coalitionMembers;
            oldCoalitionResources = coalitionResources;
            oldCoalitionCost = coalitionCost;
            coalitionMembers(toRemove) = [];
            coalitionResources(toRemove,:) = [];
            coalitionCost(toRemove) = [];
        end
        
        coalitionMembers = oldCoalitionMembers;
        coalitionResources = oldCoalitionResources;
        coalitionCost = oldCoalitionCost;
        
        % update the target vector considering the partial destroyable
        % condition
        leftResources = findLeftResources(actualPerformance(coalitionMembers), coalitionMembers,coalitionResources, broadcast(iBroadcast).ResourceRequired(1));
        %leftResources = sum(actualPerformance(coalitionMembers)*coalitionResources(:,1)) - sum(broadcast(iBroadcast).ResourceRequired);
        if roundn(leftResources,-1) < -0.1
            targetArray(target).allocatedTime = ctime;
            targetArray(target).estimatedHitTime = ctime + coalitionCost/uav.Velocity; %assumting that dt is 0.1
            targetArray(target).releaseTime = targetArray(target).estimatedHitTime + 15; % release the target into the wild after 5 seconds
            targetArray(target).leftResources = -leftResources;
        end
        
        % update Phat based on the formed coalition
        Phat = centralTrustUpdate(Phat, coalitionMembers);
        
        % send the broadcast message for coalition invitation
        broadcastId = length(nextBroadcast)+1;
        nextBroadcast(broadcastId).Type = 'Invitation';
        nextBroadcast(broadcastId).Target = target;
        nextBroadcast(broadcastId).Location = targetLocation;
        nextBroadcast(broadcastId).ResourceRequired = targetResourceRequired;
        nextBroadcast(broadcastId).CoalitionMembers = coalitionMembers;
        nextBroadcast(broadcastId).Cost = max(coalitionCost);
        nextBroadcast(broadcastId).coalitionPerformance = mean(actualPerformance(coalitionMembers));
        nextBroadcast(broadcastId).alpha = length(coalitionMembers);
        
        %    disp(['coalition formed with members ' num2str(coalitionMembers)])
        numCoalitions = numCoalitions + 1;
    end
    
end

end