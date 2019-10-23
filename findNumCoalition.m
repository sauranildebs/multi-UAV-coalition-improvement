function jumps = findNumCoalition(pconvg)

numAgents = size(pconvg,2);
jumps = zeros(numAgents,1);
for i = 1:numAgents
    cvalue = 1;
    plength = length(pconvg);
    t = 1;
    while t <= plength
        if pconvg(t,i) < cvalue
            cvalue = pconvg(t,i);
            jumps(i) = jumps(i) + 1;
        end
        t = t + 1;
    end
end