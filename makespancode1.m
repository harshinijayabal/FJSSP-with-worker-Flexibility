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
        if CI==1
    a=PT(CI,MA(i))
        JC(1)=JC(1)+a
        MC(MA(i))=(MC(MA(i)))+a
        CI=CI+1
        else
        a=PT(CI,MA(i))
        
        MC(MA(i))=max(MC(MA(i)),JC(1))+a
        JC(1)=JC(1)+a
        CI=CI+1
        end
            
else
        
        if AC==CSJO(1)
        AC=AC+1
        a=PT(AC,MA(i))
        JC(2)=JC(2)+a
        MC(MA(i))=(MC(MA(i)))+a
        else
            AC=AC+1
        a=PT(AC,MA(i))
        
        MC(MA(i))=max(MC(MA(i)),JC(2))+a
        JC(2)=JC(2)+a
        end
            
     
        
end
end
makespan=max(MC)
