%% Problem 2.1
% Load data
clc, clear
data = load('d1b.mat');
x = data.X;
y = data.Y;

%% Train SVM
clc, clf
for i = 1:2
    subplot(1,2,i)
    c = 0.01 * 10^i;
    % train the svm
    svm = svmtrain(x,y,'AutoScale',false, 'BoxConstraint', c);
    hold on
    axis equal
    str = sprintf('Box-constraint parameter C = %.1f', c);
    title(str)
    % bias and support vectors are given by the model directly
    bias = svm.Bias
    sv = svm.SupportVectors;
    % first, plot the support vectors
    plot(sv(:,1),sv(:,2),'ko','MarkerSize',10, 'LineWidth', 1)
    % plot all of the points with class
    gscatter(x(:,1),x(:,2),y,['r' 'b'])

    % calculate weights from alpha * support vectors
    w1 = svm.Alpha'*sv(:,1);
    w2 = svm.Alpha'*sv(:,2);
    % soft margin from eq. 5.12
    soft_margin = 2/norm([w1 w2])

    % slope of hyperplane
    a = -w1/w2;
    b = -svm.Bias/w2;

    xx = linspace(-4,4);
    yy = a*xx + b;
    yl = a*xx + b - soft_margin/2*sqrt(1+a^2);
    yu = a*xx + b + soft_margin/2*sqrt(1+a^2);
    plot(xx, yy, '-k', 'LineWidth', 1)
    plot(xx, yl, '--k', 'LineWidth', 1)
    plot(xx, yu, '--k', 'LineWidth', 1)


    % then, any point which could not be separated
    test = svmclassify(svm, x);
    miss = x(y ~= test, :);
    plot(miss(:,1), miss(:,2),'kd','MarkerSize',18, 'LineWidth', 2)
end


%% Problem 2.2
% Load data
clc, clear
data = load('d2.mat');
x = data.X;
y = data.Y;

%% a)
clf
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', true, 'BoxConstraint', 1);
hold on
% then, any point which could not be separated
test = svmclassify(svm, x);
miss = x(y ~= test, :);
plot(miss(:,1), miss(:,2),'kd','MarkerSize',10, 'LineWidth', 1)
set(svm.FigureHandles{2}(1),'Color','blue','Marker', '.','MarkerSize',10)
set(svm.FigureHandles{2}(2),'Color','red','Marker', '.','MarkerSize',10)

%% b)
clc
results = zeros(3,4);
repetitions = 10;
kernels = {'linear', 'quadratic', 'rbf'};
methods = {'QP', 'SMO'};
fold = 5;
dataSize = size(x,1);

for i = 1:3
    kernel = kernels{i};
    for j = 1:2
        method = methods{j};
        mcr = 0;
        time = 0;
        classf = @(XTRAIN, ytrain,XTEST)(svm_class(XTEST,XTRAIN,ytrain, method, kernel));
        for k = 1:repetitions
            %tic
            %mcr = mcr + crossval('mcr',x,y,'predfun',classf,'kfold',5);
            mcr_acc = 0;
            tic
            for f = 1:fold
                ll = floor(1+(i-1)*dataSize/fold);
                ul = floor(i*dataSize/fold);
                XTEST = x(ll:ul, :);
                XTRAIN = x;
                XTRAIN(ll:ul, :) = [];
                ytrain = y;
                ytrain(ll:ul, :) = [];
                res = svm_class(XTEST,XTRAIN,ytrain, method, kernel);
                mcr_acc = mcr_acc + nnz(y(ll:ul, :) ~= res)/(dataSize/fold);
            end
            mcr = mcr + mcr_acc/fold;
            time = time + toc/fold;
        end
        results(i,j) = mcr/repetitions;
        results(i,j+2) = time/repetitions;
    end
end

KernelNames = {'linear'; 'quadratic'; 'rbf'};
McrQP = results(:,1);
McrSMO = results(:,2);
TimeQP = results(:,3);
TimeSMO = results(:,4);
T = table(McrQP,TimeQP,McrSMO,TimeSMO,'RowNames',KernelNames)
%% c)
clf
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', true, 'BoxConstraint', 1, 'kernel_function', 'quadratic');
test = svmclassify(svm, x);
miss = x(y ~= test, :);
plot(miss(:,1), miss(:,2),'ko','MarkerSize',13, 'LineWidth', 1)
set(svm.FigureHandles{2}(1),'Color','blue','Marker', '.','MarkerSize',10)
set(svm.FigureHandles{2}(2),'Color','red','Marker', '.','MarkerSize',10)

