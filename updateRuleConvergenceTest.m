clear all; close all; clc

figure

rndSeed = round(1000*rand);

randseed(rndSeed)

N = 10; % number of agents

X = rand(N,1); % actual performance indices

Y = ones(N,1); % initial guess of performance indices 

k = 0.1; % update gain


% do over coalitions
for i = 1:500

% create a vector e such that agents corresponding to locations where 
% e is 1 are part of the current coalition   

e = rand(1,N); % assign a random number to each agent
e(e>rand) = 1; % agent is part of coalition if the assigned random number is greater than a threshold
e(e<1) = 0;

cmem = find(e==1);
% update rule
for j = 1:length(cmem)
    Y(cmem(j)) = Y(cmem(j)) + k*(mean(X(cmem)) - Y(cmem(j)));
end


% plot the convergence    
plot(i,Y,'.'); hold on

end

% plot the actual
plot(i,X,'s')
title('Every agent has an equal chance of being in the coalition')
