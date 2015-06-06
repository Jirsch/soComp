function [ edgeList ] = SmallWorld( n,p )
% SmallWorld( n,p ) a 2D small world network of size n-by-n. Each node is
% initially connected to its 8 neighbors (except nodes at the edge of the grid)
% and all edges are rewired with probability p (i.i.d). 


numEdges = (n-2)*(n-2)*8+(n-2)*4*5+4*3;
edgeList = zeros(numEdges,2);
counter =1;

%create the grid structure by adding edges to 8 neighbors around the node.
for i=1:n
    for j=1:n
        addEdge(i,j,1,0);
        addEdge(i,j,-1,0);
        addEdge(i,j,0,1);
        addEdge(i,j,0,-1);
        addEdge(i,j,1,-1);
        addEdge(i,j,1,1);
        addEdge(i,j,-1,1);
        addEdge(i,j,-1,-1);
    end
end

%rewire edges with probability p. Nodes that are rewired have 
% uniformly selected source and target nodes. 
for i=1:size(edgeList,1)
    if rand(1)<p
        edgeList(i,2) = conv(randi(n,1),randi(n,1),n);
    end
end

%helper functions:
    function addEdge(x,y,dx,dy)
        if (x+dx<=0 || x+dx>n || y+dy<=0||y+dy>n)
            return;
        else
            edgeList(counter,:) = [conv(x,y,n), conv(x+dx,y+dy,n)];
            counter = counter+1;
        end
    end

    function [coord] = conv(x,y,n)
        coord = (mod(x,n))*n+mod(y,n)+1;
    end
end

