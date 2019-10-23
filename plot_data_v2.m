clear all;

load monteData-Copy
load monteData1-Copy

for i = 1:100
    for j = 1:5
        monte(i).tarLength(j).targetTime(1) = monte1(i).tarLength(j).targetTime;
        monte(i).tarLength(j).covgTime(1) = monte1(i).tarLength(j).covgTime;
        monte(i).tarLength(j).numCoalitions(1) = monte1(i).tarLength(j).numCoalitions;
        monte(i).tarLength(j).numResources(1) = monte1(i).tarLength(j).numResources;
    end
end

