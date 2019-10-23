function Phat = centralTrustUpdate(Phat, coalition)

global  actualPerformance

P = actualPerformance;

Ck = zeros(length(P),1);
Ck(coalition) = 1;

CPk = Ck'*P'/length(coalition);

CPkhat = Ck'*Phat'/length(coalition);

eta = 1/length(coalition);
for i = 1:length(coalition)
    Phat(coalition(i)) = Phat(coalition(i)) + eta*(CPk - CPkhat);
end

