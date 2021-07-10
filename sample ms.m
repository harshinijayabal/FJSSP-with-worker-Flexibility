clc
clear all
M= 3
J= 2
JO=[3 2] 
STO=sum(JO); % Total operations
CSJO= cumsum(JO) % cumulative sum of number of operations
PT=[2 5 6;1 3 1;2 2 1;3 4 4 ;2 1 3]
JC=[0 0]
MC=[0 0 0]
CI=1
AC=CSJO(1)
OS=[2 1 2 1 1]
MA=[3 1 3 2 1]
for i=1:STO
if(OS(i)==1)
        a=PT(CI,MA(i))
        CI=CI+1
        JC(1)=JC(1)+a
        MC(MA(i))=MC(MA(i))+a

else
        (OS(i)==2)
        a=PT(AC,MA(i))
        AC=AC+1
        JC(2)=JC(2)+a
        MC(MA(i))=MC(MA(i))+a
end
end
