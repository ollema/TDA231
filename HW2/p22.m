%% Problem 2.2
%load data
clc, clear all
load('digits.mat')
dataDigit5=data(:,:,5)';%since the format of the data is different in 2.1
dataDigit8=data(:,:,8)';

%% a)
clc
classPredicitions=new_classifier([dataDigit5;dataDigit8],dataDigit5,dataDigit8);
class=[ones(size(dataDigit5,1),1);-ones(size(dataDigit8,1),1)];
percentageError=nnz(classPredicitions~=class)/(numel(class))

%% Raw data d1)
clc
x1=dataDigit5;
x2=dataDigit8;
KFoldCrossValidation(@(x,y,z)sph_bayes(x,y,z),x1,x2,5)
KFoldCrossValidation(@(x,y,z)new_classifier(x,y,z),x1,x2,5)
KFoldCrossValidation(@(x,y,z)bae_bayes(x,y,z),x1,x2,5)
%% new FeatureVector d2)
clc
format long
dataDigit5=dataDigit5/255;
dataDigit8=dataDigit8/255;
nData=size(dataDigit5,1);

featureVectors5=zeros(nData,32);
featureVectors8=featureVectors5;

%produce new data/featureVectors
for i=1:nData
    featureVectors5(i,:)=GetNewFeatureVector(dataDigit5(i,:));
    featureVectors8(i,:)=GetNewFeatureVector(dataDigit8(i,:));
end

x1=featureVectors5;
x2=featureVectors8;
KFoldCrossValidation(@(x,y,z)sph_bayes(x,y,z),x1,x2,5)
KFoldCrossValidation(@(x,y,z)new_classifier(x,y,z),x1,x2,5)
KFoldCrossValidation(@(x,y,z)bae_bayes(x,y,z),x1,x2,5)
