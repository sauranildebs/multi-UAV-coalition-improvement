function pathlength = euc_dist(sxy, txy)
% this fucntion computes eculidean distance between two points
% sxy - souce x y position
%txy target x- y postions
pathlength = sqrt((sxy(1)-txy(1))^2 + (sxy(2)-txy(2))^2);
