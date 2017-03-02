function [out] = KMeansCluster(k,kernel,data, initClassAssignments,varargin)
    % defaults
    update = false;
    retrieveDataAt = 0;

    % parse arguments
    for i=1:2:length(varargin)
        switch varargin{i}
        case 'UpdatePlot'
            update = varargin{i+1};
        case 'RetrieveData'
            retrieveDataAt = varargin{i+1};
        default
            error('%s is not a valid argument name',varargin{i});
        end
    end

    classAssignments=initClassAssignments;
    ClassAssignmentsChanged = 0;
    classAt = cell(0);
    iterationCounter = 0;
    
    while iterationCounter < 100 && ClassAssignmentsChanged == 0
        if update == true
            gscatter(data(1,:), data(2,:), classAssignments)
            drawnow
        end
        
        iterationCounter = iterationCounter+1;       
        distances=GetDistances(k,data,classAssignments,kernel); %calculate new distances
        newClassAssignments = CalculateClassAssignments(distances); %make new classAssignments
        ClassAssignmentsChanged = IsClassAssignmentsChanged(...
            newClassAssignments,classAssignments);
        classAssignments=newClassAssignments;
        
        if retrieveDataAt > 0 && nnz(iterationCounter==retrieveDataAt)
            classAt{1,numel(classAt)+1}=iterationCounter; % do whatever you
            classAt{2,numel(classAt)+1}=classAssignments; % want here Axel
        end
    end
    
    out=cell(0);
    out{1,1}=iterationCounter;
    out{2,1}=classAssignments;

end

%% Internal funcitons, not supposed to be used anywhere else than in KMeansCluster

function [ClassAssignments] = CalculateClassAssignments(distances)
    [~,ClassAssignments] = min(distances);
end

function [ClassAssignmentsChanged] = IsClassAssignmentsChanged(...
    newClassAssignment,classAssignment)
    ClassAssignmentsChanged=isequal(newClassAssignment,classAssignment);
end

function [distances] = GetDistances(K,data,classAssignments,kernel)
    nData=size(data,2);
    distances=zeros(K,nData);
    kMatrix = feval(kernel, data);

    for n=1:nData
        for k=1:K
            Z = (classAssignments == k);
            N_k = sum(Z);
            distances(k,n) = kMatrix(n,n) - ...
                2/N_k*(kMatrix(n,:)*Z') +...
                1/(N_k^2)*sum(sum(Z'.*Z.*kMatrix));
        end
    end
end
