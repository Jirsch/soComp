close all; %close all open figures.
clear all; %clear the value of all variables.

%constants:
Susceptible=0;
Infected = 1;
Removed = 2;

pSI=0.0416; %probability of infection by each neighbor
pIR=0.04; %probability of spontaneous recovery
%pRS=0.0003; %probability of spontaneous lost immunity
pRS=1.0;

%n = 200; %the size of the small-world network will be n-by-n
n=100;
p_rewire = 0.001; %the probability that an edge is rewired in the small-world network.

%create the graph:
disp('creating graph...')
%edgeList = SmallWorld(n,p_rewire);
edgeList = UniformSelect(10000,4);


%start all nodes out as Susceptible
state = zeros(n*n,1);
%infect a single random node.
state(randi(n*n,1))= Infected;

%run the simulation:
disp('running simulation...')
round = 1;
%follow the number of infected nodes:
num_infected(round) = sum(state == Infected);
num_removed(round) = sum(state == Removed);
while(num_infected(round)>0)
    
    state = infectionStep(state,edgeList, pSI,pIR,pRS);
    round = round+1;
    num_infected(round) = sum(state == Infected);
    num_removed(round) = sum(state == Removed);
    
    %plot the number of infected nodes in figure 1.
    if(mod(round,25)==0 || num_infected(round)==0)
        figure(1);
        plot(num_infected,'r');
        xlabel('round');
        ylabel('num nodes');
        hold on
        plot(num_removed,'b');
        hold off
        drawnow;
    
        %show a graphical representation of the infected nodes in figure 2.
        toImage(state,n,2);
        pause(0.1);
    end
end
