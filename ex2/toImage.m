function [ img ] = toImage ( state,n,figNum )
%toImage ( state,N,figNum )
%   graphically present the state of a 2D small world network. state is the
%   current state of each vertex (0,1,2 to denote Susceptible, Infected, or
%   Removed). 
%   figNum is the number of the figure to draw on (e.g., use figure 1 if no other figures are opened by your code).

img = zeros(n);

Susceptible=0;
Infected = 1;
Removed = 2;

White = 1;
Gray = 0.5; 

%iterate over all nodes. 
for i=1:n
    for j=1:n
        coord = (mod(i,n))*n+mod(j,n)+1;
        if(state(coord)==Infected)
            img(i,j)=White; %color infected nodes white
        else
            if (state(coord)==Removed)
                img(i,j)=Gray; %color removed nodes as gray.
            end
        end
    end
end

figure(figNum);
imshow(img,'InitialMagnification','fit');
drawnow
end

