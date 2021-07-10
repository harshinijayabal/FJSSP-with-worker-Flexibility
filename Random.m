function[OS,MA]=Random(M,J,JO,STO,CSJO,AJ,n)

% clc
% clear all
% M= input('Input the number of machines:'); % number of machines
% J= input('Input the number of jobs:'); % number of jobs
% JO=zeros(1,J); % initialize number of operations for jobs
% for i= 1:J
% fprintf('Input the number of operations in Job %d :',i) %  number of operations per job
% JO(i) = input('');
% end
% n=0
% STO=sum(JO) % Total operations
% CSJO= cumsum(JO) % cumulative sum of number of operations
AJ=zeros(1,J);
OS=zeros(1,STO);
while n<STO
 a=randi(J)
    for c=1:J
        if a==c
         if AJ(a)<JO(c)
            AJ(c)=AJ(c)+1;
            n=n+1;
            OS(n)=a;
            
    end
        end
    end
end

MA=randi(M,1,STO)