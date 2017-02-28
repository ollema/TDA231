%% Problem 2.1
% Load data
clc, clear
data = load('d1b.mat');
x = data.X;
y = data.Y;

%% Train SVM
clc, clf
results = zeros(4,2);
for i = 1:4
    subplot(2,2,i)
    c = 0.01 * 10^i;
    % train the svm
    svm = svmtrain(x,y,'AutoScale',false, 'BoxConstraint', c);
    hold on
    axis equal
    str = sprintf('Box-constraint parameter C = %.1f', c);
    title(str)
    % bias and support vectors are given by the model directly
    results(i,1) = svm.Bias;
    sv = svm.SupportVectors;
    % first, plot the support vectors
    plot(sv(:,1),sv(:,2),'ko','MarkerSize',8, 'LineWidth', 1)
    % plot all of the points with class
    gscatter(x(:,1),x(:,2),y,['r' 'b'],['.' '.'], 12, 'off')

    % calculate weights from alpha * support vectors
    w1 = svm.Alpha'*sv(:,1);
    w2 = svm.Alpha'*sv(:,2);
    % soft margin from eq. 5.12
    soft_margin = 2/norm([w1 w2]);
    results(i,2) = soft_margin;

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
    plot(miss(:,1), miss(:,2),'md','MarkerSize',12, 'LineWidth', 2)
end
BoxParams = {'C=0.1'; 'C=1'; 'C=10'; 'C=100'};
bias = results(:,1);
soft_margin = results(:,2);
T = table(bias, soft_margin,'RowNames',BoxParams');
disp(T)




%% Problem 2.2
% Load data
clc, clear, clf
data = load('d2.mat');
x = data.X;
y = data.Y;

%% a)
clf
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', true, 'BoxConstraint', 1);
hold on
test = svmclassify(svm, x);
miss = x(y ~= test, :);
plot(miss(:,1), miss(:,2),'md','MarkerSize',12, 'LineWidth', 2)
set(svm.FigureHandles{2}(1),'Color','blue','Marker', '.','MarkerSize',12)
set(svm.FigureHandles{2}(2),'Color','red','Marker', '.','MarkerSize',12)
set(svm.FigureHandles{3}(1),'Color','k','Marker', 'o','MarkerSize',8, 'LineWidth', 2)

%% b)
clc
% set parameters
c = 10;
repetitions = 10;
kernels = {'linear', 'quadratic', 'rbf'};
methods = {'QP', 'SMO'};
fold = 5;

dataSize = size(x,1);
results = zeros(size(kernels,2),4);

for i = 1:size(kernels,2)
    kernel = kernels{i};
    for j = 1:2
        method = methods{j};
        mcr = 0;
        time = 0;
        classf = @(XTRAIN, ytrain,XTEST)(svm_class(XTEST,XTRAIN,ytrain, method, kernel, c));
        for k = 1:repetitions
            tic
            mcr = mcr + crossval('mcr',x,y,'predfun',classf,'kfold',5);
            time = time + toc;
        end
        results(i,j) = mcr/repetitions;
        results(i,j+2) = time/repetitions;
    end
end

% output results
McrQP = results(:,1);
McrSMO = results(:,2);
TimeQP = results(:,3);
TimeSMO = results(:,4);
T = table(McrQP,TimeQP,McrSMO,TimeSMO,'RowNames',kernels');
disp(c)
disp(T)
%% c)
clf
svm = svmtrain(x,y,'AutoScale',false, 'ShowPlot', true, 'BoxConstraint', 1, 'kernel_function', 'rbf');
hold on
test = svmclassify(svm, x);
miss = x(y ~= test, :);
plot(miss(:,1), miss(:,2),'md','MarkerSize',12, 'LineWidth', 2)
set(svm.FigureHandles{2}(1),'Color','blue','Marker', '.','MarkerSize',12)
set(svm.FigureHandles{2}(2),'Color','red','Marker', '.','MarkerSize',12)
set(svm.FigureHandles{3}(1),'Color','k','Marker', 'o','MarkerSize',8, 'LineWidth', 2)

