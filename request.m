function nextBroadcast = request(uav,targets,targetLocations,targetResources,nextBroadcast)
% send a broadcast requesting for coalition formation

for iTarget = 1:length(targets)
    broadcastId = length(nextBroadcast)+1;
    nextBroadcast(broadcastId).Type = 'Request***';
    nextBroadcast(broadcastId).Id = uav.Id;
    nextBroadcast(broadcastId).Target = targets(iTarget);
    nextBroadcast(broadcastId).Location = targetLocations(targets(iTarget),:);
    nextBroadcast(broadcastId).ResourceRequired = targetResources(targets(iTarget),:);
    
%disp(['Uav ' num2str(uav.Id) ' found target ' num2str(targets(iTarget)) ' with resources ' num2str(targetResources(targets(iTarget),:))])

end
    