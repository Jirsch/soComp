function edgeList = UniformSelect( n,d )

    numOfEdges = 2*d*n;
    edgeList = zeros(numOfEdges,2);
    edgePosition = 1;
    
    for i = 1:n
        for j = 1:d
            attachee = randi(n);
            edgeList( edgePosition ,:) = [i attachee];
            edgePosition = edgePosition+1;
            edgeList( edgePosition ,:) = [attachee i];
            edgePosition = edgePosition+1;
        end
    end
    