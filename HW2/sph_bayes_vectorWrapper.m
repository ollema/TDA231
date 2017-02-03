function [class] = sph_bayes_vectorWrapper(data,mu1,mu2,cov1,cov2)
    nData=size(data,1);
    class=zeros(nData,1);
    for i=1:nData
        [~,~,class(i)]=sph_bayes(data(i,:),mu1,mu2,cov1,cov2);
    end 

end

