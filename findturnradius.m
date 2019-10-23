function turnRadius = findturnradius(uav,targetLocation,distanceRequired,Rmin)
% function to find the turn radius to take to attain a rendezvous in
% coaltion attack

turnRadius = Rmin;
distance = dubinsdistance(uav,targetLocation,turnRadius);

while distance<distanceRequired
    turnRadius = turnRadius + 0.1;
    distance = dubinsdistance(uav,targetLocation,turnRadius);
end

