function newResources = updateTargetResources(orgTargetResource, coalitionPerformances, visits)

visits = visits+1;
coalitionResources = repmat([3 0 0],length(coalitionPerformances),1);
newResources = orgTargetResource(1);
while visits >= 1
    newResources = newResources - sum(coalitionPerformances.*coalitionResources(:,1)');
    visits = visits -1;
end
if newResources <= 0
    newResources = 0;
end
newResources = [newResources 0 0];
