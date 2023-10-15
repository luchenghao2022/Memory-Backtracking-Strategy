%_________________________________________________________________________
%  Memory Backtracking Strategy source code (Developed in MATLAB R2023a)
%
%  programming: Heming Jia & Chenghao Lu
%
% paper:
%  Heming Jia, Chenghao Lu, Zhikai Xing,
%  Memory backtracking strategy:an evolutionary updating mechanism for meta-heuristic algorithms
%  
%  DOI:
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
% pop       -> individual position
% popf      ->individual fitness value

% Output 
% Mw        ->memory storage location
% Memory    ->individual positions in memory
% Memoryf   ->fitness values in memory

%% Memory stage
function [Mw,Memory,Memoryf]=saveMemory(Mmax,Mw,Memory,Memoryf,pop,popf)
Mw=Mw+1;
if Mw>Mmax
    Mw=1;
    [Memoryf,sy]=sort(Memoryf,"descend");
    Memory=Memory(sy,:);
end
Memory(Mw,:)=pop(1,:);
Memoryf(Mw,1)=popf(1,1);
end