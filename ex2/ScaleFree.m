function edgeList = ScaleFree( n,d )
    % Total number of edges
    numOfEdges = 2*d*n;
    % The returned graph edges
    edgeList = zeros(numOfEdges,2);
    % Document each vertex degree
    vertexDegrees = zeros(n,1);
    
    % counter to which edges we're generating now
    edgePosition = 1;
    
    % generate the clique
    for i = 1:(2*d+1)
        for j = 1:(2*d+1)
            % for distinct vertices
            if i~=j
                % assign the edge
                edgeList( edgePosition ,:) = [i j];
                edgePosition = edgePosition+1;
                % update degree
                vertexDegrees(i) = vertexDegrees(i)+1;
            end
        end
    end
    
    % generate the rest of the edges, based on degree
    % i is the current new vertex, j is the edge counter
    for i=1:n-2*d-1
        for j=1:d
            % to which vertex we'll be attched to.
            % drawing uniformally from 1 to edgePosition and using that edge's
            % first vertex will guarantee the degree bias we want
            attachee = randi(edgePosition-1);
            
            % add edge
            edgeList(edgePosition,:) = [(i+2*d+1) edgeList(attachee,1)];
            edgePosition = edgePosition +1;
            vertexDegrees(i+2*d+1) = vertexDegrees(i+2*d+1) + 1;
            % add reciprocal edge
            edgeList(edgePosition,:) = [edgeList(attachee,1) (i+2*d+1)];
            edgePosition = edgePosition +1;
            vertexDegrees(edgeList(attachee,1)) = vertexDegrees(edgeList(attachee,1)) + 1;
        end
    end