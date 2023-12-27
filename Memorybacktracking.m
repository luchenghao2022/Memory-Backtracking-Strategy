%_________________________________________________________________________
%  Memory Backtracking Strategy source code (Developed in MATLAB R2023a)
%
%  programming: Heming Jia & Chenghao Lu
%
% paper:
%  Heming Jia, Chenghao Lu, Zhikai Xing,
%  Memory backtracking strategy:an evolutionary updating mechanism for meta-heuristic algorithms
%  
%  DOI: https://doi.org/10.1016/j.swevo.2023.101456
%  
%  E-mails: jiaheming@fjsmu.edu.cn           (Heming Jia)
%           20210868203@fjsmu.edu.cn         (Chenghao Lu)
%           xingzk@whu.edu.cn                (Zhikai Xing) 
%_________________________________________________________________________

% Input parameters
% Mmax      ->memory size
% Mw        ->memory storage location
% Memory    ->individual positions in memory
% Memoryf   ->fitness values in memory
% pop       ->individual position
% fobj      ->fitness value function
% FES       ->number of current evaluations
% dim       ->problem dimension
% lu        ->problem boundary information

% Output 
% Mw        ->memory storage location
% Memory    ->individual positions in memory
% Memoryf   ->fitness values in memory
% pop       ->individual position
% popf      ->individual fitness value
% FES       ->number of current evaluations

%% Thinking stage
function [Mw,Memory,Memoryf,pop,popf,FES]=...
    Memorybacktracking(Mmax,Mw,Memory,Memoryf,pop,fobj,FES,dim,lu)

i=1;
% global githowdes

which1=findMemory(Memory,pop(i,:));
if isequal(Memory(which1,:),pop(i,:))

    % githowdes=githowdes+1;

    popnew=pop;
    popf=Memoryf(which1,:);

    how=ceil(dim/5);
    what1=randperm(dim);
    what2=what1(1:how);

    if rand<0.8&&FES>Mmax
        
        popnew(i,what2)=mean(Memory(Mmax-dim+ceil(sign(rand-0.5)*rand*dim/2):Mmax,what2),1);

    else

        popnew(i,what2)=popnew(i,what2)+tan(pi.*(rand(1,how)-0.5)).*(lu(2,what2)-lu(1,what2))/log(FES);

    end

    popnew(popnew>lu(2,:))=rand.*(lu(2,popnew>lu(2,:)) - lu(1,popnew>lu(2,:))) + lu(1,popnew>lu(2,:));
    popnew(popnew<lu(1,:))=rand.*(lu(2,popnew<lu(1,:)) - lu(1,popnew<lu(1,:))) + lu(1,popnew<lu(1,:));

    which1=findMemory(Memory,popnew(i,:));
    if isequal(Memory(which1,:),popnew(i,:))
        popnewf(i,1)=Memoryf(which1,1);
    else
        popnewf(i,1)=feval(fobj,popnew(i,:));
        FES=FES+1;
        [Mw,Memory,Memoryf]=saveMemory(Mmax,Mw,Memory,Memoryf,popnew(i,:),popnewf(i,1));
    end

    if popnewf(i,1)<popf
        pop=popnew(i,:);
        popf=popnewf(i,1);
    end

else

    popf(i,1)=feval(fobj,pop(i,:));
    FES=FES+1;
    [Mw,Memory,Memoryf]=saveMemory(Mmax,Mw,Memory,Memoryf,pop(i,:),popf(i,1));

end

end
