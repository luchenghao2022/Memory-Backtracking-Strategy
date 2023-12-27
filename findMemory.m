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
% Memory    -> individual positions in memory
% pop       -> individual position

% Output 
% which1    -> memory index

%% Recall stage
function which1=findMemory(Memory,pop)
which1=find(Memory(:,1)==pop(1,1));
i=2;
while size(which1,1)>1
    which1=which1(Memory(which1,i)==pop(1,i));
    i=i+1;
end
end
