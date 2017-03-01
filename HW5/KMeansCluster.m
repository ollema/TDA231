function [out,musAt] = KMeansCluster(kernel,data,initialMus,retrieveDataAt)

    mus=initialMus;
    distances=GetDistances(data,mus,kernel);%implement
    classAssignments=CalculateClassAssignments(distances);%implement
    ClassAssignmentsChanged=true;
    musAt=cell(0);
    
    iterationCounter=0;
    while ClassAssignmentsChanged
        iterationCounter = iterationCounter+1;
        %update the mu vectors        
        distances=GetDistances(data,mus,kernel);%calculate new distances
        newClassAssignments = ClassAssignments(distances);%make new classAssignments
        ClassAssignmentsChanged = IsClassAssignmentsChanged(...
            newClassAssignments,classAssignments);
        classAssignments=newClassAssignments;
        if nnz(iterationCounter==retrieveDataAt)
            musAt{1,numel(musAt)+1}=classAssignments;
            musAt{2,numel(mustAt)+1}=mus;
        end
    end
    
    out=cell(0);
    out{1,1}=classAssignments;
    out{2,1}=mus;

end

%% Internal funcitons, not supposed to be used anywhere else than in KMeansCluster

%implement
function [ClassAssignments] = CalculateClassAssignments(distances)
    ClassAssignments = 0;
end

%implement
function [ClassAssignmentsChanged] = IsClassAssignmentsChanged(...
    newClassAssignment,classAssignment)
    ClassAssignmentsChanged=true;
end