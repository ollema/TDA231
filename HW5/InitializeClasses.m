function [ClassAssignments,idx] = InitializeClasses(data,k)
    idx= datasample(1:size(data,2),k,'Replace',false);
    initialPoints = data(:,idx);
    distances=GetDistances(data,initialPoints);
    [~,ClassAssignments] = min(distances);
    
end

function distances = GetDistances(data,initialPoints)
    nData=size(data,2);
    k=size(initialPoints,2);
    distances = zeros(k,nData);
    for i=1:k
        tmp=data-initialPoints(:,i);
        distances(i,:)=sum(tmp.*tmp);
    end   
end
