function [uav,target,targetResources,nextBroadcast, tempPosition] = uavlogic3(uav,target,dt,l,b,targetLocations,targetResources,broadcast,nextBroadcast)
% main logic is implemented in this function

global trustGain  trustFlag actualPerformance updatedTargetResources

Rmin = 40; % minimum radius of turn

% extracting the velocity, position and heading information of uav
psi = uav.Heading;
V = uav.Velocity;
x = uav.Position(1);
y = uav.Position(2);

% find which targets are being pursued currently (need to avoid them during
% search)
[uav, trackedTargets] = trackedtargets(uav,broadcast,targetResources);

% to be done is uav is a coalition formation coordinator
if ~isempty(uav.CoalitionLeader)
    [uav, nextBroadcast] = doifcoalitioncoordinator(uav,broadcast,nextBroadcast);
end

% to be done if a uav is waiting for coalition formation after response to
% a request
if uav.Status == 'InWaiting**'
    [uav, nextBroadcast] = dowhileinwaiting(uav,broadcast,nextBroadcast,Rmin);
    [uav, nextBroadcast] = search(uav,trackedTargets,targetLocations,targetResources,nextBroadcast);
end

% if a uav is in search mode, do the following, respond to coalition
% formation request if have enough resources
if uav.Status == 'InSearch***'
    iBroadcast = 0;
    while iBroadcast<length(broadcast) & uav.Status == 'InSearch***'
        iBroadcast = iBroadcast + 1;
        if broadcast(iBroadcast).Type == 'Request***'
            if sum(broadcast(iBroadcast).ResourceRequired.*uav.Resources)
                nextBroadcast = respond(uav,broadcast(iBroadcast),nextBroadcast,Rmin);
                uav.Status = 'InWaiting**';
                uav.InvitationWaitTime = 0;
            end
        end
    end
    [uav, nextBroadcast] = search(uav,trackedTargets,targetLocations,targetResources,nextBroadcast);
end

% update uav position
tempPosition = [x y] + [cos(psi) sin(psi)]*V*dt;

% update uav heading. contains logic for path following if in a coalition
if uav.Status == 'InCoalition'
    
    xt = uav.TargetLocation(1);
    yt = uav.TargetLocation(2);
    
    uav.CoalitionTime = uav.CoalitionTime + 1;
    if uav.CoalitionTime>10
        
        theta = atan2(yt-y,xt-x);
        if theta<0
            theta=theta+2*pi;
        end
        
        dpsi = psi-theta;
        if dpsi>pi
            dpsi = -2*pi+dpsi;
        elseif dpsi<-pi
            dpsi = 2*pi+dpsi;
        end
        if abs(dpsi)<1e-1
            % head straight to target
            psi = psi-dpsi*dt;
        else
            % take a turn to target
            psi = psi + uav.TurnDirection*V/uav.TurnRadius*dt;
            if psi>2*pi
                psi = psi-2*pi;
            elseif psi<0
                psi = psi+2*pi;
            end
        end
        
    else
        
        psi = psi + uav.TurnDirection*V/uav.TurnRadius*dt;
        if psi>2*pi
            psi = psi-2*pi;
        elseif psi<0
            psi = psi+2*pi;
        end
    end
    
    % if uav in oalition has reached target then release weapons, destroy target reset to search mode
    if (x-xt)^2+(y-yt)^2<2*10^2
        % leftResources = nonnegativeclip(uav.Resources-targetResources(uav.Target,:));
        remainingResources = nonnegativeclip(targetResources(uav.Target,:)-uav.Resources);
        if remainingResources==0
            target(uav.Target).Resources = updateTargetResources_v2([updatedTargetResources(uav.Target,1) 0 0], actualPerformance(uav.Id));
            targetResources(uav.Target,:) = target(uav.Target).Resources;
            updatedTargetResources(uav.Target,:) = target(uav.Target).Resources;
            target(uav.Target).visit = target(uav.Target).visit + 1;
        else
            targetResources(uav.Target,:) = remainingResources;
            target(uav.Target).Resources = remainingResources;
        end
        uav.Resources = uav.Resources;%leftResources;
        uav.Status = 'InSearch***';
        % update rule
        if trustFlag == 1
            for icm = 1:length(uav.coalitionMembers)
                uav.trustValues(uav.coalitionMembers(icm)) = uav.trustValues(uav.coalitionMembers(icm)) + trustGain*(uav.coalitionPerformance-mean(uav.trustValues(uav.coalitionMembers)));
            end
        end
        uav.Target = [];
        uav.TargetLocation = [];
        uav.TurnRadius = [];
        uav.TurnDirection = [];
        uav.CoalitionTime = 0;
    end
    % search for targets
    [uav, nextBroadcast] = search(uav,trackedTargets,targetLocations,targetResources,nextBroadcast);
    
else
    % if a uav goes out of field of interest, take an anti-clockwise turn and
    % come back to field
    if x<-l/2|x>l/2|y<-b/2||y>b/2
        psi = psi + V/Rmin*dt;
        if psi>2*pi
            psi = psi-2*pi;
        end
    end
    
end

% update uav heading
uav.Heading = psi;
