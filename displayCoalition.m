function displayCoalition(agentList)

global numTargets numAgents agent targetPos

clf;
% plot targets
hold on;
for i = 1:numTargets
    plot(targetPos(i,1), targetPos(i,2),'rx','MarkerSize',10,'LineWidth',2);
    text(targetPos(i,1)-5, targetPos(i,2)-5,strcat('T_',num2str(i)));
end
    
% plot agents
for i = 1:numAgents
    plot(agent(i).pos(1), agent(i).pos(2),'bo','MarkerSize',10,'LineWidth',2);
    text(agent(i).pos(1)-10, agent(i).pos(2)+10,strcat('A_',num2str(i)));
end

% plot routes based on sequence of targets;
colorseq = ['r'; 'b'; 'g'; 'c'; 'k'; 'm';'y'];
agents = agent;
for i = 1:numTargets
    numa = agentList.coalitionSeq(i);
    for j = 1:length(agentList.alist(numa).list)        
        x = [agents(agentList.alist(numa).list(j)).pos(1) targetPos(numa,1)   ];
        y = [agents(agentList.alist(numa).list(j)).pos(2)  targetPos(numa,2)  ];
        plot(x,y,colorseq(i,:),'LineWidth',2);
        agents(agentList.alist(numa).list(j)).pos = targetPos(numa,:);
    end
end
pause(.1)