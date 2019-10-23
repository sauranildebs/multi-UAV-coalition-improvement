function distance = dubinsdistance(uav,targetLocation,Rmin)
% function to calculate dubins distance from uav current position to target

x = uav.Position(1);
y = uav.Position(2);
psi = uav.Heading;

xt = targetLocation(1);
yt = targetLocation(2);

if sum(cross([cos(psi) sin(psi) 0],[xt-x yt-y 0]))>0
    
    xc = x+Rmin*sin(psi);
    yc = y-Rmin*cos(psi);
    
    theta1 = acos(Rmin/sqrt((xt-xc)^2+(yt-yc)^2));
    theta2 = pi/2-psi;
    theta3 = atan2(yt-yc,xt-xc);
    if theta3<0
        theta3 = theta3+2*pi;
    end

    theta = 2*pi - (theta2-(pi-theta1)+theta3);
    
    if theta>2*pi
        theta = theta-2*pi;
    elseif theta<0
        theta = theta+2*pi;
    end

    xe = xc - Rmin*cos(theta1-(pi-theta3));
    ye = yc - Rmin*sin(theta1-(pi-theta3));

else
    
    xc = x-Rmin*sin(psi);
    yc = y+Rmin*cos(psi);

    theta1 = acos(Rmin/sqrt((xt-xc)^2+(yt-yc)^2));
    theta2 = pi/2-psi;
    theta3 = atan2(yt-yc,xt-xc);
    if theta3<0
        theta3 = theta3+2*pi;
    end

    theta = 2*pi - (theta1-(theta2+theta3));

    if theta>2*pi
        theta = theta-2*pi;
    elseif theta<0
        theta = theta+2*pi;
    end

    xe = xc + Rmin*cos(theta1-theta3);
    ye = yc - Rmin*sin(theta1-theta3);

end

distance = Rmin*theta+sqrt((xt-xe)^2+(yt-ye)^2);