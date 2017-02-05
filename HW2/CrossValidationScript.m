nFractions=5;
nDataX1=size(x1,1);
nDataX2=size(x2,1);

percentageError1=0;
percentageError2=0;

for i=1:nFractions
   
    LLX1=floor(1+(i-1)*nDataX1/nFractions);
    ULX1=floor(i*nDataX1/nFractions);
    verificationDataX1=x1(LLX1:ULX1,:);
    trainingDataX1=x1;
    trainingDataX1(LLX1:ULX1,:)=[];
    classX1=ones(size(verificationDataX1,1),1);
    mu1 = mean(trainingDataX1);
    sigma1 = mean(diag(cov(trainingDataX1)));
    
    LLX2=floor(1+(i-1)*nDataX2/nFractions);
    ULX2=floor(i*nDataX2/nFractions);
    verificationDataX2=x2(LLX2:ULX2,:);
    trainingDataX2=x2;
    trainingDataX2(LLX2:ULX2,:)=[];
    classX2=-ones(size(verificationDataX2,1),1);
    mu2 = mean(trainingDataX2);
    sigma2 = mean(diag(cov(trainingDataX2)));
    
    verificationData=[verificationDataX1;verificationDataX2];
    predictionClass1=new_classifier(verificationData,mu1,mu2);
    [~,~,predictionClass2] =sph_bayes(verificationData,mu1,mu2,sigma1,sigma2);
    classes=[classX1;classX2];
    percentageError1=percentageError1+nnz(classes~=predictionClass1)/(nFractions*size(classes,1));
    percentageError2=percentageError2+nnz(classes~=predictionClass2)/(nFractions*size(classes,1));
end
disp(percentageError1)
disp(percentageError2)
