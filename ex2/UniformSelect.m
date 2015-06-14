function edgeList = UniformSelect( n,d )
    
     % Total number of edges
    numOfEdges = 2*d*n;
    % The returned graph edges
    edgeList = zeros(numOfEdges,2);
    % counter to which edges we're generating now
    edgePosition = 1;
    
    % i is the current vertex
    for i = 1:n
        % j is the current edge
        for j = 1:d
            attachee = randi(n);
            % add edge
            edgeList( edgePosition ,:) = [i attachee];
            edgePosition = edgePosition+1;
            % add reciprocal edge
            edgeList( edgePosition ,:) = [attachee i];
            edgePosition = edgePosition+1;
        end
    end
    