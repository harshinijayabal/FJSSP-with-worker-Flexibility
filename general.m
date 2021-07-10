clc
clear all
% M= input('Input the number of machines:'); % number of machines
% J= input('Input the number of jobs:'); % number of jobs
M=3
J=3
% JO=zeros(1,J); % initialize number of operations for jobs
% for i= 1:J
% fprintf('Input the number of operations in Job %d :',i) %  number of operations per job
% JO(i) = input('');
% end
JO=[2 2 2]
STO=sum(JO) % Total operations
CSJO= cumsum(JO) % cumulative sum of number of operations
PT=[1 2 4;3 2 1;4 1 1;3 3 2;5 2 1;3 2 3]
JC=zeros(1,J)
MC=zeros(1,M)
CI=1
BC=zeros(1,J-1)
BC=CSJO(1:J-1)
AJ=zeros(1,J)
n=0
a=0
PO=5
d=zeros(1,STO)
% for i= 1:STO
% fprintf('Input the job order for sequencing :',i) %  number of operations per job
% OS(i) = input('');
% end
% for i= 1:STO
% fprintf('Input the MACHINE ORDER :',i) %  number of operations per job
% MA(i) = input('');
% end
for t=1:PO
[OS,MA]=Random(M,J,JO,STO,CSJO,AJ,n)
O(t,:)=OS
Q(t,:)=MA
[mak]=makespan(OS,PT,JC,MC,MA,CSJO,STO,J)
tm(t)= mak
end
fitness1=zeros(1,PO-1)
fitness2=zeros(1,PO-2)
for d=1:PO
[lb,bp]=min(tm)
besto=O(bp,:)
bestm=Q(bp,:)
r1=zeros((PO-1),STO)
j1=zeros((PO-1),STO)
r1(1:bp-1,:)=O(1:bp-1,:)
j1(1:bp-1,:)=Q(1:bp-1,:)
r1(bp:(PO-1),:)=O(bp+1:PO,:)
j1(bp:(PO-1),:)=Q(bp+1:PO,:)
fitness1= [tm(1:bp-1) tm(bp+1:PO)] 

[lw,wp]=max(fitness1)                          
[lw,wp]=max(fitness1) 
worsto=r1(wp,:)
worstm=r1(wp,:)
r2=zeros((PO-2),(STO)) 
j2=zeros((PO-2),(STO))
r2(1:wp-1,:)=O(1:wp-1,:)
j2(1:wp-1,:)=Q(1:wp-1,:)
r2(wp:(PO-2),:)=O(wp+1:PO-1,:)
j2(wp:(PO-2),:)=Q(wp+1:PO-1,:)
fitness2 = [fitness1(1:wp-1) fitness1(wp+1:PO-1)]
for g=1:PO-2 
    z=r2(g,:)
    sf=j2(g,:)
    [z_new]=opseq(worsto,besto,STO,z)
    [y_new]=mcseq(worsto,besto,sf)
    r2_new(g,:)=z_new
    j2_new(g,:)=y_new
    RT(g,:)=z_new
    GT(g,:)=y_new
    for lk=1:PO-2
    [mak]=makespan(OS,PT,JC,MC,MA,CSJO,STO,J,GT,RT)
    end
    
end
end
