function res = svm_class(XTEST,XTRAIN,ytrain, method, kn, c)
svm = svmtrain(XTRAIN,ytrain,'AutoScale',true, 'ShowPlot', false, 'BoxConstraint', c, 'method', method, 'kernel_function', kn);
res = svmclassify(svm, XTEST);
