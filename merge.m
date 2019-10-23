clear all;
% load monteData
% monte_new = monte;
% load monteData20
% for i = 93:100
%     monte_new(i) = monte(i);
% end
% 
% load monteData1
% monte2 = monte1;
% load monteData2
% 
% for j = 58:75
%     monte2(j) = monte1(j);
% end
% 
% load monteData3
% 
% for k = 76:100
%     monte2(k) = monte1(k);
% end
% 
% monte = monte_new;
% monte1 = monte2;
% 
% 
% 
% count1 = 0;
% count2 = 0;
% 
% for i = 1:100
%         if monte(i).tarLength(5).targetTime(2) == 20000 
%             count1 = count1 + 1;
%         end
% 
%     if monte1(i).tarLength(5).targetTime(1) == 20000
%         count2 = count2 + 1;
%     end
% end

a = [3, 23, 35, 69, 77];
b = [3,21, 57, 78, 95];
num = [10, 20, 30, 40, 50];
plot(num, b);
hold on;
plot(num, a);





