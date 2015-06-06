function [ newState ] = infectionStep( state,edgeList,pSI,pIR,pRS )
%infectionStep(state,edgeList,pSI,pIR,pRS) simulates a single round of the
%infection simulation.
%   state is a vector of length n with values 0,1,or 2 denoting Susceptible, Infected, or Removed nodes
%   edgeList is an m-by-2 matrix. Each of the m rows represents an edge in the network. The value of each coordinate is from 1...n.
%   pSI,pIR,pRS are probabilities that a node becomes infected, removed or
%   susceptible (see the exercise description for details).
Susceptible=0;
Infected = 1;
Removed = 2;

newState=state; %init the state vectore. 

%iterate over all edges, and see if they trigger infection:
for i=1:size(edgeList,1) 
    if(state(edgeList(i,2))==Susceptible && state(edgeList(i,1))==Infected)
        if(rand(1)<pSI)
            newState(edgeList(i,2))=Infected;
        end
    end
end

%iterate over all vertices
for i=1:size(state,1)
    if(state(i)==Infected) %if was infected in last round it may change to removed
        if (rand(1)<pIR)
            newState(i)=Removed;
        end
    end
    if(newState(i)==Removed) %if is removed in NEW state, may become susceptible.
        if (rand(1)<pRS)
            newState(i)=Susceptible;
        end
    end
end

end                                                         

