clear all; close all; clc

figure

rndSeed = round(1000*rand);

rng(rndSeed)

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


A = repmat(e,N,1);
A(e==0,:) = 0;

% update rule    
Y = Y + k*A*(X-Y);

% plot the convergence    
plot(i,Y,'.'); hold on

end

% plot the actual
plot(i,X,'s')
title('Every agent has an equal chance of being in the coalition')

% convergence issue when the measurement is given randomly for every
% coalition
rng(rndSeed)
figure
N = 10; % number of agents

X = rand(N,1); % actual performance indices

Y = ones(N,1); % initial guess of performance indices 

k = 0.1; % update gain

% do over coalitions
for i = 1:500

% create a vector e such that agents corresponding to locations where 
% e is 1 are part of the current coalition   

e = rand(1,N).*Y'; % assign a random number to an agent but weighted by its estimated performance
e(e>rand) = 1; % thus there is a lower chance that agents with low performance being part of coalitions
e(e<1) = 0;


A = repmat(e,N,1);
A(e==0,:) = 0;

% for each coalition the agents get different measurements
X = rand(N,1); % actual performance indices


% update rule    
Y = Y + k*A*(X-Y);

% plot the convergence    
plot(i,Y,'.'); hold on

end

% plot the actual
plot(i,X,'s')
title('Trust estimate when a random target destruct value is given to the coalition')


