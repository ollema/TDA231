function res = svm_class(XTEST,XTRAIN,ytrain, method, kn)
svm = svmtrain(XTRAIN,ytrain,'AutoScale',true, 'ShowPlot', false, 'BoxConstraint', 1, 'method', method, 'kernel_function', kn);
res = svmclassify(svm, XTEST);
