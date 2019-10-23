pmc=0;
secCount=1;
for i =2:length(A)
    avg=A(i,1);
    messCount=avg*secCount+pmc;
    pmc=pmc+messCount;
    display(messCount);
    %display(avg);
    secCount=secCount+1;
end