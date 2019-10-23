function plotscene(uav,target,l,b)
% function to plot uavs and targets at each time step

% color for targets
colorChoice = ['rgbmycrgbymcrgbymc'];

     figure(1);  clf
%    axis([-l/2 l/2 -b/2 b/2])
    axis([-700 700 -775 700])
    %axis off; 
    hold on

% plot targets    
for iTarget = 1:length(target)
    if sum(target(iTarget).Resources) > 0
        plot(target(iTarget).Location(1),target(iTarget).Location(2),[colorChoice(1) 'x'],'markersize',10,'linewidth',2)
        text(target(iTarget).Location(1),target(iTarget).Location(2),strcat('T_',num2str(iTarget)),'FontSize',10);
    end
end

% plot uavs
for iUav = 1:length(uav)
    if ~isempty(uav(iUav).Target) & ~isempty(uav(iUav).coalitionMembers)
        uavColor = 'b';%colorChoice(uav(iUav).Target);
    elseif ~isempty(uav(iUav).Target) & uav(iUav).Status == 'InBDA******'
        uavColor = 'm';
    else
        uavColor = 'k';
    end
    uavPlot(uav(iUav).Position', uav(iUav).Heading,uavColor);
    text(uav(iUav).Position(1),uav(iUav).Position(2),strcat('A_',num2str(iUav)),'FontSize',10);
end
drawnow