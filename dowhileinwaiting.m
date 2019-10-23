function [uav, nextBroadcast] = dowhileinwaiting(uav,broadcast,nextBroadcast,Rmin)
% function to accept invitation and become part of coalition if invited or
% return to search mode

psi = uav.Heading;
V = uav.Velocity;
x = uav.Position(1);
y = uav.Position(2);


    if uav.InvitationWaitTime == 1
        iBroadcast = 0;
        while iBroadcast<length(broadcast) & uav.Status == 'InWaiting**'
            iBroadcast = iBroadcast + 1;
            if broadcast(iBroadcast).Type == 'Invitation'
                if sum(ismember(broadcast(iBroadcast).CoalitionMembers,uav.Id))
                    uav.Status = 'InCoalition';
                    uav.InvitationWaitTime = [];
                    uav.Target = broadcast(iBroadcast).Target;
                    uav.TargetLocation = broadcast(iBroadcast).Location;
                    uav.TurnRadius = findturnradius(uav,broadcast(iBroadcast).Location,broadcast(iBroadcast).Cost,Rmin);
                    uav.TurnDirection = -sign(sum(cross([cos(psi) sin(psi) 0],[([broadcast(iBroadcast).Location 0]-[x y 0])])));
                    uav.coalitionPerformance = broadcast(iBroadcast).coalitionPerformance;
                    uav.alpha = broadcast(iBroadcast).alpha;
                    uav.coalitionMembers = broadcast(iBroadcast).CoalitionMembers;
                end
            end
        end
        if uav.Status == 'InWaiting**'
            uav.Status = 'InSearch***';
            uav.InvitationWaitTime = [];
        end
    else
        uav.InvitationWaitTime = 1;
    end
