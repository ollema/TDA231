function [out,musAt] = KMeansCluster(k,kernel,data,...
    initialClassAssignments,retrieveDataAt)

    %define k
    classAssignments=initialClassAssignments;
    %distances=GetDistances(data,classAssignments,kernel);%implement
    ClassAssignmentsChanged=true;
    classAt=cell(0);
    
    iterationCounter=0;
    while ClassAssignmentsChanged
        iterationCounter = iterationCounter+1;       
        distances=GetDistances(k,data,classAssignments,kernel);%calculate new distances
        newClassAssignments = ClassAssignments(distances);%make new classAssignments
        ClassAssignmentsChanged = IsClassAssignmentsChanged(...
            newClassAssignments,classAssignments);
        classAssignments=newClassAssignments;
        if nnz(iterationCounter==retrieveDataAt)
            classAt{1,numel(classAt)+1}=iterationCounter;
            classAt{2,numel(classAt)+1}=classAssignments;
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

%implement. TODO
function [distances] = GetDistances(k,data,classAssignments,kernel)
    nData=size(data,2);
    distances=zeros(k,nData);
    %generate K-matrix
    K=zeros(nData);
    for i=1:nData
        for j=1:nData
            K(i,j)=kernel(data(:,i),data(:,j));
            
        end
    end
    
    Z=zeros(nData,k);
    for c=1:numel(classAssignments)
        Z(c,classAssignments(c))=1;
    end
    
    for n=1:nData
        for k_=1:k
            %implement.
            distances(n,k_)=K(n,n)...
                -2*(1/N)*dot(K(k_,:), Z(:,k_)) + ;
        end
    end
        
end
