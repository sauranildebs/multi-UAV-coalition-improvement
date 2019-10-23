function leftResources = findLeftResources(actualPerformance, coalitionMembers,coalitionResources, targetResources)

global trustFlag errorFlag Phat
coalitionResources = ones(length(coalitionMembers),1)*3;
[ix,iy] = sort(-actualPerformance);
totalResources = 0;
actualResources = 0;
for i = 1:length(coalitionMembers)
    if totalResources < targetResources
        if trustFlag == 1
            totalResources = totalResources + Phat(coalitionMembers(iy(i)))*coalitionResources(iy(i),1);
        else
            totalResources = totalResources + coalitionResources(iy(i),1);
        end
        if totalResources > targetResources
            reqResources = coalitionResources(iy(i))-(totalResources-targetResources);
            actualResources = actualResources + (max(1,reqResources))*actualPerformance(iy(i));
            break
        else
            actualResources = actualResources + coalitionResources(iy(i),1)*actualPerformance(iy(i));
        end
    else
        break;
    end
end
leftResources =   actualResources - targetResources;
% if length(actualPerformance) == 1
%     if trustFlag == 0
%         actualResources = ceil(targetResources)*actualPerformance;
%         leftResources =   actualResources - targetResources;
%     else
%         if errorFlag == 0
%             leftResources =  0;% actualResources - targetResources;
%         else
%             actualResources = ceil(targetResources)*actualPerformance;
%             leftResources =   actualResources - targetResources;
%         end
%         
%     end
% else
%     for i = 1:length(coalitionMembers)-1
%         totalResources = totalResources + coalitionResources(i,1);
%         actualResources = actualResources + coalitionResources(i,1)*actualPerformance(i);
%     end
%     if trustFlag == 0
%         leftResources = actualResources+ (targetResources(1)-actualResources)*actualPerformance(i+1) - targetResources;
%     else
%         if errorFlag == 0
%             leftResources =  0;% actualResources - targetResources;
%         else
%             actualResources = actualResources + ceil(targetResources(1)-actualResources)*actualPerformance(i+1);
%             leftResources =   actualResources - targetResources;
%         end     
%     end
% end