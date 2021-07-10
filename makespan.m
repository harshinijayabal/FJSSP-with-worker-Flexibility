% makespan evaluation function
 function[mak]=makespan(OS,PT,JC,MC,MA,CSJO,STO,J,GT,RT)
% clc
% clear all
% M=3                         %No of machines
% J=3                         %no of jobs
% JO=[2 2 2]                  %no of job operations for each job
% STO=sum(JO) % Total operations
% CSJO= cumsum(JO) % cumulative sum of number of operations
% PT=[1 2 4;3 2 1;4 1 1;3 3 2;5 2 1;3 2 3]
% JC=zeros(1,J)               
% MC=zeros(1,M)
% OS=[1 3 2 2 1 3]
% MA=[3 1 1 2 3 2]

CI=1
BC=zeros(1,J-1)
BC=CSJO(1:J-1)
a=0

 
for i=1:STO
if(OS(i)==1)
        if CI==1
    a=PT(CI,MA(i))
        b=JC(1)
        c=MC(MA(i))
        JC(1)=max(MC(MA(i)),JC(1))+a
        MC(MA(i))=max(b,c)+a
        CI=CI+1
        else
            
        a=PT(CI,MA(i))
        b=JC(1)
        c=MC(MA(i))
        JC(1)=max(MC(MA(i)),JC(1))+a
           
        MC(MA(i))=max(b,c)+a
        
        CI=CI+1
        end
            
else
      for k=2:J
        if(OS(i)==k)
          if BC(k-1)==CSJO(k-1)
             BC(k-1)=BC(k-1)+1
             a=PT(BC(k-1),MA(i))
             b=JC(k) 
            c=MC(MA(i))
    JC(k)=max(MC(MA(i)),JC(k))+a
             MC(MA(i))=max(b,c)+a
             
            
          else
            BC(k-1)=BC(k-1)+1
            a=PT(BC(k-1),MA(i))
            b=JC(k) 
            c=MC(MA(i))
             JC(k)=max(MC(MA(i)),JC(k))+a
             MC(MA(i))=max(b,c)+a
          
           
            
          end
        end
        end
        end
            
     
        
end

mak=max(MC)
 end
