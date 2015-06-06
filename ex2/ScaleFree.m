function edgeList = ScaleFree( n,d )

    numOfEdges = 2*d*n;
    edgeList = zeros(numOfEdges,2);
    vertexDegrees = zeros(n,1);
    
    edgePosition = 1;
    for i = 1:(2*d+1)
        for j = 1:(2*d+1)
            if i~=j
                edgeList( edgePosition ,:) = [i j];
                edgePosition = edgePosition+1;
                vertexDegrees(i) = vertexDegrees(i)+1;
            end
        end
    end
    
    for i=1:n-2*d-1
        for j=1:d
            attachee = randi(edgePosition-1);
            edgeList(edgePosition,:) = [(i+2*d+1) edgeList(attachee,1)];
            edgePosition = edgePosition +1;
            vertexDegrees(i+2*d+1) = vertexDegrees(i+2*d+1) + 1;
            edgeList(edgePosition,:) = [edgeList(attachee,1) (i+2*d+1)];
            edgePosition = edgePosition +1;
            vertexDegrees(edgeList(attachee,1)) = vertexDegrees(edgeList(attachee,1)) + 1;
        end
    end