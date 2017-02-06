function [Ytest] = new_classifier(xTest,trainingDataX1,...
    trainingDataX2)
    
    mu1=mean(trainingDataX1);
    mu2=mean(trainingDataX2);

    nSamples=size(xTest,1); %each sample comes as columns
    b = 1/2*(mu1+mu2);
    diff=(mu1-mu2);
    Ytest=sign(sum(repmat(diff,nSamples,1)...
        .*(xTest-repmat(b,nSamples,1)),2)/norm(diff));
end