function nextBroadcast = respond(uav,broadcast,nextBroadcast,Rmin)
% function to send broadcast announcing availability for coalition

broadcastId = length(nextBroadcast)+1;

nextBroadcast(broadcastId).Type = 'Response**';
nextBroadcast(broadcastId).Id = broadcast.Id;
nextBroadcast(broadcastId).Target = broadcast.Target;
nextBroadcast(broadcastId).Location = broadcast.Location;
nextBroadcast(broadcastId).Uav = uav.Id;
nextBroadcast(broadcastId).Resources = uav.Resources;
nextBroadcast(broadcastId).ResourceRequired = broadcast.ResourceRequired;
nextBroadcast(broadcastId).Cost = dubinsdistance(uav,broadcast.Location,Rmin);
%UAV never broadcasts its trust value
%nextBroadcast(broadcastId).trust = uav.trust; 


% disp(['Uav ' num2str(uav.Id) ' responded with ' num2str(uav.Resources) ' resources and ' num2str(nextBroadcast(broadcastId).Cost) ' cost'])
