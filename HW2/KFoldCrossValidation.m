function [ percentageError ] = KFoldCrossValidation(classifier,x1,x2,k)
    %Could be written more generally, such that it could be
    %p different classes. This version is limited to 2 classes.
    
    nFractions=k;
    nDataX1=size(x1,1);
    nDataX2=size(x2,1);

    percentageError=0;
    for i=1:nFractions

        LLX1=floor(1+(i-1)*nDataX1/nFractions);
        ULX1=floor(i*nDataX1/nFractions);
        verificationDataX1=x1(LLX1:ULX1,:);
        trainingDataX1=x1;
        trainingDataX1(LLX1:ULX1,:)=[];
        classX1=ones(size(verificationDataX1,1),1);

        LLX2=floor(1+(i-1)*nDataX2/nFractions);
        ULX2=floor(i*nDataX2/nFractions);
        verificationDataX2=x2(LLX2:ULX2,:);
        trainingDataX2=x2;
        trainingDataX2(LLX2:ULX2,:)=[];
        classX2=-ones(size(verificationDataX2,1),1);

        verificationData=[verificationDataX1;verificationDataX2];
        predictionClass=classifier(verificationData,trainingDataX1,trainingDataX2);
        classes=[classX1;classX2];
        percentageError=percentageError+nnz(classes~=predictionClass)/(nFractions*size(classes,1));
    end
    
end

