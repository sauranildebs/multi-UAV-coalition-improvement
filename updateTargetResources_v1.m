function newResources = updateTargetResources_v1(orgTargetResource, coalitionPerformances)

coalitionResources = repmat([3 0 0],length(coalitionPerformances),1);
newResources = orgTargetResource(1) - sum(coalitionPerformances.*coalitionResources(:,1)');
if newResources <= 0
    newResources = 0;
end
newResources = [newResources 0 0];
