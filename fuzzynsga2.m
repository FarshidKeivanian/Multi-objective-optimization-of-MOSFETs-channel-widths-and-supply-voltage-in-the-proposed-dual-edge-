clc;
clear;
close all;

%% Problem Definition

CostFunction=@(x) Objectives(x)        %Objectives;

nVar=2;             % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin=+0.2;  %az -5        % Lower Bound of Variables
VarMax=+2;       %5   % Upper Bound of Variables

% Number of Objective Functions
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));


%% NSGA-II Parameters

MaxIt=50;     %100 % Maximum Number of Iterations

nPop=5;  %50      % Population Size

%pCrossover=0.7;                         % Crossover Percentage
pCrossover=0.7;
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

%pMutation=0.4;                          % Mutation Percentage
pMutation=0.4; 
nMutation=round(pMutation*nPop);        % Number of Mutants

mu=0.05;                    % Mutation Rate

sigma=0.1*(VarMax-VarMin);  % Mutation Step Size


%% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    pop(i).Cost=CostFunction(pop(i).Position);
    
end

% Non-Dominated Sorting
[pop F]=NonDominatedSorting(pop);

% Calculate Crowding Distance
pop=CalcCrowdingDistance(pop,F);

% Sort Population
[pop F]=SortPopulation(pop);

% Array to Hold Best Cost Values
%BestCost=zeros(It,1);

%%
% Store Worst Cost
%WorstCost=pop(end).Cost(1) + pop(end).Cost(2)
 if pop(end).Cost(1) < pop(1).Cost(1)
          BestCost=pop(end).Cost(1)
 elseif pop(1).Cost(1) < pop(end).Cost(1)
          BestCost=pop(1).Cost(1)
 end
%%

%% NSGA-II Main Loop

for it=1:MaxIt
    
    % Crossover
    popc=repmat(empty_individual,nCrossover/2,2);
    for k=1:nCrossover/2
        
        i1=randi([1 nPop]);
        p1=pop(i1);
        
        i2=randi([1 nPop]);
        p2=pop(i2);
        
        [popc(k,1).Position popc(k,2).Position]=Crossover(p1.Position,p2.Position);
        
        popc(k,1).Cost=CostFunction(popc(k,1).Position)
        popc(k,2).Cost=CostFunction(popc(k,2).Position)
        
    end
    popc=popc(:);
    
    % Mutation
    popm=repmat(empty_individual,nMutation,1);
    for k=1:nMutation
        
        i=randi([1 nPop]);
        p=pop(i);
        
        popm(k).Position=Mutate(p.Position,mu,sigma);
        
        popm(k).Cost=CostFunction(popm(k).Position);
        
    end
    
    % Merge
    pop=[pop
         popc
         popm];
     
    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    [pop F]=SortPopulation(pop);
    
    %%
     % Update Worst Cost
    %WorstCost=max(WorstCost,pop(end).Cost(1)+pop(end).Cost(2))
    
    % Update Best Cost
    %BestCost=min(BestCost(it),pop(1).Cost(1)+pop(1).Cost(2))
    
    %%
    
    % Truncate
    pop=pop(1:nPop);
    
    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    [pop F]=SortPopulation(pop);
    
    % Store F1
    F1=pop(F{1});
    
    %%
    % Store Best Cost Ever Found
   % BestCost(it)=pop(1).Cost(1) + pop(1).Cost(2)
    %%
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
    
     
    %% 1. Normalization of FIS Inputs
 itnormalized = it / MaxIt
 
%for f=1: 2
    
  %   a = min (F1(1,1).Cost(1),F1(f,1).Cost(1));
%end
 
%a = min (a, F1(end,1).Cost(1))

%  BestCostnormalized =  100 * a
 if pop(end).Cost(1) < pop(1).Cost(1)
          BestCost=pop(end).Cost(1)
 elseif pop(1).Cost(1) < pop(end).Cost(1)
          BestCost=pop(1).Cost(1)
 end
BestCostnormalized2 = 200 * BestCost

if BestCostnormalized2 > 1 
BestCostnormalized = 1
end
 %min ( ( WorstCost - BestCost(it) ) / WorstCost )
  
 %% 2. Read FIS file
 FISMAT = readfis('Fuzzy_NSGA2_FIS.fis')
 
 %% 3. Define Input Arguments for FIS Before Firing Rules
 U = [itnormalized , BestCostnormalized]
  
 %% 4. Fire Rules or Run Evalfis Command
 Y = evalfis(U,FISMAT)
    
    % Plot F1 Costs
    %hold on;
    figure(3);
    PlotCosts(F1)
    
end

%% Results
